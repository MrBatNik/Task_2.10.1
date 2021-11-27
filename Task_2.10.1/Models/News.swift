//
//  News.swift
//  Task_2.10.1
//
//  Created by Никита Бат on 27.11.2021.
//

import Foundation

struct News: Decodable {
    
    let title: String
    let date: String
    let teaser: String
    let image: String
    let text: String
    
}

struct NewsObject: Decodable {
    
    let newsItems: [News]
    
}
