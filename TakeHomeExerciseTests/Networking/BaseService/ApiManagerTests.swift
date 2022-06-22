//
//  ApiManagerTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation
@testable import TakeHomeExercise

class ApiManagerTests: ApiManagerType {
    
    func request<T: Decodable>(router: URLRequestConvertible, completion: @escaping (Result<T,Error>) -> Void) {
        // For Testing
    }
    
}
