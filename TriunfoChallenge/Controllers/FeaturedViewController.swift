//
//  ViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingsMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    private let stackTitle: UIStackView = {
        let stackTitle = UIStackView()
        stackTitle.axis = NSLayoutConstraint.Axis.horizontal
        stackTitle.distribution  = UIStackView.Distribution.equalSpacing
        stackTitle.alignment = UIStackView.Alignment.center
        stackTitle.spacing  = 8.0
        return stackTitle
    }()
    
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
    
        setBackground()
        
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
        
        let kit = addStack()
        let logoImage: UIImageView = kit.0
        let titleLudi: UILabel = kit.1
        
        stackTitle.addArrangedSubview(logoImage)
        stackTitle.addArrangedSubview(titleLudi)
        
        navigationItem.titleView = stackTitle
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Oswald-Regular", size: 48)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Autolayout
        
        stackTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackTitle.heightAnchor.constraint(equalToConstant: 40.0),
        ])
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 34),
        ])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    func addStack() -> (UIImageView, UILabel, UIStackView){
        let logoImage: UIImageView
        let image = UIImage(named: "logo")
        logoImage = UIImageView(image: image)
        logoImage.contentMode = .scaleAspectFit

        
        let titleLudi: UILabel
        titleLudi = UILabel()
        titleLudi.textColor = .white
        titleLudi.text = "Ludi"
        titleLudi.font = UIFont(name: "Oswald-Medium", size: 24)

        
        let stackTitle: UIStackView
        stackTitle = UIStackView()
        stackTitle.axis = NSLayoutConstraint.Axis.horizontal
        stackTitle.distribution  = UIStackView.Distribution.equalSpacing
        //stackTitle.alignment = UIStackView.Alignment.center
        stackTitle.spacing  = 8.0
        
        return (logoImage, titleLudi, stackTitle)
    }
    
}

