//
//  FiltersViewController.swift
//  Yelp
//
//  Created by JP on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    
    var categories: [[String:String]]!
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
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("switchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = categories[indexPath.row]["name"]
        
        return cell
    }

    func yelpCategories( ) -> [[String:String]] {
        
        return [["name": "Afghan", "code": "afghani"],
        ["name": "African", "code": "african"],
        ["name": "American, New", "code" : "newamerican"],
        ["name": "Argentine", "code": "argentine"],
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
