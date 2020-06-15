//
//  SelectedImageVC.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 14/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit
import CoreData

class SelectedImageVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var selectedImageView: UIImageView!
    
    var selectedImage: UIImage?
    var imageIndex: Int?
    
    var AllPhotosPreview = [Capture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPhotos()
        
        if let image = selectedImage {
            selectedImageView.image = image
        }
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        showDeleteActionSheet()
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        guard let image = selectedImage else { return }
        
        let activityView = UIActivityViewController(activityItems: [image ,"Share your photos to other 😎"], applicationActivities: nil)
        activityView.setValue("Panorama View", forKey: "subject")
        self.present(activityView, animated: true)
    }
    
    
}

extension SelectedImageVC {
    
    func loadPhotos(){
        
        do {
            let request: NSFetchRequest<Capture> = Capture.fetchRequest()
            AllPhotosPreview = try context.fetch(request)
            print("Fetch photos")
        } catch {
            print("Error when fetch photos from context \(error)")
        }
    }
    
    func saveItem(){
        do {
            try context.save()
            print("Save photos success!")
        } catch {
            print("Error when save image --- \(error)")
        }
    }
    
    func showDeleteActionSheet(){
        
        let actionSheet = UIAlertController(title: "Delete Photo", message: "Are you sure delete this photo?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        let delete = UIAlertAction(title: "Delete", style: .default) { (action) in
            
            if let index = self.imageIndex {
                self.context.delete(self.AllPhotosPreview[index])
                
                self.saveItem()
            }
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}
