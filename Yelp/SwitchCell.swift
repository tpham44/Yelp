//
//  SwitchCell.swift
//  Yelp
//
//  Created by JP on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit


//Common way to doing this is creating your own delegate
//Create a switchcelldelegate protocol

@objc protocol SwitchCellDelegate{
    optional func switchCell (switchCell: SwitchCell, didChangeValue value:Bool)
    

}

class SwitchCell: UITableViewCell {

    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // action is calling the method of switchValueChange, this action will call method func switchValueChange
        
        onSwitch.addTarget(self, action: "switchValueChange", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func switchValueChange () {
        //debugging when calling this method
        print("action when switch is in action")
        if delegate != nil{
            // this switchCell in this delegate is may or may not exist so we will put a Question mark as optional
            
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
            
            // this function is called when delegate implement this function and go head and call it otherwise do nothing. IF CHANGE ? to ! the app will crash
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
