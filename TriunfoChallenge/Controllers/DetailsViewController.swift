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
        self.backdropImage.image = UIImage(named: movie.backdrop)
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        self.posterImage.image = UIImage(named: movie.poster)
        self.overviewLabel.text = movie.overview
        
    }
}
