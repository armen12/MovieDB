//
//  ViewController.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import UIKit

class AllMoviesScreen: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var allMovies: [Movie] = []
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: nil)

        self.moviePresenter.getMoviesByPage(page: page)
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
        
        return collectionView.dequeueReusableCell(withType: AllMoviesCollectionViewCell.self, for: indexPath).setupCell(item: self.allMovies[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "OneMovieViewController") as! OneMovieViewController
        vc.movie = allMovies[indexPath.row]
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        

    }
}
extension AllMoviesScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 25
           let collectionCellSize = collectionView.frame.size.width - padding

         return CGSize(width: collectionCellSize/2, height: collectionCellSize/2)
        }
}

extension AllMoviesScreen: AllMoviesDelegate{
    func presentAlert(alertMessage: String) {
        self.alert(message: alertMessage)
    }
    
    
    func displayMovies(allMovies: [Movie], page: Int) {
        allMovies.forEach({self.allMovies.append($0)})
        self.collectionView.reloadData()
    }
}
