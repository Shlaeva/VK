//
//  PicturesCollectionViewController.swift
//  VKApp
//
//  Created by Julie on 14.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "PictureCell"

class PicturesCollectionViewController: UICollectionViewController {

    @IBOutlet var pictureCollection: UICollectionView!
    
    let allPictures: [String:[String]] = [
        "Water" : ["11", "12", "13", "14", "15"],
        "Space" : ["21", "22", "23", "24", "25"],
        "Earth" : ["31", "32", "33", "34"],
        "Sky" : ["41", "42", "43", "44"],
        "Fire": ["51", "52", "53"],
        "Eagle": ["61", "62", "63", "64", "65", "66"]]
    
    
    var key: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPictures[key]!.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCollectionViewCell
        
        cell.picture.image = UIImage(named: allPictures[key]![indexPath.row])
    
        return cell
    }



}
