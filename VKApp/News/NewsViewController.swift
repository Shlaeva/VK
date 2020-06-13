//
//  NewsViewController.swift
//  VKApp
//
//  Created by Julie on 31.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
  
    let News: [NewsData] = [NewsData(sourceNews: "Earth", imageSourceNews: UIImage(named: "3")!, timeNews: "31 May 2020 14:48", textNews: "time for Lotus blossoming", imageNews: UIImage(named: "news3")!),
        NewsData(sourceNews: "Water", imageSourceNews: UIImage(named: "1")!, timeNews: "31 May 2020 15:02", textNews: "time for Lotus blossoming", imageNews: UIImage(named: "news2")!),
        NewsData(sourceNews: "Sun", imageSourceNews: UIImage(named: "su")!, timeNews: "02 June 2020 20:54", textNews: "this is time for Lotus blossoming..", imageNews: UIImage(named: "news1")!)
    ]
    
    
    @IBOutlet weak var NewsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCustomCell")
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return News.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = NewsTableView.dequeueReusableCell(withIdentifier: "NewsCustomCell") as! NewsTableViewCell
        
        cell.imageSourseNews.image = News[indexPath.row].imageSourceNews
        cell.sourceNews.text = News[indexPath.row].sourceNews
        cell.timeNews.text = News[indexPath.row].timeNews
        cell.textNews.text = News[indexPath.row].textNews
        cell.imageNews.image = News[indexPath.row].imageNews
        
        cell.imageNews.frame.size.width = NewsTableView.frame.size.width
        cell.imageNews.frame.size.height = cell.imageNews.frame.size.width
        
        return cell
    }
    
    
    
}


struct NewsData {
    var sourceNews: String
    var imageSourceNews: UIImage
    var timeNews: String
    var textNews: String
    var imageNews: UIImage
}
