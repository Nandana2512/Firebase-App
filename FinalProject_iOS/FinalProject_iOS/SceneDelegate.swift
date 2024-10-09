//
//  SceneDelegate.swift
//  FinalProject_iOS
//

//

import UIKit
import FirebaseCore
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            let board = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = board.instantiateViewController(identifier: "homeTabBarController") as UITabBarController
            window?.rootViewController = tabBar 
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        }
    
    func sceneWillResignActive(_ scene: UIScene) {
          }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
           }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        }
    
    
}

