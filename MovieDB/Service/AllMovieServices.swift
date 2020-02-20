//
//  AllMovieServices.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation

class AllMovieServices: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    convenience init() {
        self.init(configuration: .default)
    }
    func getAllMovies( moviesAPI: AllMoviesAPI, completion: @escaping (Result<AllMovies?, APIError>) -> Void) {
        fetch(request: moviesAPI.request, decode: { json -> AllMovies? in
            guard let moviesResult = json as? AllMovies else { return  nil }
            return moviesResult
        }, completion: completion)
    }
    
}
