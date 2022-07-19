//
//  UIViewController+UITableViewDataSoucer.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 19/07/22.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeSearchCell(indexPath)
    }
    
    func makeSearchCell(_ indexPath: IndexPath) -> TableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell
        let cell = tableViewSearch.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        let movie = searchedMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage(named: movie.posterPath) ?? UIImage(), date: movie.releaseDate!)

        Task {
            let imageDate = await Movie.dowloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageDate) ?? UIImage()
            cell?.setup(title: movie.title, image: image, date: movie.releaseDate!)
        }
        return cell ?? TableViewCell()
    }
    
    
}
