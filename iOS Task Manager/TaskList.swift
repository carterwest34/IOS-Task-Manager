//
//  TaskList.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Tasks {
    
    //we setup a shared instance of our task array for all our files to pull from
    static let sharedInstance = Tasks()
    
    //setup empty task array.
    var tasks = [Task]()
}
