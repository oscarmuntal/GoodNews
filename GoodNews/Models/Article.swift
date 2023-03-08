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

extension ArticlesResponse {
    static var all: Resource<ArticlesResponse> = {
        let apiKey = "GET-YOUR-PRIVATE-API-KEY"
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else { fatalError("URL doesn't work") }
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
}
