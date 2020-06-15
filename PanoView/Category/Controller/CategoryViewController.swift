//
//  CategoryViewController.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 11/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var photosTableView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let categoryCellClass = "CategoryCell"
    let categoryCellID = "categoryCell"
    let photoCategoryCellClass = "PhotoCategoryCell"
    let photoCategoryCellID = "photoCategoryCellID"
    
    var selectedCategory = 0 {
        didSet{
            categoryCollectionView.reloadData()
            photosTableView.reloadData()
        }
    }
    var photos: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        //setup category collection view
        let nibCollection = UINib(nibName: categoryCellClass, bundle: nil)
        categoryCollectionView.register(nibCollection, forCellWithReuseIdentifier: categoryCellID)
        
        //setup photo category table view
        let nibTable = UINib(nibName: photoCategoryCellClass, bundle: nil)
        photosTableView.register(nibTable, forCellReuseIdentifier: photoCategoryCellID)
        photosTableView.tableFooterView = UIView(frame: .zero)
        
        //set initial All photo
        photos = DummyData.init().dataPhotos(categoryId: 0)
        
        navigationController?.navigationBar.isHidden = true
    }

}

// set collection view category list
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Categories.allValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! CategoryCell
        cell.categoryNameLabel.text = Constants.Categories.allValues[indexPath.row].rawValue
        cell.categoryNameLabel.textColor = UIColor.black
        if selectedCategory == indexPath.row {
            cell.contentView.backgroundColor = UIColor.red
            cell.categoryNameLabel.textColor = UIColor.white
            cell.contentView.layer.borderWidth = 0
        } else {
            cell.contentView.backgroundColor = UIColor.clear
            cell.categoryNameLabel.textColor = UIColor.black
            cell.contentView.layer.borderWidth = 0.5
        }
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.cornerRadius = 11
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        self.selectedCategory = indexPath.row
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.photosTableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
        photos = DummyData.init().dataPhotos(categoryId: selectedCategory)
    }
}

// set table view photo list
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.init().dataPhotos(categoryId: selectedCategory).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = photosTableView.dequeueReusableCell(withIdentifier: photoCategoryCellID, for: indexPath) as! PhotoCategoryCell
        
        let data = DummyData.init().dataPhotos(categoryId: selectedCategory)[indexPath.row]
        cell.contentView.backgroundColor = UIColor.blue
        cell.contentView.layer.cornerRadius = 15
        cell.placeLabel.text = data.place
        cell.sourceLabel.text = "Source: \(data.source ?? "")"
        cell.backgroundImage.image = UIImage(named: data.imageName ?? "")
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        return width
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "tapPhoto", sender: indexPath)
        photosTableView.deselectRow(at: indexPath, animated: true) //dismiss highlight
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tapPhoto" {
            let selectedIndexPath = sender as?NSIndexPath
            let panoramaVC = segue.destination as! PanoramaViewController
            panoramaVC.resourceImage = photos[selectedIndexPath!.row].imageName
        }
    }
}
