//
//  TrendRepository.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation

protocol TrendRepositoryType {
    func fetchCurrentTrend(completion: @escaping(Result<TrendModel, Error>) -> Void)
}

class TrendRepository: TrendRepositoryType {
    
    private let trendService: TrendServiceType
    
    init(trendService: TrendServiceType) {
        self.trendService = trendService
    }
    
    func fetchCurrentTrend(completion: @escaping (Result<TrendModel, Error>) -> Void) {
        trendService.fetchTrend(completion: completion)
    }
    
}
