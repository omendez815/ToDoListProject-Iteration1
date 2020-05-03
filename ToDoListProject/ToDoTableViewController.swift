//
//  ToDoTableViewController.swift
//  ToDoListProject
//
//  Created by Omar Mendez on 5/3/20.
//  Copyright © 2020 Omar Mendez. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = createToDos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    func createToDos()->[ToDo]{
        
        let show = ToDo()
        show.name = "Watch Billions"
        
        
        let walk = ToDo()
        walk.name = "Go for a walk"
        walk.important = true
        
        return [show, walk]
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        if toDo.important{
            cell.textLabel?.text = "⚡️ " + toDo.name
            cell.textLabel?.textColor = UIColor.red
        }else{
            cell.textLabel?.text = toDo.name
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: todo)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let todo = sender as? ToDo{
                completeVC.selectedToDo = todo
                completeVC.previousVC = self
            }
        }
        // Pass the selected object to the new view controller.
    }
    

}
