//
//  PizzaPlace.swift
//  DKrebs_TableViewAppHW8
//
//  Created by user165127 on 3/11/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import Foundation

class PizzaPlace {
    
    enum Rank: String {
        case top20 = "top20"
        case top15 = "top15"
        case top10 = "top10"
        case top5 = "top5"
    }
    var name: String
    var rank: Rank
    var shortDesc: String
    var longDesc: String
    
    init(name: String, rank: Rank, shortDesc: String, longDesc: String){
        self.name = name
        self.rank = rank
        self.shortDesc = shortDesc
        self.longDesc = longDesc
    }
    
}
