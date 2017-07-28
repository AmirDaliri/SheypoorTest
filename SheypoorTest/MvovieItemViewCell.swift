//
//  MvovieItemViewCell.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//

import UIKit

class MvovieItemViewCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nameItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
