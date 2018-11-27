//
//  Task.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Task {
    
    //setting up dates to be passed in when being initialized.
     let calendar = Calendar(identifier: .gregorian)
     lazy var initialDueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
    
    var title: String
    var description: String
    var dueDate: Date?
    
  enum Availability {
        case complete
        case incomplete(dueDate: Date)
    }
    
    //setup variables and constants ready to be passed in for initializing.
    
    var availability: Availability
    
    init(title: String, description: String, initialDueDate: Date) {
        
        self.title = title
        self.description = description
        self.availability = .incomplete(dueDate: initialDueDate)
        
    }
}
