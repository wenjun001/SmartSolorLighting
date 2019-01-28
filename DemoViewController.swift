//
//  DemoViewController.swift
//  BottomNavigationController
//
//  Created by xiu on 1/24/19.
//  Copyright © 2019 CosmicMind. All rights reserved.
//

import UIKit
import Material
class DemoViewController: UIViewController {

    override func viewDidLoad() {
        print("DemoViewController")
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        self.preapreButton()
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
        self.dismiss(animated: true) {
            
        }
            
        }
        //        let vc = DemoViewController()
        //
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        print("done")
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
