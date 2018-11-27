//
//  ViewController.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //creating a shared instance of the task class to be used across all files
    let tasksSharedInstance = Tasks.sharedInstance
    
    //all we want to do in out viewDidLoad is reload data so the table view cells will be created
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
    }
    
    //need viewDidAppear function so that when we popViewController from the add task view controller so that the cells will update with tableView.reloadData()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //this function will add the option to mark a task as incomplete and sets up the new cell for when the user wishes to mark it incomplete.
    func markIncomplete(at indexPath: IndexPath) {
        let task = self.tasksSharedInstance.tasks[indexPath.row]
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        task.availability = .incomplete(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! TaskCell).setup(task: task)
    }
    
    //similar to the markIncomplete function, we set up the cell for when the user wishes to mark it complete
    func markComplete(at indexPath: IndexPath) {
        let task = self.tasksSharedInstance.tasks[indexPath.row]
        task.availability = .complete
        (tableView.cellForRow(at: indexPath) as! TaskCell).setup(task: task)
        
    }
    
    //the number of rows in our table view should be the amount of tasks in our array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksSharedInstance.tasks.count
    }
    
    //in each table view cell, we want to setup the cell based on what the user adds in the add game view controller
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        let task = tasksSharedInstance.tasks[indexPath.row]
        
        cell.setup(task: task)
        
        return cell
    }
    
    
    //when a cell is selected, an alert will pop up that presents the corresponding description to the cell at indexPath.row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTask = tasksSharedInstance.tasks[indexPath.row]
        
        //tableView.deselectRow will just deselect the cell after we click on it.
        tableView.deselectRow(at: indexPath, animated: true)
        let detailAlert = UIAlertController(title: "Task Description", message: "\(selectedTask.description)", preferredStyle: .alert)
        let detailAction = UIAlertAction(title: "Thanks!", style: .destructive)
        detailAlert.addAction(detailAction)
        self.present(detailAlert, animated: true, completion: nil)
    }
    
    //in this function, we will add the delete action variable and switch on availability so that the cell will show each property properly.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.tasksSharedInstance.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let task = tasksSharedInstance.tasks[indexPath.row]
        
      //switch on the availability of the tasks. 
        switch task.availability {
        case .complete:
            let markIncompleteAction = UITableViewRowAction(style: .normal, title: "Mark Incomplete") { _, indexPath in
                
                self.markIncomplete(at: indexPath)
                
            }
            
            return [markIncompleteAction, deleteAction]
            
        case .incomplete:
            let markCompleteAction = UITableViewRowAction(style: .normal, title: "Mark Complete") { _, indexPath in
                self.markComplete(at: indexPath)
                
            }
            
            return [markCompleteAction, deleteAction]
            
        }
    }
}
