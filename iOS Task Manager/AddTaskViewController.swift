//
//  AddTaskViewController.swift
//  iOS Task Manager
//
//  Created by Carter West on 11/26/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    //MARK: IBActions
    @IBAction func addTaskAction(_ sender: Any) {
        //input validation to make sure the user enters something into the name and description text fields.
        guard
            let taskName = taskNameTextField.text, !taskName.isEmpty,
            let description = taskDescriptionTextField.text, !description.isEmpty
            else { //if the text field is empty...
                let errorAlert = UIAlertController(title: "Error", message: "Please enter text into the task name and task description text field to successfully enter a game", preferredStyle: .alert)
                let errorAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) //this alert action will have no function. it will just didmiss the alert when pressed
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        //setting up the inital due date to be displayed in the cell.
        let calendar = Calendar(identifier: .gregorian)
        let initialDueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        let newTask = Task(title: taskName, description: description, initialDueDate: initialDueDate)
        //this alert notifies the user that their task has been added successfully, as well as segue the user back to the task manager screen after pressing the alert action.e
        let addAlert = UIAlertController(title: "Task Added!", message: "You have added \(String(describing: taskName))", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Thanks", style: .default)
        {UIAlertAction in
            Tasks.sharedInstance.tasks.append(newTask)
            self.navigationController?.popViewController(animated: true)
        }
        addAlert.addAction(addAction)
        self.present(addAlert, animated: true, completion: nil)
    }
    
}
