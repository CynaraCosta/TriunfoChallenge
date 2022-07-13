//
//  nowPlayingCollectionViewCell.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "nowPlayingCell"

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func layoutSubviews() {
        titleLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
        dateLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
    }
    
    
    
}
