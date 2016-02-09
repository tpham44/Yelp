//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate {

    var businesses: [Business]!
    var buninessesBackup: [Business]!
    var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
   
    //tableView.rowHeight = UITableViewAutomaticDimension
    //tableView.estimatedRowHeight = 120
    
    //return cell

/*
     func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
     
             if(businessesBackup == nil) {
                     businessesBackup = businesses
                 }
     
             // When there is no text, filteredData is the same as the original data
             if searchText.isEmpty {
                     businesses = businessesBackup
             } else {
                     // The user has entered text into the search box
                         // Use the filter method to iterate over all items in the data array
                         // For each item, return true if the item should be included and false if the
                         // item should NOT be included
                         businesses = businesses.filter({(dataItem: Business) -> Bool in
             
                             // If dataItem matches the searchText, return true to include it
                             if dataItem.name!.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
                                 return true
                             }else {
                                 return false
                            }
                         })
                    }
        
             tableView.reloadData()
        
         }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        tableView.dataSource = self
        tableView.delegate = self
        LoadMoreData()
    }
    
    func LoadMoreData()
    {

        
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120  // setting for scroll bar length; which is using for the scoll height dimension
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            //self.businesses = businesses
            
            
            if(self.businesses == nil) {
                self.businesses = businesses
            } else {
                self.businesses.appendContentsOf(businesses)
            }
            self.tableView.reloadData()

            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // check for input business data if there any data the return number of businesses otherwise nothing
        //if bussiness is not empty then return something
        if businesses != nil{
            return businesses!.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
               
        return cell
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let navigationController = segue.destinationViewController as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
        
        
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        var categories = filters["categories"] as? [String]//expect the key word catagories
        
        Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            
            }
    }
}
