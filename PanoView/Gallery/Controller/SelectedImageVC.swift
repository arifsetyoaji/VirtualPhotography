//
//  SelectedImageVC.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 14/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit

class SelectedImageVC: UIViewController {

    @IBOutlet weak var selectedImageView: UIImageView!
    
    var selectedImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = selectedImageName {
            selectedImageView.image = UIImage(named: imageName)
        }
        
    }

}
