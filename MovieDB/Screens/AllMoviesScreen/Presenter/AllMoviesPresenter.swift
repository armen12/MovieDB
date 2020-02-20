//
//  AllMoviesPresenter.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//


import Foundation

protocol AllMoviesDelegate:class {
    func displayMovies(allMovies: [Movie] , page: Int)
}

class AllMoviesPresenter{
    weak var delegate: AllMoviesDelegate?
    private let client: AllMovieServices
    init(client: AllMovieServices) {
        self.client = client
    }
    
    func setViewDelegate(allMoviesDelegate: AllMoviesDelegate?){
        self.delegate = allMoviesDelegate
    }

    func getMoviesByPage(page: Int){
        client.getAllMovies(moviesAPI: .searchMovieByPage(page: page)) { [weak self](result) in
            switch result{
            case .success(let pageMovies):
                guard let pageMovies = pageMovies?.results else {return}
                self?.delegate?.displayMovies(allMovies: pageMovies, page: page)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
