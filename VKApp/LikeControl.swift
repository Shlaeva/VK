//
//  LikeControl.swift
//  VKApp
//
//  Created by Julie on 24.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import Foundation
import UIKit

class LikeControl: UIControl {
    
    let label = UILabel(frame: CGRect(x: 46, y: 5, width: 25, height: 25))
    let image = UIImage(systemName: "heart")
    var imageView = UIImageView()
    
    var flag = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Liking()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Liking()
    }
    
    func Liking() {
        label.text = "0"
        
        imageView = UIImageView(frame: CGRect(x: 16, y: 5, width: 25, height: 25))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        self.addSubview(label)
        self.addSubview(imageView)
    }
    
    
    func animateLike() {
        
        self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.1,
                       options: [.curveEaseIn],
                       animations: {
                        self.imageView.transform = .identity
                        
        }, completion: nil)
        
        
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if flag {
            label.text = "1"
            imageView.image = UIImage(systemName: "heart.fill")
            imageView.tintColor = .orange
            animateLike()
            flag = false
            
        } else {
            label.text = "0"
            imageView.image = UIImage(systemName: "heart")
            imageView.tintColor = .gray
            flag = true
        }
    }
}
