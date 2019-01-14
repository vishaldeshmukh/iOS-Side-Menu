//
//  MenuOption.swift
//  iOS-Side-Menu
//
//  Created by Vishwanath Deshmukh on 14/01/2019.
//  Copyright © 2019 Vishwanath Deshmukh. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
            case .Profile: return "Profile"
            case .Inbox: return "Inbox"
            case .Notifications: return "Notifications"
            case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
            case .Profile: return UIImage(named: "profile") ?? UIImage()
            case .Inbox: return UIImage(named: "inbox") ?? UIImage()
            case .Notifications: return UIImage(named: "menu") ?? UIImage()
            case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
    
}
