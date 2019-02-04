

import UIKit
import Material
import GoogleMaps
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        GMSServices.provideAPIKey("AIzaSyAtNWBgw3qWtThAYqyCdT1dIflApdzBhfg")
        window = UIWindow(frame: Screen.bounds)
        
        let mvc = MapViewController()
        let nav = AppNavigationController(rootViewController:mvc)
        
        let vc = ListViewController()
        let nav2 = AppNavigationController(rootViewController:vc)
        
        let rc = RemindersViewController()
        let nav3 = AppNavigationController(rootViewController:rc)
        
        // go to main page
        let appBottomNavigationController = AppBottomNavigationController(viewControllers: [nav,nav2,nav3])
        window!.rootViewController = appBottomNavigationController
//
//

//        let sc = SearchViewController()
//        let nav3 = AppNavigationController(rootViewController:sc)
//
//        let rc = RemindersViewController()
//        let nav4 = AppNavigationController(rootViewController:rc)
//        nav4.tabBarItem.image = Icon.cm.bell?.tint(with: Color.blueGrey.base)
//        nav4.tabBarItem.selectedImage = Icon.cm.bell?.tint(with: Color.blue.base)
//
 
        
        //        let appBottomNavigationController = AppBottomNavigationController(viewControllers: [PhotoViewController(),
        //                                                        VideoViewController(),
        //                                                        AudioViewController(),
        //                                                        RemindersViewController(),
        //                                                        SearchViewController()])
        
        
        //        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //
        //        UINavigationBar.appearance().barTintColor = UIColor.blue
        //        UINavigationBar.appearance().tintColor = UIColor.white
        //        //White status font
        //        UINavigationBar.appearance().barStyle = UIBarStyle.blackTranslucent
        
        window!.makeKeyAndVisible()
    }
    
}

