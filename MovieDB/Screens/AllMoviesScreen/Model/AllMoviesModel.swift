//
//  AllMoviesModel.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//


import Foundation

// MARK: - Welcome
struct AllMovies: Codable {
    
    let results: [Movie]
}

struct Movie: Codable {
    let posterPath: String
    let id: Int
    let adult: Bool
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id, adult
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
