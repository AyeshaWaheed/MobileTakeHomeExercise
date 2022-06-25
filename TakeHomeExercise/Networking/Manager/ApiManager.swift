//
//  ApiManager.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation

protocol ApiManagerType {
    func request<T:Decodable>(router: URLRequestConvertible, completion: @escaping (Result<T,Error>) -> Void)
}

class ApiManager: ApiManagerType {

    private let session = URLSession(configuration: .default)
    
    func request<T: Decodable>(router: URLRequestConvertible, completion: @escaping (Result<T,Error>) -> Void) {
        
        fetchTrendingRepositories(urlRequest: router.urlRequest()) { response in
            switch response {
            case .success(let data):
                do {
                    //handle decoding
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decode))
                }catch (let error) {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//MARK: - Fetch Data From APi

extension ApiManager {
    
    func fetchTrendingRepositories(urlRequest: URLRequest?, completion: @escaping (Result<Data,Error>) -> Void) {
       
        guard let url = urlRequest?.url else {
            print("URL invalid")
            return
        }
        
        session.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }else if let data = data {
                completion(.success(data))
            }
            
        }.resume()
    }
}

