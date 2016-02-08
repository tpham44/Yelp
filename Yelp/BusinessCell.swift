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
 
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    

    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var business: Business! {
        didSet{
            nameLabel.text = business.name
            thumbImageView.setImageWithURL(business.imageURL!)
            ratingImageView.setImageWithURL(business.ratingImageURL!)
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
           reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            //reviewsCountLabel is a integer there for use quote and parenthesis
            distanceLabel.text = business.distance
            //the variables on the LEFT of = are defined from IBOulet weak internal var...
            // and the variables on the RIGHT of = was defined from Yelp API
            
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //For rounding corner you must do follwing 2 thumbImageView
        thumbImageView.layer.cornerRadius = 10
        thumbImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    
        
    }
    //this function will resize the width of the nameLabel when iphone set sideway
    override func layoutSubviews() {
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
