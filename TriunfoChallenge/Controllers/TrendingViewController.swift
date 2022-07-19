//
//  TrendingViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 14/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    var todayMovies: [Movie] =  [] //Movie.trendingTodayMovies()
    var thisWeekMovies: [Movie] = [] //[Movie.trendingThisWeekMovies()]
    
    var teste = 0
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentedControlView: UISegmentedControl!
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            teste = 0
            tableView.reloadData()
        } else {
            teste = 1
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setBackground()
        
        Task {
            self.todayMovies = await Movie.todayMoviesAPI()
            self.thisWeekMovies = await Movie.weekMoviesAPI()
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

}
