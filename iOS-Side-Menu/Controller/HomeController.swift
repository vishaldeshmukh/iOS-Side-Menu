//
//  HomeController.swift
//  iOS-Side-Menu
//
//  Created by Vishwanath Deshmukh on 14/01/2019.
//  Copyright © 2019 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK:- Properties
    
    var delegate: HomeControllerDelegate?
    
    //MARK:- init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    //MARK:- Handlers
    
   
    func configureNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .darkGray
        self.navigationController?.navigationBar.barStyle = .black // to make navigation contents white
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    
    
}
