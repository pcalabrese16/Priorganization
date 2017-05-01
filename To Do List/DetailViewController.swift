//
//  DetailViewController.swift
//  To Do List
//
//  Created by Patrick Calabrese on 2/10/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoField: UITextField!
    
    @IBOutlet weak var toDoNoteView: UITextView!
    
    var imagePicker = UIImagePickerController()

    var item: Info?
    
    var toDoItem: String?
    
    var toDoNote: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toDoField.text = item?.name
        toDoNoteView.text = item?.desc
        image.image = item?.image
        toDoField.delegate = self
        toDoField.becomeFirstResponder()
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        if toDoItem?.characters.count == 0 || toDoItem == nil {
            saveBarButton.isEnabled = false
        } else {
            saveBarButton.isEnabled = true
            navigationItem.title = "To Do Item"
        }
        
    }

    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        self.view.endEditing(true)
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
            toDoNote = toDoNoteView.text
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info[] parameter will get a particular kind of media.  Here we get the original image.  We use as! UIImage to cast the data passed into selectedImage as a UIImage.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Add our selectedImage to the .image parameter of our imageToPunch
        image.image = selectedImage
        // Now that we've got the image we can close the UIImagePicker using the dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    // This method is required so that the UIImagePickerController can be canceled by the user without picking an image.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // All we need to do is call the dismiss method.
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectPhotoPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }

    }

}

