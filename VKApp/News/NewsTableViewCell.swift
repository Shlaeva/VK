//
//  NewsTableViewCell.swift
//  VKApp
//
//  Created by Julie on 31.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageSourseNews.layer.cornerRadius = imageSourseNews.frame.size.width/2

        imageNews.bounds.size.width = self.bounds.size.width
        imageNews.bounds.size.height = imageNews.bounds.size.width
        imageNews.contentMode = .scaleAspectFill
        
        
    }

    @IBOutlet weak var headerNewsView: UIView!
    @IBOutlet weak var sourceNews: UILabel!
    @IBOutlet weak var imageSourseNews: UIImageView!
    @IBOutlet weak var timeNews: UILabel!
    
    @IBOutlet weak var textNews: UILabel!
    
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var footerNewsView: UIView!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

