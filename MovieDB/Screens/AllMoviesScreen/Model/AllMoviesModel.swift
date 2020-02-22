//
//  AllMoviesModel.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//


import Foundation
import RealmSwift


// MARK: - Welcome
class AllMovies: Codable {
    
    @objc dynamic var results: [Movie]
}

class Movie: Object,  Codable {
    @objc dynamic var posterPath: String
    @objc dynamic var id: Int
    @objc dynamic var adult: Bool
    @objc dynamic var title: String
    @objc dynamic var voteAverage: Double
    @objc dynamic var overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id, adult
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
