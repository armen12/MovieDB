//
//  OneMovieViewController.swift
//  MovieDB
//
//  Created by Armen Nagapetyan on 21.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//


import UIKit

class OneMovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TitleTableViewCell.self)
        self.tableView.register(DescriptionTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movieTitle.text = self.movie.title
        self.addBlurEffect()
    }
    private func addBlurEffect(){
        tableView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        tableView.backgroundView = blurEffectView
        
    }
    @IBAction func backButtonWasTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OneMovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withType: TitleTableViewCell.self, for: indexPath).setTitleCell(movie: self.movie)
        case 1:
            return tableView.dequeueReusableCell(withType: DescriptionTableViewCell.self, for: indexPath).setDesritionCell(movie: self.movie)
        default:
            return UITableViewCell()
        }
    }
    
}
