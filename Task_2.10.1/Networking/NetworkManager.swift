//
//  NetworkManager.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import UIKit

class NetworkManager {
    
    class func getData(completion: @escaping ((NewsObject) -> Void)) {
        guard let url = URL(string: "https://api.npoint.io/c7a27603dc564cc51a07") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let newsObject = try JSONDecoder().decode(NewsObject.self, from: data)
                completion(newsObject)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
