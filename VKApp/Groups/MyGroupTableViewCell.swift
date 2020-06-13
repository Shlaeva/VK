//
//  FriendGroupTableViewCell.swift
//  VKApp
//
//  Created by Julie on 15.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class MyGroupTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myGroupCell: UIView!
    
    @IBOutlet weak var myGroupImage: UIImageView!
    
    @IBOutlet weak var myGroupName: UILabel!
    
    
    

    func animateImage(){
        self.myGroupImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                     
                     UIView.animate(withDuration: 5,
                                    delay: 0,
                                    usingSpringWithDamping: 0.6,
                                    initialSpringVelocity: 0.1,
                                    options: [],
                                    animations: { self.myGroupImage.transform = .identity},
                                    completion: nil)
    }
    

}
