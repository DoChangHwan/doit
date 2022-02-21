//
//  MainTabBarController.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/17.
//
import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = generateTapBarController(vc: HomeViewController(), title: "Home")
        let vc2 = generateTapBarController(vc: HomeViewController(), title: "Second")
        let vc3 = generateTapBarController(vc: HomeViewController(), title: "Third")
        let vc4 = generateTapBarController(vc: HomeViewController(), title: "Fourth")

//        UINavigationBar.appearance().prefersLargeTitles =  true
        viewControllers = [vc1, vc2, vc3, vc4]
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "airplayaudio"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "folder"), tag: 2)
        let fourthTabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "trash"), tag: 3)

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




// Todo: UIViewController 4개
//    private lazy var homeViewController: UINavigationController = {
//        let vc1 = UINavigationController(rootViewController: HomeViewController())
//        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "hosue"), tag: 0)
//        return UINavigationController(rootViewController: vc1)
//    }()
//
//    private lazy var secondViewController: UINavigationController = {
//        let vc2 = UINavigationController(rootViewController: HomeViewController())
//        vc2.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "airplayaudio"), tag: 1)
//        return UINavigationController(rootViewController: vc2)
//    }()
//
//    private lazy var thirdViewController: UINavigationController = {
//        let vc3 = UINavigationController(rootViewController: HomeViewController())
//        vc3.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "folder"), tag: 2)
//        return UINavigationController(rootViewController: vc3)
//    }()
//
//    private lazy var fourthViewController: UINavigationController = {
//        let vc4 = UINavigationController(rootViewController: HomeViewController())
//        vc4.tabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "trash"), tag: 3)
//        return UINavigationController(rootViewController: vc4)
//    }()
