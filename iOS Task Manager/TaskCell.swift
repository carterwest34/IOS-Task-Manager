//
//  TaskCell.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var availabilityView: UIView!
    
    func setup(task: Task) {
        
        taskTitle.text = task.title //taskTitle pulls straight from the name given to the task
        
       
        switch task.availability { //switch on availability. if its complete, the background color will be green, and the date will no longer be hidden.
        case .complete:
            
            dueDate.isHidden = true
            availabilityView.backgroundColor = .green
            
        case .incomplete(let date): //if its incomplete, the background color will be red, the date label will be revealed, and the text of that label is formatted and setup.
            
            dueDate.isHidden = false
            availabilityView.backgroundColor = .red
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dueDate.text = dateFormatter.string(from: date)
            
        }
    }
    
}
