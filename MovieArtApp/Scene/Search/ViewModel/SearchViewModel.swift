//
//  HomePageViewModel.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 10.09.22.
//

import Foundation

class SearchViewModel {
    var moviesNames = [Info]()

    var successCallback : (()->())?
    var errorCallback : ((String)->())?
    
    func getSearchResults (text: String) {
        SearchPageManager.shared.searchMovies(text: text) { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items?.results {
                self.moviesNames = docs
                self.successCallback?()
            }
        }
    }
}
