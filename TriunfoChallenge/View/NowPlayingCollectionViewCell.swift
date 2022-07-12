//
//  nowPlayingCollectionViewCell.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func layoutSubviews() {
        titleLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
        dateLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
    }
    
    
    
}
