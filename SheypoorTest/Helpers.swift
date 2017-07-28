//
//  Helpers.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//


import UIKit
import Foundation
import MBProgressHUD
import SwiftyJSON



class Helpers {
    
    // MARK: - UI Helpers
    static func alertWithTitle(_ viewController: UIViewController, title: String!, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
        }
        
        alert.addAction(action)
        viewController.present(alert, animated: true, completion:nil)
    }
    
 
    
    static func showLoadingHubWithTitle(_ viewController: UIViewController, labelTitle: String) {
        let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
        hud?.labelText = labelTitle
    }
    
    static func showImageUploadLoadingHUD(_ viewController: UIViewController) {
        let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
        hud?.labelText = " در حال اپلود عکس شما..."
    }
    
    static func showLoadingHUD(_ viewController: UIViewController) {
        let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
        hud?.labelText = ""
    }
    
    static func hideLoadingHUD(_ viewController: UIViewController) {
        MBProgressHUD.hideAllHUDs(for: viewController.view, animated: true)
    }

}



