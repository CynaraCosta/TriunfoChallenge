//
//  popularCollectionViewCell.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "popularCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func layoutSubviews() {
        titleLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
    }
    
}
