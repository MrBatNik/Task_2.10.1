//
//  NewsTableViewController.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var news: [News] = []
    private var someNews: News!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNews()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsPreviewTableViewCell
        let news = news[indexPath.row]
        
        cell.fetchCellData(with: news)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = news[indexPath.row]
        
        someNews = news
        
        performSegue(withIdentifier: "NewsDetailsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? NewsDetailsViewController else { return }
        
        viewController.someNews = someNews
    }

}

extension NewsTableViewController {
    
    private func fetchNews() {
        NetworkManager.getData { newsObject in
            self.news = newsObject.newsItems
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
