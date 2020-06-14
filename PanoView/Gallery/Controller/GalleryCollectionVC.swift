//
//  GalleryCollectionVC.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 14/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GalleryCollectionVC: UICollectionViewController {

    //Load All Dummy Photos
    var AllPhotos: [Photos] = DummyData.init().dataPhotos(categoryId: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return AllPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryCollectionCell
    
        guard let imageName = AllPhotos[indexPath.row].imageName else {
            fatalError("Failed to load image name")
        }
        
        cell.imageViewCell.image = UIImage(named: imageName)
    
        return cell
    }
    

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print( "selected image at row \(indexPath.row)" )
        
        if let destinationVC = storyboard?.instantiateViewController(identifier: "SelectedImageVC") as? SelectedImageVC {
            
            guard let imageName = AllPhotos[indexPath.row].imageName else {
                fatalError("Failed to load image picked name")
            }
            
            destinationVC.selectedImageName = imageName
            print(imageName)
            
            destinationVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(destinationVC, animated: true)

        }
        
    }

}


// MARK: - Setting Gallery Collection Size

extension GalleryCollectionVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width/3) - 1
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
