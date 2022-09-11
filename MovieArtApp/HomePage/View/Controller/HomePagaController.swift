//
//  HomePagaController.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 10.09.22.
//

import UIKit

class HomePagaController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func registerCell() {
        collectionView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellWithReuseIdentifier: "MoviesCell")
    }
    
    func configurationViewModel() {
        showLoader()
        viewModel.getMoviesInfos()
        viewModel.errorCallback = { message in
            self.dismissLoader()
            self.showAlert(message: message) {}
        }
        
        viewModel.successCallback = {
            self.dismissLoader()
            self.collectionView.reloadData()
        }
    }
}

extension HomePagaController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        cell.configure(item: viewModel.moviesInfos[indexPath.item])
        return cell
        
    }
}
