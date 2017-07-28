//
//  User.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//


import Foundation
import UIKit

class User: NSObject, ResponseObjectSerializable {

    
    init(auth: String, id: String, verificationProgress: Float) {
    }
    
    required init?(response: HTTPURLResponse, representation: Any) {
        
    }

    static func setId(id: Int) {
        UserDefaults.standard.setValue(id, forKey: Constants.UserDefaults.moviewID)
    }
    
    static func getId() -> Int? {
        return UserDefaults.standard.object(forKey: Constants.UserDefaults.moviewID) as? Int
    }

    static func clearAllData() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
}

