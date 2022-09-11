//
//  CollectionViewCell.swift
//  MovieArtApp
//
//  Created by Vasif Mehdizade on 10.09.22.
//

import UIKit
import SDWebImage

protocol MoviesCellProtocol {
    var moviePhoto : String { get }
    var movieTitle : String { get }
}

class MoviesCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    func configure (item : MoviesCellProtocol) {
        cellImage.sd_setImage(with: URL(string: item.moviePhoto))
        cellTitle.text = item.movieTitle
    }
}
