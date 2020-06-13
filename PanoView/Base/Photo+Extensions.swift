//
//  Photo+Extensions.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 11/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import Foundation
import CoreData

struct Photos{
    let imageName: String?
    let place: String?
    let source: String?
    let id: Int?
    let category: String?
    let date: String?
    
    init(imageName: String? = nil, id: Int? = nil,
         category: String? = nil, date: String? = nil,
         place: String? = nil, source: String? = nil) {
        self.imageName = imageName
        self.category = category
        self.id = id
        self.date = date
        self.place = place
        self.source = source
    }
    
    func savePhoto(){
        
    }
    
    func deletePhoto() {
        
    }
}
