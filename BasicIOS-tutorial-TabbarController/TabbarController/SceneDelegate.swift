//
//  SceneDelegate.swift
//  TabbarController
//
//  Created by Apple on 02/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // make tabbars
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        // System  tabbar item
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        // Message
        let messageVC = MessageViewController()
        let messageNavi = UINavigationController(rootViewController: messageVC)
        // custom tabbar item
        messageVC.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "message"), tag: 1)
        messageNavi.tabBarItem.badgeValue = "12"
        messageNavi.tabBarItem.badgeColor = .blue
        
        // Friends
        let friendVC = FreindsViewController()
        let friendNavi = UINavigationController(rootViewController: friendVC)
        // custom without title
        friendVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "person"), tag: 2)
        
        // profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "paperplane"), tag: 3)
        
        // make tabbars controller
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, messageNavi, friendNavi, profileNavi]
        window.rootViewController = tabbarController
        tabbarController.tabBar.tintColor = .red
        self.window = window
        window.makeKeyAndVisible()
        

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
extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}

