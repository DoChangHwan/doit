//
//  MainTabBarController.swift
//  Ministock
//
//  Created by dochanghwan on 2022/02/17.
//
import UIKit


class MainTabBarController: UITabBarController {

    private lazy var homeViewController: UIViewController = {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }()
    
    private lazy var secondViewController: UIViewController = {
        let secondVC = UIViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "airplayaudio"), tag: 1)
        return UINavigationController(rootViewController: secondVC)
    }()
    
    private lazy var thirdtViewController: UIViewController = {
        let thirdVC = UIViewController()
        thirdVC.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "folder"), tag: 2)
        return UINavigationController(rootViewController: thirdVC)
    }()
    
    private lazy var fourthViewController: UIViewController = {
        let fourthVC = UIViewController()
        fourthVC.tabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "trash"), tag: 3)
        return UINavigationController(rootViewController: fourthVC)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController, secondViewController, thirdtViewController, fourthViewController]
    }
    
}
