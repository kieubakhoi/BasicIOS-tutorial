//
//  SceneDelegate.swift
//  BasicIOS-tutorial-MVVM
//
//  Created by Apple on 02/08/2021.
//

import UIKit

enum TypeScreen {
    case login
    case tabbar
}
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        
        changeScreen(type: .login)
       
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
    private func createTabbar() {
        // make tabbars
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        // System  tabbar item
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        // Message
        let messageVC = MessagesViewController()
        let messageNavi = UINavigationController(rootViewController: messageVC)
        // custom tabbar item
        messageVC.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "message"), tag: 1)
        messageNavi.tabBarItem.badgeValue = "12"
        messageNavi.tabBarItem.badgeColor = .blue
        
        // Friends
        let friendVC = FriendsViewController()
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
        tabbarController.tabBar.tintColor = .red
        
        window!.rootViewController = tabbarController
    }
    private func createLogin() {
        let loginVC = LoginViewController()
        let loginNavi = BaseNavigationController(rootViewController: loginVC)
        
        window?.rootViewController = loginNavi
    }
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }
    
}
extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}

