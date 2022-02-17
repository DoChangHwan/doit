//
//  MainTabBarController.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/17.
//
import UIKit


class MainTabBarController: UITabBarController {
    // Todo: UIViewController 4개
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = generateTapBarController(vc: HomeViewController(), title: "Home")
        let vc2 = generateTapBarController(vc: HomeViewController(), title: "Second")
        let vc3 = generateTapBarController(vc: HomeViewController(), title: "Third")
        let vc4 = generateTapBarController(vc: HomeViewController(), title: "Fourth")

        UINavigationBar.appearance().prefersLargeTitles =  true
        viewControllers = [vc1, vc2, vc3, vc4]
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "airplayaudio"), tag: 0)
        let thirdTabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "folder"), tag: 0)
        let fourthTabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "trash"), tag: 0)
        
        vc1.tabBarItem = homeTabBarItem
        vc2.tabBarItem = secondTabBarItem
        vc3.tabBarItem = thirdTabBarItem
        vc4.tabBarItem = fourthTabBarItem
        
    }
    
    fileprivate func generateTapBarController(vc: UIViewController, title: String) ->
        UINavigationController {
            vc.navigationItem.title = title
            let navController = UINavigationController(rootViewController: vc)
            navController.title = title
            return navController
    }
}
