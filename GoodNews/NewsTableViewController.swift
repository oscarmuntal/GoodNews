//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Òscar Muntal on 8/3/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    let disposeBag = DisposeBag()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    private func populateNews() {
        let apiKey = "GET-YOUR-PRIVATE-API-KEY"
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=apiKey")!
        
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> [Article]? in
                return try? JSONDecoder().decode(ArticlesResponse.self, from: data).articles
            }.subscribe(onNext: { [weak self] articles in
                if let articles = articles {
                    self?.articles = articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
}

