//
//  upcomingCollectionViewCell.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 12/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func layoutSubviews() {
        titleLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
        dateLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
    }
    
}
