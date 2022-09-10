//
//  NetworkHelper.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 08.09.22.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
//    let baseURL =
}
