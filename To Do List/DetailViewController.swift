//
//  DetailViewController.swift
//  To Do List
//
//  Created by Patrick Calabrese on 2/10/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoField: UITextField!
    
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toDoField.text = toDoItem
        toDoField.delegate = self
        toDoField.becomeFirstResponder()
        
        if toDoItem?.characters.count == 0 || toDoItem == nil {
            saveBarButton.isEnabled = false
        } else {
            saveBarButton.isEnabled = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // if this was called because the user is typing in the toDoField
        if textField == toDoField {
            // grab text before the typing
            let oldString = textField.text! as NSString
            // find out what the new string will look like after typing
            let newString = oldString.replacingCharacters(in: range, with: string) as NSString
            // if, after the typing, the new String has nothing in it, disbale the save button
            if newString.length == 0 {
                saveBarButton.isEnabled = false
            } else {
                saveBarButton.isEnabled = true
            }
        }
        return true
    }


    
    
    // MARK:- Navigation
    
    
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

