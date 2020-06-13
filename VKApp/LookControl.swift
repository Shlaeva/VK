//
//  LookControl.swift
//  VKApp
//
//  Created by Julie on 07.06.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class LookControl: UIControl {
    
    let label = UILabel(frame: CGRect(x: 60, y: 5, width: 25, height: 25))
    let image = UIImage(systemName: "eye")
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Looking()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Looking()
    }
    
    func Looking() {
        
       label.text = "0"
        
        imageView = UIImageView(frame: CGRect(x: 15, y: 5, width: 25, height: 25))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        
        self.addSubview(label)
        self.addSubview(imageView)
        
    }
    

    func animateLook() {
           
      self.imageView.transform = CGAffineTransform.init(scaleX: 2, y: 2)

           
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
        animateLook()
    }
    
}
