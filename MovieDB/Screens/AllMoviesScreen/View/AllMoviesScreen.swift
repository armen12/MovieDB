//
//  ViewController.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit
import SVProgressHUD
class AllMoviesScreen: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var allMovies:[Movie] = []
    var page = 1
    private let moviePresenter = AllMoviesPresenter(client: AllMovieServices())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviePresenter.setViewDelegate(allMoviesDelegate: self)
        self.setCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .gray
        self.navigationItem.title = "Latest Movie"
        self.moviePresenter.getMoviesByPage(page: 1)
    }
    func setCollectionView(){
        self.collectionView.register(AllMoviesCollectionViewCell.self)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
}
extension AllMoviesScreen: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.allMovies.count - 1 {
            self.page += 1
            self.moviePresenter.getMoviesByPage(page: self.page)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withType: AllMoviesCollectionViewCell.self, for: indexPath).setupCell(item: self.allMovies[indexPath.row], delegate: self)
    }
}
extension AllMoviesScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 276)
    }
}

extension AllMoviesScreen: AllMoviesDelegate{
    func displayMovies(allMovies: [Movie], page: Int) {
        allMovies.forEach({self.allMovies.append($0)})
        self.collectionView.reloadData()
    }
}
extension AllMoviesScreen: AllMoviesCollectionViewCelldelegate{
    func openPoster(sender: AllMoviesCollectionViewCelldelegate, movie: Movie) {
        print("openPoset")
    }
}
