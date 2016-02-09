//
//  FiltersViewController.swift
//  Yelp
//
//  Created by JP on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

// Creating a FiltersViewControllerDelegate
//@objc and optional are used for someone to call this delegate or not if they wanted to
@objc protocol FiltersViewControllerDelegate{
    optional func filtersViewController (filtersViewController : FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    //declare variable delegate ? is optional
    weak var delegate: FiltersViewControllerDelegate?
    
    var categories: [[String:String]]!
    var switchStates = [Int:Bool]() //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categories = yelpCategories()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSearchButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        //if delegate.filterViewController do exist then we call then we want to call filtersViewController and pass back my "self"
        
        var filters = [String: AnyObject]()
        
        //this for below is going through all the keys of Dictionary
        var selectedCategories = [String]() //empty array of string
        for (row, isSelected) in switchStates{
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
           // if selectedCategories has something in them then my filters categories will contains selected categories
            if selectedCategories.count > 0{
            filters["categories"] = selectedCategories
            }
        
        
        delegate?.filtersViewController?(self, didUpdateFilters: filters) // delegate was declare above and called it from here
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = categories[indexPath.row]["name"]
        
        cell.delegate = self
        
        if switchStates[indexPath.row] != nil{
            cell.onSwitch.on = switchStates[indexPath.row]!
        }else{
            cell.onSwitch.on = false
        }
        // This is a short hand syntasx of the above statement ---- cell.onSwitch.on = switchStates[indexPath.row] ?? false ---
        //set to this switchStates if exist otherwise set it to FALSE
        
        return cell
    }
    
    // this method supposes to pass back the event of switchCell was fired and pass back the Cell event
    
    func switchCell (switchCell: SwitchCell, didChangeValue value: Bool) {
        
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        switchStates[indexPath.row] = value // store the status of swithStates boolean
        
        print("Return something when click on switch button")
    }
    

    func yelpCategories( ) -> [[String:String]] {
        
        return [["name": "Afghan", "code": "afghani"],
        ["name": "African", "code": "african"],
        ["name": "American, New", "code" : "newamerican"],
        ["name": "Argentine", "code": "argentine"],
            
            ["name": "Vietname", "code": "vietnam"],
            ["name": "China", "code": "chinese"],
            ["name": "Lao", "code": "laoian"],
            
            
        ["name": "Armerian", "code" : "armenian"],
            ["name": "Austrian", "code": "austrian"]]
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
