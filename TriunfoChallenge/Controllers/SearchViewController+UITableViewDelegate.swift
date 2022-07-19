//
//  SearchViewController+UITableViewDelegate.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        movie = searchedMovies[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
