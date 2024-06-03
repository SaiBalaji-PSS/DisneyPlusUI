//
//  AppSession.swift
//  DisneyPlusUI
//
//  Created by Sai Balaji on 03/06/24.
//

import Foundation
import FirebaseAuth
import UIKit

class AppSession{
    private init(){}
    static var shared = AppSession()
    private var window: UIWindow!
    func start(window: UIWindow){
        self.window = window
        if Auth.auth().currentUser == nil{
            showSignInScreen()
        }
        else{
           showMainTabbar()
        }
    }
    
    func showSignInScreen(){
        if let window{
            if let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController{
                window.rootViewController = UINavigationController(rootViewController: signInVC)
            }
        }
    }
    
    func showMainTabbar(){
        if let mainTabbar = UIStoryboard(name: "MainTabBar", bundle: nil).instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController{
            window.rootViewController = mainTabbar
        }
    }
    
}
