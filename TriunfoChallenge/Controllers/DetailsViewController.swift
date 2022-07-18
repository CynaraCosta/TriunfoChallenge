//
//  DetailsViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setBackground()
        
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        self.backdropImage.image = UIImage(named: movie.backdropPath)
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.posterImage.image = UIImage(named: movie.posterPath)
        self.overviewLabel.text = movie.overview
        
        Task {
            let backdropURL = await Movie.dowloadImageData(withPath: movie.backdropPath)
            let backdrop = UIImage(data: backdropURL) ?? UIImage()
            self.backdropImage.image = backdrop
            
            let posterURL = await Movie.dowloadImageData(withPath: movie.posterPath)
            let poster = UIImage(data: posterURL) ?? UIImage()
            self.posterImage.image = poster
            
        }
    }
}
