//
//  PhotoCategoryCell.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 12/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit

class PhotoCategoryCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupImage()
        setupPlaceLabel()
    }
    
    func setupImage(){
        backgroundImage.layer.masksToBounds = false
        backgroundImage.layer.shadowColor = UIColor.black.cgColor
        backgroundImage.layer.shadowRadius = 5
        backgroundImage.layer.shadowOpacity = 0.7
        backgroundImage.layer.shadowOffset = CGSize(width: 2, height: 5)
    }
    
    func setupPlaceLabel(){
        placeLabel.layer.masksToBounds = false
        placeLabel.layer.shadowColor = UIColor.black.cgColor
        placeLabel.layer.shadowRadius = 2
        placeLabel.layer.shadowOpacity = 0.7
        placeLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
    }
}
