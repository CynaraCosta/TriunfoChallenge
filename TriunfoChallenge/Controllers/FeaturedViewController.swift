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
        
    @IBOutlet var popularTitle: UILabel!
    @IBOutlet var popularButton: UIButton!
    @IBOutlet var nowPlayingTitle: UILabel!
    @IBOutlet var nowPlayingButton: UIButton!
    @IBOutlet var upcomingTitle: UILabel!
    @IBOutlet var upcomingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.titleView = UIImageView()
        
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
        
        popularTitle.font = UIFont(name: "Quicksand-SemiBold", size: 24)
        nowPlayingTitle.font = UIFont(name: "Quicksand-SemiBold", size: 24)
        upcomingTitle.font = UIFont(name: "Quicksand-SemiBold", size: 24)
        
        popularButton.titleLabel!.font = UIFont(name: "Quicksand-SemiBold", size: 14)
        nowPlayingButton.titleLabel!.font = UIFont(name: "Quicksand-SemiBold", size: 14)
        upcomingButton.titleLabel!.font = UIFont(name: "Quicksand-SemiBold", size: 14)

        popularButton.layer.cornerRadius = 14.0
        popularButton.backgroundColor = UIColor(named: "purple2")
                
        nowPlayingButton.backgroundColor = UIColor(named: "purple2")
        nowPlayingButton.layer.cornerRadius = 16.0
        
        upcomingButton.backgroundColor = UIColor(named: "purple2")
        upcomingButton.layer.cornerRadius = 16.0
        
    }
}

