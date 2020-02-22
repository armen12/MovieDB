//
//  AllMoviesCollectionViewCell.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import SDWebImage

class AllMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    
    override func prepareForReuse() {
        self.movieImage.image = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.movieImage.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false

    }
    func setupCell(item: Movie) -> Self{
        if item.posterPath != "" {
            self.movieImage.sd_setImage(with: URL(string:"http://image.tmdb.org/t/p/w342/\(item.posterPath)"))
        }
        return self
    }
}
