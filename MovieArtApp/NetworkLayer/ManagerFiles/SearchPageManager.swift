//
//  SearchPageManager.swift
//  MovieArtApp
//
//  Created by Vasif Mehdi on 21.09.22.
//

import UIKit

class SearchPageManager: UIViewController {
    
    static let shared = SearchPageManager()
    
    func searchMovies(text: String, complete: @escaping((Movies?, String?)->())) {
        let url = "https://movies-app1.p.rapidapi.com/api/movies?" + "query=" + "\(text)"
        NetworkManager.shared.request(type: Movies.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
}
