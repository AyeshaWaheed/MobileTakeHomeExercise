//
//  TrendService.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation
import UIKit

protocol TrendServiceType {
    func fetchTrendingRepositories(completion: @escaping(Result<TrendModel, Error>) -> Void)
}

class TrendService: TrendServiceType {
    
    private let apiManager: ApiManagerType
    
    init(apiManager: ApiManagerType) {
        self.apiManager = apiManager
    }
    
    func fetchTrendingRepositories(completion: @escaping (Result<TrendModel, Error>) -> Void) {
        
        let router = Router(endPoint: .getTrendsRepositories, method: .get, queryItems: ["q": "language=+sort:stars"])
        apiManager.request(router: router) { (result: Result<TrendModel, Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
        
    }
    
}
