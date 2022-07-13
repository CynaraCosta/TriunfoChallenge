//
//  DetailsViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "purple4")?.cgColor, UIColor(named: "purple3")?.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
        print(movie)
    }
}
