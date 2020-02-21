//
//  TitleTableViewCell.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 21.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviewImageView: UIImageView!
    
    @IBOutlet weak var moviewScore: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var moviewReleaseDate: UILabel!
    
    @IBOutlet weak var moviewTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        moviewImageView.layer.cornerRadius = 15
        moviewImageView.clipsToBounds = true
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//         self.moviewImageView.layer.cornerRadius = 10
////              self.layer.cornerRadius = 10
////              self.layer.borderWidth = 1.0
////              self.layer.borderColor = UIColor.lightGray.cgColor
////
////              self.layer.backgroundColor = UIColor.white.cgColor
////              self.layer.shadowColor = UIColor.gray.cgColor
////              self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
////              self.layer.shadowRadius = 2.0
////              self.layer.shadowOpacity = 1.0
//        self.moviewImageView.layer.masksToBounds = false
//        self.moviewImageView.clipsToBounds = true
//
//    }
    
    func setTitleCell(movie: Movie) -> Self{
        if movie.posterPath != "" {
            self.moviewImageView.sd_setImage(with: URL(string:"http://image.tmdb.org/t/p/w342/\(movie.posterPath)"))
        }
        self.moviewScore.text = "\(movie.voteAverage)"
        if movie.adult{
            self.movieRating.text = "R"
        }else{
            self.movieRating.text = "A"
        }
        self.moviewReleaseDate.text = movie.releaseDate
        self.moviewTitle.text = movie.title
        return self
    }
    
    
}
