//
//  newTaskVC.swift
//  TaskApp
//
//  Created by eric on 4/22/20.
//  Copyright © 2020 ericm. All rights reserved.
//

import UIKit
import CoreData


class newTaskVC: UITableViewController , UITextFieldDelegate {

    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context     = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var didCreateTask: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black.withAlphaComponent(0.5)
        
        taskNameField.delegate = self
        
        taskNameField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged )
        
        taskNameField.becomeFirstResponder()
    
       
    }
    
    @objc func textFieldEdited(){
        guard let name = taskNameField.text, !name.isEmpty else {
            return
        }
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
    }
//MARK: Buttons
    
    //cancel button
    @IBAction func cancelButton_Tapped(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
        didCreateTask = false
        self.navigationController?.popViewController(animated: true)
    }
    
   // Save Button
    @IBAction func doneButton_Tapped(_ sender: Any) {
  
       let newTask = taskList()
        newTask.name = taskNameField.text!
        newTask.dueDate = dueDatePicker.date
        newTask.dateCreated = Date()
        appDelegate.saveContext()
        taskArr.append(newTask)
        
        didCreateTask = true
        self.navigationController?.popViewController(animated: true)
    }
 
}





