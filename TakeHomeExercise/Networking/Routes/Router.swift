//
//  Router.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation

protocol URLRequestConvertible {
    func urlRequest() -> URLRequest?
}

enum EndPoint: String {
    case getTrendsRepositories = "/search/repositories"
}

enum HTTPMethod {
    case get
    
    var toString: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

struct Router {
    let scheme: String = "https"
    let host: String = "api.github.com"
    let endPoint: EndPoint
    let method: HTTPMethod
    let path: [String]?
    let queryItems: [String: String]?
    
    init(endPoint: EndPoint,
         method: HTTPMethod,
         path: [String]? = nil,
         queryItems: [String: String]? = nil)
    {
        self.endPoint = endPoint
        self.method = method
        self.path = path
        self.queryItems = queryItems
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endPoint.rawValue + (path?.compactMap { "/\($0)" }.joined() ?? "")
        components.queryItems = queryItems?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }
}

extension Router: URLRequestConvertible {
    func urlRequest() -> URLRequest? {
        guard let url = url else {
            print("Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.toString

        return request
    }
}




