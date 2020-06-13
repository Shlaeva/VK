//
//  FriendsGroupsTableViewController.swift
//  VKApp
//
//  Created by Julie on 15.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

var allMyGroup: [GroupData] = [GroupData(groupName: "Sun", groupImage: UIImage(named:"su")!),
GroupData(groupName: "Mercury", groupImage: UIImage(named:"me")!),
GroupData(groupName: "Jupiter", groupImage: UIImage(named:"ju")!),
GroupData(groupName: "Moon", groupImage: UIImage(named:"mo")!)]




class MyGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    
    var mygroup: [GroupData] = allMyGroup
      
    var searchState: Bool = false
          
       func MyGroup() {
           if searchState {
               mygroup = []
           } else {
               mygroup = allMyGroup
           }
       }
    
    @IBOutlet var myGroupsTableView: UITableView!
   
    @IBOutlet weak var SearchGroup: UISearchBar!
    
    @IBAction func addGroup (segue: UIStoryboardSegue) {
     
           if segue.identifier == "addGroup" {
               guard let GroupsTableViewController = segue.source as? GroupsTableViewController else { return }
               if let indexPath = GroupsTableViewController.tableView.indexPathForSelectedRow {
                let newGroup = GroupsTableViewController.group[indexPath.row]
                if !mygroup.contains(newGroup) {
                mygroup.append(newGroup)
                myGroupsTableView.reloadData()
//                tableView.reloadData()
                    }
                }
            }
        }
      
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGroupsTableView.tableFooterView = UIView()
        
    }


    
    
   func Search(text: String) {

    if text == "" {
        searchState = false
        MyGroup()
        myGroupsTableView.reloadData()
        
    } else {
        mygroup.removeAll()
        searchState = true
           for item in allMyGroup {
                if item.groupName.lowercased().contains(text.lowercased()) {
                    mygroup.append(item)
                    myGroupsTableView.reloadData()
               }
            }
       }

   }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        var mygroupRow = [GroupData]()
        for item in allMyGroup {
            if mygroup.contains(item) {
                mygroupRow.append(item)
            }
        }
        return mygroupRow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupTableViewCell
        
            cell.myGroupName.text = mygroup[indexPath.row].groupName
            cell.myGroupImage.image = mygroup[indexPath.row].groupImage
        
        return cell
    }

    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mygroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
//        myGroupsTableView.reloadData()
        Search(text: searchText)

    }
 
    
}


