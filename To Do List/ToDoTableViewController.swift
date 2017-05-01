//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by Patrick Calabrese on 2/10/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

     @IBOutlet weak var addBarButton: UIBarButtonItem!
     
     var data = [Info]()
     
     var defaultsData = UserDefaults.standard
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          // Uncomment the following line to preserve selection between presentations
          // self.clearsSelectionOnViewWillAppear = false
          
          // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
          
          self.tableView.rowHeight = 60
          self.navigationItem.leftBarButtonItem = self.editButtonItem
          
     }
     
     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }
     
     // MARK: - Table view data source
     
     override func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
          return data.count
     }
     
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TableCellVC
          
          // Configure the cell...
          cell.theImage.image = data[indexPath.row].image
          cell.title.text = data[indexPath.row].name
          cell.desc.text = data[indexPath.row].desc
          
          return cell
     }
     
     /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          // Return false if you do not want the specified item to be editable.
          return true
     }
     */
     
     
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
               // Delete the row from the data source
               data.remove(at: indexPath.row) // remove from array
               tableView.deleteRows(at: [indexPath], with: .fade)
          } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
          }
          // defaultsData.set(toDoArray, forKey: "toDoArray")
          // defaultsData.set(toDoNotes, forKey: "toDoNotes")
     }
     
     
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
          
          // first make a copy of the values in the cell we are moving
          let itemToMove = data[fromIndexPath.row]
          
          // delete them from the original location pre-move
          data.remove(at: fromIndexPath.row)
          
          // insert them to the post-move location
          data.insert(itemToMove, at: to.row)
          
          // save to user defaults
          // defaultsData.set(toDoArray, forKey: "toDoArray")
          // defaultsData.set(toDoNotes, forKey: "toDoNotes")
          
     }
     
     
     
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
          // Return false if you do not want the item to be re-orderable.
          return true
     }
     
     
     override func setEditing(_ editing: Bool, animated: Bool) {
          
          super.setEditing(editing, animated: animated)
          
          if (editing) {
               addBarButton.isEnabled = false
          } else {
               addBarButton.isEnabled = true
          }
     }
     
     
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destinationViewController.
          // Pass the selected object to the new view controller.
          
          if segue.identifier == "Show Detail" {
               let indexPath = tableView.indexPathForSelectedRow!
               let destinationViewController = segue.destination as! DetailViewController
               let selectToDo = data[indexPath.row]
               destinationViewController.item = selectToDo
          }
          
     }
     
     
     @IBAction func unwindToTableViewController(sender: UIStoryboardSegue) {
     
          if let sourceViewController = sender.source as? DetailViewController {
               
               let name = sourceViewController.toDoField.text
               let desc = sourceViewController.toDoNoteView.text
               let image = sourceViewController.image.image
               let temp = Info(image: image!, name: name!, desc: desc!)
               
               if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    data[selectedIndexPath.row] = temp
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
               } else {
                    let newIndexPath = IndexPath(row: data.count, section: 0)
                    data.append(temp)
                    tableView.insertRows(at: [newIndexPath], with: .bottom)
               }
               
               // defaultsData.set(toDoArray, forKey: "toDoArray")
               // defaultsData.set(toDoNotes, forKey: "toDoNotes")
          }
          
     }
}
