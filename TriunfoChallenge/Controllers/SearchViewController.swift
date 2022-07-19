//
//  SearchViewController.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 14/07/22.
//

import UIKit

class SearchViewController: UIViewController {

    var searchedMovies: [Movie] = []
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var tableViewSearch: UITableView!
    
    func setLeftIcon(_ icon: UIImage) {

        let padding = 8
        let size = 20

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)

        searchField.leftView = outerView
        searchField.leftViewMode = .always
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageLeft = UIImage(named: "Fill")
        setLeftIcon(imageLeft!)
        
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        searchField.delegate = self
        searchField.returnKeyType = .done
        
        setBackground()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        Task{
            self.searchedMovies = await Movie.searchMovie(title: searchField.text ?? "")
            self.tableViewSearch.reloadData()
        }
        return true
    }
}
