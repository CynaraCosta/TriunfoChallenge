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
    
    func setup(title: String, image: UIImage, date: String){
        titleLabel.text = title
        imageView.image = image
        let year: String = String(date.prefix(4))
        dateLabel.text = year
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        titleLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
        dateLabel.font = UIFont(name: "Quicksand-Regular", size: 16)
    }
    
    
    
}
