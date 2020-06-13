//
//  FriendsTableViewController.swift
//  VKApp
//
//  Created by Julie on 14.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//


 import UIKit

var searchState: Bool = false
var friend: [FriendData] = allFriend

func Friend() {
    if searchState {
        friend = []
    } else {
        friend = allFriend
    }
}



   func FullFriendIndex() -> [String] {
       var friendIndex = [String]()
       for user in friend {
           let i: String = String(user.friendName.first!)
           if friendIndex.contains(i) {
               continue
           } else {
               friendIndex.append(i)
               }
       }
       return friendIndex.sorted()
   }

var friendIndex = FullFriendIndex()






class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet var friendsTableView: UITableView!
    @IBOutlet weak var friendsSearch: UISearchBar!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        friendsTableView.tableFooterView = UIView()
        
        
        }
    

     
    
    
    func Search(text: String) {
        
        if text == "" {
            searchState = false
            Friend()
            friendsTableView.reloadData()
        } else {
        friend.removeAll()
        searchState = true

        for item in allFriend {
            if item.friendName.lowercased().contains(text.lowercased()) {
                friend.append(item)
                friendsTableView.reloadData()
                }
            }
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        friendIndex = FullFriendIndex()
        return friendIndex.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = friendsTableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! MyCustomHeader
        Friend()
        view.title.text = String(friendIndex[section])
        view.title.backgroundColor = friendsTableView.backgroundColor

                
        return view
    }
    

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        friendIndex = FullFriendIndex()
        return  friendIndex
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendIndex = FullFriendIndex()
        
        var friendRow = [FriendData]()
        
        for user in friend {
            if friendIndex[section].contains(user.friendName.first!) {
                friendRow.append(user)
            }
        }
        return friendRow.count
    }


    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        
        var friendRow = [FriendData]()
        
        for user in friend {
            if friendIndex[indexPath.section].contains(user.friendName.first!) {
                friendRow.append(user)
            }
        }
        
        cell.friendName.text = friendRow[indexPath.row].friendName
        cell.avatar.avatar.image = friendRow[indexPath.row].friendAvatar
        cell.backgroundColor = friendsTableView.backgroundColor
        
        
        
        
        return cell
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showPictures" {
             let cell: FriendTableViewCell = sender as! FriendTableViewCell
                let friendName = cell.friendName.text!
                
                let PicturesCollectionViewController: PicturesCollectionViewController = segue.destination as! PicturesCollectionViewController
                PicturesCollectionViewController.key = friendName
            }
     }
     



// Searching - filter table

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        Friend()
        friendsTableView.reloadData()
        
        Search(text: searchText)
        
    }
    
}

