
import UIKit
import Material

class ListViewController: UITableViewController{
    
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "My Trailer"
        //navigationItem.detailLabel.text = "View yours smart solar tailer"
        
        //        navigationItem.leftViews = [menuButton]
        //        navigationItem.rightViews = [starButton, searchButton]
        print("prepareNavigationItem done")
    }
    
    
    
    let trailerlId = "bandCellId"
    
    let trailerArray = [Info(image: "charging", title: "trailer A"),
                        Info(image: "two", title: "trailer B"),
                        Info(image: "five", title: "trailer C"),
                        Info(image: "four", title: "trailer D"),
                        Info(image: "zero", title: "Strailer E"),
                        Info(image: "one", title: "Strailer F")]
    
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        prepareTabBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BandCell.self, forCellReuseIdentifier: trailerlId)
 
         prepareNavigationItem()
    }
    

    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailerArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: trailerlId, for: indexPath) as! BandCell
        cell.myTableViewController = self
        cell.pictureImageView.image = UIImage(named: trailerArray[indexPath.item].image!)
        cell.titleLabel.text = trailerArray[indexPath.item].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Top Bands"
    //    }
    
    func deleteCell(cell: UITableViewCell) {
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            
            print(deletionIndexPath.row)
            //            items.removeAtIndex(deletionIndexPath.row)
            //            tableView.deleteRowsAtIndexPaths([deletionIndexPath], withRowAnimation: .Automatic)
            
                    let vc = TrailerDetailViewController()
            
                    self.navigationController?.pushViewController(vc, animated: true)
                    print("done")
        }
    }
    
    
    
}

class BandCell: UITableViewCell {
    var myTableViewController: ListViewController?
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Detail", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(actionButton)
        
        
        actionButton.addTarget(self, action: #selector(handleAction(button:)), for: .touchUpInside)
        
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        
        pictureImageView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
        
        actionButton.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 200, paddingBottom: 0, paddingRight: 0, height: 60)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc
    internal func handleAction(button: UIButton) {
        myTableViewController?.deleteCell(cell: self)
    }
    
}

extension UIView {
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 3
    }
    
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                   paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
}

public extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

struct Info {
    var image: String?
    var title: String?
}
extension ListViewController {
    fileprivate func prepareTabBarItem() {
        tabBarItem.image = Icon.cm.videocam?.tint(with: Color.blueGrey.base)
        tabBarItem.selectedImage = Icon.cm.videocam?.tint(with: Color.blue.base)
    }
}
