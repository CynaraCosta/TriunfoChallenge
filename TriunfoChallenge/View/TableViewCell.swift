//
//  TableViewCell.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 18/07/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "tableViewCell"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imagePost: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, date: String){
        titleLabel.text = title
        imagePost.image = image
        let year: String = String(date.prefix(4))
        dateLabel.text = year
        imagePost.layer.cornerRadius = 4
        imagePost.layer.masksToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
