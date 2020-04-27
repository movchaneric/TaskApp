//
//  ViewController.swift
//  TaskApp
//
//  Created by eric on 4/20/20.
//  Copyright © 2020 ericm. All rights reserved.
//

import UIKit
import CoreData

class taskList:NSManagedObject{
    @NSManaged var name: String!
    @NSManaged var dateCreated: Date!
    @NSManaged var dueDate:Date!
}

private let listIdentifier = "listIdentifier"


var taskArr: [taskList] = []


class ViewController: UIViewController {
    
    private var fetchedRC: NSFetchedResultsController<ToDo>!
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var context             = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: managedContext)
        let todo = NSEntityDescription.entity(forEntityName: "ToDo", in: managedContext)
        
       
        self.title = "Tasks List"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

    @IBAction func newTaskButton_Tapped(_ sender: Any){
        self.performSegue(withIdentifier: "newTaskSague", sender: nil)
        
        
    }
}
extension ViewController:UITableViewDataSource , UITableViewDelegate{
    
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
       }
    
    
    //data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listIdentifier, for: indexPath) as! listCell

        let row = indexPath.row
        let formatter = DateFormatter()
        
        cell.title.text = taskArr[row].name
 
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        cell.subTitle?.text = "Due:\(formatter.string(from:taskArr[row].dueDate))"
        
        return cell
        
    }
    
    
    //delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            taskArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
          
        }
    }
    
}



