//
//  TrendRepositoryStub.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 25/06/2022.
//

import Foundation
@testable import TakeHomeExercise

enum ErrorStub: Error {
    case mock
}

class TrendRepositoryStub: TrendRepositoryType {
    
    func fetchCurrentTrend(completion: @escaping(Result<TrendModel, Error>) -> Void) {
        completion(.success(TrendModel.mocked))
//        completion(.failure(ErrorStub.mock))
    }
    
}
