//
//  TrendingUIViewController+UITableViewDataSource.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if teste == 0 {
            return todayMovies.count
        } else {
            return thisWeekMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if teste == 0 {
            return makeTodayCell(indexPath)
        } else {
            return makeWeekCell(indexPath)
        }
    }
    
    fileprivate func makeWeekCell(_ indexPath: IndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        let movieWeek = thisWeekMovies[indexPath.item]
        
        if let posterDesemp = movieWeek.posterPath {
            let image = UIImage(named: posterDesemp) ?? UIImage()
            cell?.setup(title: movieWeek.title, image: image, date: movieWeek.releaseDate!)
        }
//        cell?.setup(title: movieWeek.title, image: UIImage(named: movieWeek.posterPath) ?? UIImage(), date: movieWeek.releaseDate!)

        Task {
            if let posterDesemp = movieWeek.posterPath {
                let imageDate = await Movie.dowloadImageData(withPath: posterDesemp)
                let image: UIImage = UIImage(data: imageDate) ?? UIImage()
                cell?.setup(title: movieWeek.title, image: image, date: movieWeek.releaseDate!)
            }
//            let imageDate = await Movie.dowloadImageData(withPath: movieWeek.posterPath)
//            let image: UIImage = UIImage(data: imageDate) ?? UIImage()
//            cell?.setup(title: movieWeek.title, image: image, date: movieWeek.releaseDate!)
        }
        return cell ?? TableViewCell()
    }
    
    fileprivate func makeTodayCell(_ indexPath: IndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        let movie = todayMovies[indexPath.item]
//        let movieWeek = thisWeekMovies[indexPath.item]
        
        if let posterDesemp = movie.posterPath {
            let image = UIImage(named: posterDesemp) ?? UIImage()
            cell?.setup(title: movie.title, image: image, date: movie.releaseDate!)
        }
//        cell?.setup(title: movie.title, image: UIImage(named: movie.posterPath) ?? UIImage(), date: movie.releaseDate!)
        
        Task {
            if let posterDesmep = movie.posterPath {
                let imageDate = await Movie.dowloadImageData(withPath: posterDesmep)
                let image: UIImage = UIImage(data: imageDate) ?? UIImage()
                cell?.setup(title: movie.title, image: image, date: movie.releaseDate!)
            }
//            let imageDate = await Movie.dowloadImageData(withPath: movie.posterPath)
//            let image: UIImage = UIImage(data: imageDate) ?? UIImage()
//            cell?.setup(title: movie.title, image: image, date: movie.releaseDate!)
        }
        
        return cell ?? TableViewCell()
    }
}
