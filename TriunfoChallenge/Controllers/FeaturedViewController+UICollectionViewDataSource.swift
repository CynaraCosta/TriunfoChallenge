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
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? PopularCollectionViewCell() // se cell n existir, retorna uicollectionviewcell
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingsMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: nowPlayingsMovies[indexPath.item].poster)
        let year: String = String(nowPlayingsMovies[indexPath.item].releaseDate.prefix(4))
        cell?.dateLabel.text = year
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = UpcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell

        cell?.titleLabel.text = upcomingMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: upcomingMovies[indexPath.item].poster)
        cell?.dateLabel.text = upcomingMovies[indexPath.item].releaseDate

        return cell ?? UpcomingCollectionViewCell()
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
}
