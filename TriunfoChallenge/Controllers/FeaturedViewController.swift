//
//  ViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingsMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var UpcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "purple1")?.cgColor, UIColor(named: "purple2")?.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        UpcomingCollectionView.delegate = self
        UpcomingCollectionView.dataSource = self
        
    }
}

