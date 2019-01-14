//
//  ContainerController.swift
//  iOS-Side-Menu
//
//  Created by Vishwanath Deshmukh on 14/01/2019.
//  Copyright © 2019 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK:- Properties
    
    var menuViewController: MenuViewController!
    
    //MARK:- init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        let navController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(navController.view)
        addChild(navController)
        navController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuViewController == nil {
            //add menu view controller here
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
}

extension ContainerController : HomeControllerDelegate {
    func handleMenuToggle() {
        configureMenuController()
    }
}
