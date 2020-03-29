//
//  DogAPI.swift
//  Randog-1.0
//
//  Created by Wolfgang Sigel on 29.03.20.
//  Copyright © 2020 Wolfgang Sigel. All rights reserved.
//

import Foundation

class DogAPI {
    
    enum Endpoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    
}
