//
//  TrendingViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 14/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    let todayMovies: [Movie] = Movie.trendingTodayMovies()
    let thisWeekMovies: [Movie] = Movie.trendingThisWeekMovies()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }

}
