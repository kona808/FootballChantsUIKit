//
//  Manager.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/13/23.
//

import Foundation

enum JobType: String {
    case manager = "Manager"
    case headCoach = "Head Coach "
}

struct Manager {
    
    let name: String
    let job: JobType
}
