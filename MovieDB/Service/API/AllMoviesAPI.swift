//
//  AllMoviesAPI.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
enum AllMoviesAPI{
    case searchMovieByPage(page: Int)
}

extension AllMoviesAPI: Endpoint{
  
    var body: [String: String]{
        switch self {
        case let .searchMovieByPage(page: page):
            return ["page" :"\(page)"]
        }
    }
    
    var path: String {
        switch self {
        case .searchMovieByPage:
            return "/3/movie/now_playing"
        }
    }
}
