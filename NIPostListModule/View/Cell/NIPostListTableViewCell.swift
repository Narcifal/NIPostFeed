//
//  NIPostListTableViewCell.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import UIKit

class NIPostListTableViewCell: UITableViewCell {

    static let identifier = "PostListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NIPostListTableViewCell", bundle: nil)
    }
    
}
