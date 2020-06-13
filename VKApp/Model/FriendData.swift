//
//  FriendData.swift
//  VKApp
//
//  Created by Julie on 17.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import Foundation
import UIKit

struct FriendData: Equatable {
    var friendName: String
    var friendAvatar: UIImage
}


var allFriend: [FriendData] = [FriendData(friendName: "Water", friendAvatar: UIImage(named: "1")!),
   FriendData(friendName: "Space", friendAvatar: UIImage(named: "2")!),
   FriendData(friendName: "Earth", friendAvatar: UIImage(named: "3")!),
   FriendData(friendName: "Sky", friendAvatar: UIImage(named: "4")!),
   FriendData(friendName: "Fire", friendAvatar: UIImage(named: "5")!),
   FriendData(friendName: "Eagle", friendAvatar: UIImage(named: "6")!)]



