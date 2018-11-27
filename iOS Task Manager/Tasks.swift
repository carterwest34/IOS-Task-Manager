//
//  Tasks.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Tasks {
    
    //we setup a shared instance of our library array for all our files to pull from
    static let sharedInstance = Library()
    
    //setup empty game array.
    var tasks = [Game]()
}
