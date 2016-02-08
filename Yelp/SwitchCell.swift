//
//  SwitchCell.swift
//  Yelp
//
//  Created by JP on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {

    
    @IBOutlet weak var switchLabel: UILabel!
    
    
    @IBOutlet weak var onSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
