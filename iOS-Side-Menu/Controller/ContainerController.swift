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
        let navController = UINavigationController(rootViewController: HomeController())
        
        view.addSubview(navController.view)
        addChild(navController)
        navController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        
    }
    
}
