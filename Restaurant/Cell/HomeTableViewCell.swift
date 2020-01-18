//
//  HomeTableViewCell.swift
//  Restaurant
//
//  Created by Hany Karam on 1/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
