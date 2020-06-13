//
//  FollowControl.swift
//  VKApp
//
//  Created by Julie on 07.06.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class FollowControl: UIControl {
    
    let label = UILabel(frame: CGRect(x: 50, y: 5, width: 25, height: 25))
       let image = UIImage(systemName: "arrowshape.turn.up.right")
       var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        Following()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Following()
        
    }
    
    func Following() {
        
        label.text = "0"
        
        imageView = UIImageView(frame: CGRect(x: 15, y: 5, width: 25, height: 25))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        
        self.addSubview(label)
        self.addSubview(imageView)
    }
    
    func animateFollow() {
              
           self.imageView.transform = CGAffineTransform.init(rotationAngle: 180)

              
              UIView.animate(withDuration: 2,
                             delay: 0,
                             usingSpringWithDamping: 0.6,
                             initialSpringVelocity: 0.1,
                             options: [.transitionCurlUp
                  ],
                             animations: {
                              self.imageView.transform = .identity

              }, completion: nil)
              
          }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        var i = Int(label.text!)
        i! += 1
        label.text = String(i!)
        animateFollow()
    }
    
}
