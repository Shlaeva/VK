//
//  HeaderCustom.swift
//  VKApp
//
//  Created by Julie on 30.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class MyCustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: "HeaderCustom")
        configureContens()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContens()
    }
    
    
    func configureContens() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.alpha = 0.5
        title.textColor = .blue
        title.textAlignment = .natural
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.widthAnchor.constraint(equalToConstant: 400),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
