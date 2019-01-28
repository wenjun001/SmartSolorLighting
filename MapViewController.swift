
import UIKit
import Material
import GoogleMaps
import SnapKit
struct ButtonLayout {
    struct Flat {
        static let width: CGFloat = 120
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -150
    }
    
    struct Raised {
        static let width: CGFloat = 150
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -75
    }
    
    struct Fab {
        static let diameter: CGFloat = 48
    }
    
    struct Icon {
        static let width: CGFloat = 120
        static let height: CGFloat = 48
        static let offsetY: CGFloat = 75
    }
}


class MapViewController: UIViewController , GMSMapViewDelegate  {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        prepareTabBarItem()
    }
      
    
    fileprivate var menuButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    fileprivate var fabButton: FABButton!
       
        
//    func mapView(mapView: GMSMapView!, _:didTap marker: GMSMarker!) -> Bool {
//        print("tap")
//        return false
//    }
//
    
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool
//    {
//         print("tap---")
//        // do something
//        return true
//    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print(marker.title!)
        print(marker.snippet!)
    }
    func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu)
    }
    
    func prepareStarButton() {
        starButton = IconButton(image: Icon.cm.star)
    }
    
    func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search)
    }
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Map View"
        navigationItem.detailLabel.text = "View yours smart solar tailer"
        
        navigationItem.leftViews = [menuButton]
        navigationItem.rightViews = [starButton, searchButton]
        print("prepareNavigationItem done")
    }
    
    
//    func setNavigationBar() {
//        let screenSize: CGRect = UIScreen.main.bounds
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
//        let navItem = UINavigationItem(title: "")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
//        navItem.rightBarButtonItem = doneItem
//        navBar.setItems([navItem], animated: false)
//        self.view.addSubview(navBar)
//    }
    
    @objc func done() { // remove @objc for Swift 3
        
    }
//let v1 = UIView()
//
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.white
        prepareMap()
 //       self.preapreButton()
//        self.title = "photo"
 
 
        //        setNavigationBar()
        prepareMenuButton()
        prepareStarButton()
        prepareSearchButton()
        prepareNavigationItem()
        //prepareFABButton()
        
        
        
        
    }
    
    func prepareMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.1, longitude: -122, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.1, longitude: -122)
        marker.title = "SunnyVale"
        marker.snippet = "CA"
        marker.map = mapView
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.width.equalTo(400)
            make.height.equalTo(900)
            make.center.equalTo(view)
        }
        
        
        
        
    }
    
    func preapreButton(){
        let button = RaisedButton(title: "Raised Button", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.blue.base
        button.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        view.layout(button)
            .width(ButtonLayout.Raised.width)
            .height(ButtonLayout.Raised.height)
            .center(offsetY: ButtonLayout.Raised.offsetY)
      
    }
    
    @objc
    internal func handleResignResponderButton(button: UIButton) {
//        self.present(DemoViewController(), animated: true) {
//
//        }
        let vc = SearchViewController()
//
        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        if let tabBarController = self.rootViewController as? UITabBarController {
//            tabBarController.selectedIndex = 1
//        }
//        self.tabBarController?.selectedIndex = 3
//        if( == nil){
//            print("navigationController is nil")
//        }
        if(self.navigationController == nil){
            print("navigationController is nil")
        }else{
            
            self.tabsController?.select(at: 3)
        }
        
        print("done")
        
        
    }
    
}

extension MapViewController {
    fileprivate func prepareTabBarItem() {
        tabBarItem.image = Icon.cm.photoCamera?.tint(with: Color.blueGrey.base)
        tabBarItem.selectedImage = Icon.cm.photoCamera?.tint(with: Color.blue.base)
    }
}
