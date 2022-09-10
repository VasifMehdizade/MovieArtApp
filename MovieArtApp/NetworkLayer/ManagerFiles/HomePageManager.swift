//
//  HomePageManager.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 10.09.22.
//

import Foundation

class HomePageManager {
    static let shared = HomePageManager()
    
    func getMovies (complete: @escaping ((Info?, String?)->())) {
        let url = "https://movies-app1.p.rapidapi.com/api/movies"
        NetworkManager.shared.request(type: Info.self,
                                      url: url,
                                      method: .get) {
            response in
            switch response {
            case .success(let model) :
                complete(model, nil)
            case .failure(let error) :
                complete(nil, error: localizedDescription)
            }
        }
    }
}
