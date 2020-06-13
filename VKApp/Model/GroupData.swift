//
//  GroupData.swift
//  VKApp
//
//  Created by Julie on 17.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

struct GroupData: Equatable {
    var groupName: String
    var groupImage: UIImage
}

let allgroup: [GroupData] = [
GroupData(groupName: "Mars", groupImage: UIImage(named: "ma")!),
GroupData(groupName: "Earth", groupImage: UIImage(named: "ea")!),
GroupData(groupName: "Saturn", groupImage: UIImage(named: "sa")!),
GroupData(groupName: "Sun", groupImage: UIImage(named: "su")!),
GroupData(groupName: "Mercury", groupImage: UIImage(named: "me")!),
GroupData(groupName: "Jupiter", groupImage: UIImage(named: "ju")!),
GroupData(groupName: "Moon", groupImage: UIImage(named: "mo")!),
GroupData(groupName: "Venus", groupImage: UIImage(named: "ve")!)
]


