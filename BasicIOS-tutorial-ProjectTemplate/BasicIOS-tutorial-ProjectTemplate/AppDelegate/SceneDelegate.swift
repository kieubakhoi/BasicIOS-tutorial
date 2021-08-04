//
//  SceneDelegate.swift
//  BasicIOS-tutorial-ProjectTemplate
//
//  Created by Apple on 04/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let vc = HomeViewController()
        let navi = BaseNavigationController(rootViewController: vc)
        window.rootViewController = navi
        
        self.window = window
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

    static func shared()-> SceneDelegate {
        let scene  = UIApplication.shared.connectedScenes.first
        return (scene?.delegate as? SceneDelegate)!
    }
}

