//
//  AvatarViewControl.swift
//  VKApp
//
//  Created by Julie on 21.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

@IBDesignable class AvatarControl: UIView {
    
    var avatar = UIImageView()

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
    
    @objc func onTap(){
        animateAvatar()
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAvatar()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAvatar()
        addGestureRecognizer(tapGestureRecognizer)
    }
    

    @IBInspectable var WithShadow: CGSize = .init(width: 5, height: 5) {
            didSet {
                self.layer.shadowOffset = WithShadow
            }
        }
    
    @IBInspectable var ColorShadow: UIColor = UIColor.systemBlue {
            didSet {
                self.layer.shadowColor = ColorShadow.cgColor
            }
        }
    
    @IBInspectable var OpacityShadow: Float = 1 {
            didSet {
                self.layer.shadowOpacity = OpacityShadow
            }
        }
    
    @IBInspectable var RadiusShadow: CGFloat = 1 {
            didSet {
                self.layer.cornerRadius = RadiusShadow
            }
        }


    func setupAvatar() {
        
        avatar = UIImageView(frame: CGRect(x: 16, y: 5, width: 100, height: 100))
        avatar.layer.masksToBounds = true

        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = avatar.bounds.size.width / 2
        self.layer.backgroundColor = UIColor.clear.cgColor

        self.addSubview(avatar)
        
    }
    
    
    func animateAvatar() {
              
              self.avatar.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
              
              UIView.animate(withDuration: 5,
                             delay: 0,
                             usingSpringWithDamping: 0.6,
                             initialSpringVelocity: 0.1,
                             options: [],
                             animations: { self.avatar.transform = .identity},
                             completion: nil)
          }
    
    
    
    
}


