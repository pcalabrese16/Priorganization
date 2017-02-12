//
//  DetailViewController.swift
//  To Do List
//
//  Created by Patrick Calabrese on 2/10/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoField: UITextField!
    
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toDoField.text = toDoItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveBarButton == sender as! UIBarButtonItem {
           toDoItem = toDoField.text
        }
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMode == true {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }


}

