//
//  Team.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/13/23.
//

import Foundation

struct Team {
    
    let id: TeamType    
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
}
