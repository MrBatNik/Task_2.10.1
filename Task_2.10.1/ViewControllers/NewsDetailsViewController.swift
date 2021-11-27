//
//  NewsDetailsViewController.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet var detailedImage: UIImageView!
    @IBOutlet var detailedTitle: UILabel!
    @IBOutlet var detailedDate: UILabel!
    @IBOutlet var newsText: UITextView!
    
    var someNews: News!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedTitle.text = someNews.title
        detailedDate.text = someNews.date
        newsText.text = someNews.text
        
        guard let url = URL(string: someNews.image) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        detailedImage.image = UIImage(data: imageData)
    }

}
