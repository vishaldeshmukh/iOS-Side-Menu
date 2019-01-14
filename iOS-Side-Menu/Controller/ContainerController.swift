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
    var navController: UIViewController!
    var isExpanded = false
    
    //MARK:- init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    //MARK:- Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    //MARK:- Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        navController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(navController.view)
        addChild(navController)
        navController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuViewController == nil {
            //add menu view controller here
            menuViewController = MenuViewController()
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            //Show Menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.navController.view.frame.origin.x = self.navController.view.frame.width - 80
            }, completion: nil)
            
        } else {
            //Hide Menu
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                 self.navController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
            case .Profile: print("Profile")
            case .Inbox:print("Inbox")
            case .Notifications:print("Notifications")
            case .Settings:print("Settings")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}

extension ContainerController : HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
     
}

