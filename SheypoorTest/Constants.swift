//
//  Constants.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//



import Foundation
import UIKit

struct Constants {
    
    struct Cache {
        static let imageCache = NSCache<AnyObject, AnyObject>()
    }
    
    
    struct ApiConstants {
        
        #if DEBUG
        static let baseURLString = "http://api.tvmaze.com"
        static let imageURLString = "http://api.tvmaze.com"
        #else
        static let baseURLString = "http://api.tvmaze.com"
        static let imageURLString = "http://api.tvmaze.com"
        
        #endif
        
        static let giphyApiKey = "http://api.tvmaze.com"
    }
    
    struct UserDefaults {
        static let moviewID = "id"
        static let imgURL = "img"
    }

    

}


