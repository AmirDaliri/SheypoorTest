//
//  DeskMovieItemViewCell.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//

import UIKit

class DeskMovieItemViewCell: UITableViewCell {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var premiered: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var updated: UILabel!
    @IBOutlet weak var summary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
