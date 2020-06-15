//
//  Extension.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 11/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    func getViewContext()-> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
}
