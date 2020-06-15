//
//  Constants.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 11/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import Foundation

struct Constants {
    enum Categories: String {
        case All
        case Nature
        case Building
        case Country
        case Street
        case Indoor
        
        static let allValues = [All, Nature, Building, Country, Street, Indoor]
    }
}
