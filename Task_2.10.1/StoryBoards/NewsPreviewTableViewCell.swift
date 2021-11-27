//
//  NewsPreviewTableViewCell.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import UIKit

class NewsPreviewTableViewCell: UITableViewCell {
    
    private var news: [News] = []
    
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var teaser: UILabel!

}

extension NewsPreviewTableViewCell {
    
    func fetchCellData(with news: News) {
        title.text = news.title
        date.text = news.date
        teaser.text = news.teaser
        
        DispatchQueue.global().async {
            guard let url = URL(string: news.image) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.newsImage.image = UIImage(data: imageData)
            }
        }
    }
    
}
