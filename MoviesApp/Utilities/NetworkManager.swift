//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Fatih Özen on 22.06.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func downloadAF(url: URL, httpMethod: HTTPMethod, completion: @escaping (Result<Data,Error>) -> () ) {
        AF.request(url, method: httpMethod).response { response in
            
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(URLError(.badServerResponse)))
            }
            
        }
    }
    
}
