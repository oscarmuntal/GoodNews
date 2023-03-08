//
//  Article.swift
//  GoodNews
//
//  Created by Òscar Muntal on 8/3/23.
//

import Foundation

struct ArticlesResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
