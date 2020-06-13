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
