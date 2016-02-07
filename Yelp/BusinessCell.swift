//
//  BusinessCell.swift
//  Yelp
//
//  Created by JP on 2/5/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
  
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
 
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var business: Business! {
        didSet{
            nameLabel.text = business.name
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
