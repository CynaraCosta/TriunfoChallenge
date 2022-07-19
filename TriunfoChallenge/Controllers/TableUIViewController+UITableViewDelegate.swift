//
//  TableUIViewController+UITableViewDelegate.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        if teste == 0 {
            movie = todayMovies[indexPath.item]
        } else {
            movie = thisWeekMovies[indexPath.item]
        }
        // mudar conforme o ngcio lá selecionado
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
