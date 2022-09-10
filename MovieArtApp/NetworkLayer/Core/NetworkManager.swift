//
//  NetworkManager.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 08.09.22.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url, method: method, headers: ["Authorization" : "fsq3LVXxk4FdDqKHlHggBCEwv1/j2C0k+AigMopx5SWISN8="]).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data : data) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.generalError))
            }
        }
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
