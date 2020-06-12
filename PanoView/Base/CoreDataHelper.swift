//
//  CoreDataHelper.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 11/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataHelper {
    var context: NSManagedObjectContext
    
    func fetchAll<T: NSManagedObject>() -> [T]{
        let request = T.fetchRequest()
        do {
            return try context.fetch(request) as? [T] ?? []
        } catch  {
            return []
        }
    }
}
