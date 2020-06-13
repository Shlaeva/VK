//
//  GroupsTableViewController.swift
//  VKApp
//
//  Created by Julie on 15.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit



class GroupsTableViewController: UITableViewController, UISearchBarDelegate {

    var group: [GroupData] = allgroup
    
    
    var searchState: Bool = false
    
    func Group() {
        if searchState {
            group = []
        } else {
            group = allgroup
        }
    }
    
    @IBOutlet var groupsTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.tableFooterView = UIView()
    }

    
    func Search(text: String) {
        
        if text == "" {
            searchState = false
            Group()
            groupsTableView.reloadData()
        } else {
            group.removeAll()
            searchState = true
            for item in allgroup {
                if item.groupName.lowercased().contains(text.lowercased()) {
                    group.append(item)
                    groupsTableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var groupRow = [GroupData]()
        for item in allgroup {
            if group.contains(item) {
                groupRow.append(item)
            }
        }
        
        return groupRow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        
        cell.groupName.text = group[indexPath.row].groupName
        cell.groupImage.image = group[indexPath.row].groupImage
        
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        groupsTableView.reloadData()
        Search(text: searchText)
    }
    
}

