//
//  Manager.swift
//  Football Chants
//
//  Created by Jacob Perez on 10/13/23.
//

import Foundation

enum JobType {
    case manager
    case headCoach
}

struct Manager {
    
    let name: String
    let job: JobType
}
