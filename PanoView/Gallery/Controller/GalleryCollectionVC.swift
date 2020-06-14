//
//  GalleryCollectionVC.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 14/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class GalleryCollectionVC: UICollectionViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var AllPhotos = [Capture]()

    //Load All Dummy Photos
    //var AllPhotos: [Photos] = DummyData.init().dataPhotos(categoryId: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadPhotos()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        loadPhotos()
    }


    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return AllPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryCollectionCell
        
        if let imgData = AllPhotos[indexPath.row].image {
            cell.imageViewCell.image = UIImage(data: imgData as Data)
        }
    
        return cell
    }
    

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print( "selected image at row \(indexPath.row)" )
        
        if let destinationVC = storyboard?.instantiateViewController(identifier: "SelectedImageVC") as? SelectedImageVC {
            
            if let imageData = AllPhotos[indexPath.row].image {
                destinationVC.selectedImage = UIImage(data: imageData as Data)
                
                destinationVC.imageIndex = indexPath.row
            }
            
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
    
    
    // Load Photos
    func loadPhotos(){
        
        do {
            let request: NSFetchRequest<Capture> = Capture.fetchRequest()
            AllPhotos = try context.fetch(request)
            print("Fetch photos")
        } catch {
            print("Error when fetch photos from context \(error)")
        }
        
        collectionView.reloadData()
    }
}
