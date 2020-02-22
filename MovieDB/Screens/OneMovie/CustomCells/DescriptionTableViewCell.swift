//
//  DescriptionTableViewCell.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 21.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func setDesritionCell(movie: Movie) -> Self{
        self.movieDescription.text = movie.overview
        return self
    }
}
