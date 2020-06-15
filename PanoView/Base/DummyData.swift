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
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Talkeetna, Alaska", source: "Bryan Goff, Unsplash.com"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Grass Field, Miami", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Key Biscayne, Florida", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)4", category: "\(category)", place: "Lands End Trail, San Fransisco", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)5", category: "\(category)", place: "Larsen Peak, Quintarastreet", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)6", category: "\(category)", place: "Larsen Peak, Quintarastreet", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)7", category: "\(category)", place: "Larskspur, California", source: "Pixexid.com"))
            return arrayPhoto
        case 2:
            category = Constants.Categories.Building.rawValue
            //arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "European Southern Observaroty HQ, Germany", source: "ESO.org"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Building 3", source: "Pixexid.com"))
            //arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "European Southern Observaroty HQ, Germany", source: "C. Malin / ESO"))
            arrayPhoto.append(Photos(imageName: "\(category)4", category: "\(category)", place: "European Southern Observaroty HQ, Germany", source: "C. Malin / ESO"))
            return arrayPhoto
        case 3:
            category = Constants.Categories.Country.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Venice", source: "Area 55 Studio"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Taj Mahal, India", source: "taj-mahal.net"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Miami Harbor, Miami", source: "Pixexid.com"))
            return arrayPhoto
        case 4:
            category = Constants.Categories.Street.rawValue
            arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "Lombard Street, San Francisco", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Rincon Park, San Fransisco", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Golden Gate Bridge, San Fransisco", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)4", category: "\(category)", place: "Miami Street, Miami", source: "Pixexid.com"))
            arrayPhoto.append(Photos(imageName: "\(category)5", category: "\(category)", place: "Bayside Court, Miami", source: "Pixexid.com"))
            return arrayPhoto
        case 5:
            category = Constants.Categories.Indoor.rawValue
            //arrayPhoto.append(Photos(imageName: "\(category)1", category: "\(category)", place: "ABC Building", source: "ESO.org"))
            arrayPhoto.append(Photos(imageName: "\(category)2", category: "\(category)", place: "Restaurant", source: "Pixexid.com"))
            //arrayPhoto.append(Photos(imageName: "\(category)3", category: "\(category)", place: "Brammer Residencia", source: "Pixexid.com"))
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
