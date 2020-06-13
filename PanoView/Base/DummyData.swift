//
//  DummyData.swift
//  PanoView
//
//  Created by Bimo Sekti Wicaksono on 12/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import Foundation

class DummyData {
    
    func dataPhotos(categoryId: Int) -> [Photos] {
        var arrayPhoto: [Photos] = []
        var category = ""
        switch categoryId {
        case 0:
            return allDataPhoto()
        case 1:
            category = Constants.Categories.Nature.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Nature 1", source: "Dummy Nature 1"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Nature 2", source: "Dummy Nature 2"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Nature 3", source: "Dummy Nature 3"))
            return arrayPhoto
        case 2:
            category = Constants.Categories.Building.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Building 1", source: "Dummy Building 1"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Building 2", source: "Dummy Building 2"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Building 3", source: "Dummy Building 3"))
            return arrayPhoto
        case 3:
            category = Constants.Categories.Country.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Country 1", source: "Dummy Country 1"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Country 2", source: "Dummy Country 2"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Country 3", source: "Dummy Country 3"))
            return arrayPhoto
        case 4:
            category = Constants.Categories.Street.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Street 1", source: "Dummy Street 1"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Street 2", source: "Dummy Street 2"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Street 3", source: "Dummy Street 3"))
            return arrayPhoto
        case 5:
            category = Constants.Categories.Indoor.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Indoor 1", source: "Dummy Indoor 1"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Indoor 2", source: "Dummy Indoor 2"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Indoor 3", source: "Dummy Indoor3"))
            return arrayPhoto
        default:
            category = ""
            return []
        }
    }
    
    func allDataPhoto() -> [Photos] {
        var arrayDataPhoto: [Photos] = []
        arrayDataPhoto.append(contentsOf: dataPhotos(categoryId: 1))
        arrayDataPhoto.append(contentsOf: dataPhotos(categoryId: 2))
        arrayDataPhoto.append(contentsOf: dataPhotos(categoryId: 3))
        arrayDataPhoto.append(contentsOf: dataPhotos(categoryId: 4))
        arrayDataPhoto.append(contentsOf: dataPhotos(categoryId: 5))
        return arrayDataPhoto
    }
}
