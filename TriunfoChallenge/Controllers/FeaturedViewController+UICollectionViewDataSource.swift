//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingsMovies.count
        } else {
            return upcomingMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else {
            return makeUpcomingCell(indexPath)
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage())
        
        Task {
            let imageDate = await Movie.dowloadImageData(withPath: movie.backdropPath)
            let imagem: UIImage = UIImage(data: imageDate) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)
        }
        
        return cell ?? PopularCollectionViewCell() // se cell n existir, retorna uicollectionviewcell
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell
        
//        cell?.setup(title: nowPlayingsMovies[indexPath.item].title, image: UIImage(named: nowPlayingsMovies[indexPath.item].posterPath) ?? UIImage(), date: nowPlayingsMovies[indexPath.item].releaseDate)
        
        let movie = nowPlayingsMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage(), date: movie.releaseDate)
        
        Task {
            let imageDate = await Movie.dowloadImageData(withPath: movie.posterPath)
            let imagem: UIImage = UIImage(data: imageDate) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem, date: movie.releaseDate)
        }
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = UpcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell
        
//        cell?.setup(title: upcomingMovies[indexPath.item].title, image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage(), date: upcomingMovies[indexPath.item].releaseDate)
        
        let movie = upcomingMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage(), date: movie.releaseDate)
        
        Task {
            let imageDate = await Movie.dowloadImageData(withPath: movie.posterPath)
            let imagem: UIImage = UIImage(data: imageDate) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem, date: movie.releaseDate)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
