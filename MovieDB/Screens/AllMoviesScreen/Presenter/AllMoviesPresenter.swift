//
//  AllMoviesPresenter.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//


import Foundation
import RealmSwift
let realm = try! Realm()

protocol AllMoviesDelegate: class{
    func presentAlert(alertMessage: String)
    func displayMovies(allMovies: [Movie] , page: Int)
}

class AllMoviesPresenter {
    
    weak var delegate: AllMoviesDelegate?
    private let client: AllMovieServices
    init(client: AllMovieServices) {
        self.client = client
    }
    
    func setViewDelegate(allMoviesDelegate: AllMoviesDelegate?){
        self.delegate = allMoviesDelegate
    }
    func getData<T:Object>(ofType: T.Type) -> [T]? {
        let saveObjects =  realm.objects(ofType)
        return Array(saveObjects)
    }
    
    func saveData<T:Object>(ofType: [T]){
        try! realm.write {
            realm.add(ofType)
        }
    }
    
    func getMoviesByPage(page: Int){
        client.getAllMovies(moviesAPI: .searchMovieByPage(page: page)) { [weak self](result) in
            switch result{
            case .success(let pageMovies):
                guard let pageMovies = pageMovies?.results else {return}
                self?.saveData(ofType: pageMovies)
                self?.delegate?.displayMovies(allMovies: pageMovies, page: page)
            case .failure(let error):
                let tempArr = self?.getData(ofType: Movie.self)
                tempArr!.isEmpty ? self?.delegate?.presentAlert(alertMessage: error.localizedDescription) : self?.delegate?.displayMovies(allMovies: tempArr!, page: 0)
            }
        }
    }
}
