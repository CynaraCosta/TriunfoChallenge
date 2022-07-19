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
        
        if let backdropImageDesemp = movie.backdropPath{
            self.backdropImage.image = UIImage(named: backdropImageDesemp)
        } else {
            self.backdropImage.image = UIImage()
        }
        
        if let posterDesemp = movie.posterPath {
            self.posterImage.image = UIImage(named: posterDesemp)
        } else {
            self.posterImage.image = UIImage()
        }
        
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        //self.posterImage.image = UIImage(named: movie.posterPath)
        self.overviewLabel.text = movie.overview
        
        Task {
            
            if let backdropDesemp = movie.backdropPath {
                let backdropURL = await Movie.dowloadImageData(withPath: backdropDesemp)
                let backdrop = UIImage(data: backdropURL) ?? UIImage()
                self.backdropImage.image = backdrop
            } else {
                self.backdropImage.image = UIImage()
            }
            
            if let posterDesemp = movie.posterPath {
                let posterURL = await Movie.dowloadImageData(withPath: posterDesemp)
                let poster = UIImage(data: posterURL) ?? UIImage()
                self.posterImage.image = poster
            } else {
                self.posterImage.image = UIImage()
            }
            
//            let posterURL = await Movie.dowloadImageData(withPath: movie.posterPath)
//            let poster = UIImage(data: posterURL) ?? UIImage()
//            self.posterImage.image = poster
            
        }
    }
}
