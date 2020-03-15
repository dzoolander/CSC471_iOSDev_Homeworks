//
//  ViewController.swift
//  DKrebs_ShoppingListHW5
//
//  Created by Derek Krebs on 2/19/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listArray = [String]()
    var descriptionText = ""
    var quantityText = ""

    @IBOutlet weak var listText: UITextView!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    
    
    @IBAction func newListPressed(_ sender: UIButton) {
        listText.text = "No Items"
        listArray.removeAll()
    }
    
    @IBAction func newItemPressed(_ sender: UIButton) {
        descriptionField.text = ""
        quantityField.text = ""
    }
    
    @IBAction func keyboardDismiss(_ sender: UITextField) {
        resignFirstResponder()
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        let quant = quantityField.text!
        let descr = descriptionField.text!
        if validateInput(description: descr, quantity: quant) {
            listArray.append(quant + "x " + descr)
            printList()
            descriptionField.text = ""
            quantityField.text = ""
        }
        else {return}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listText.text = "No Items"
    }
    
    //prints the shopping list (stored in listArra)
    func printList() {
        var message = ""
        for item in listArray {
            message += "\(item)\n"
        }
        listText.text = message
    }
    
    //helper function to check if string input is an Int
    func isStringAnInt(string: String) -> Bool {
    return Int(string) != nil
    }
    
    //validates input, returns true if neither are emtpy and quantity is an Int
    func validateInput(description: String, quantity: String) -> Bool {
        if descriptionField.text!.isEmpty {
            let message = "Description field is empty"
            generateAlert(message: message)
            return false
        }
        else if quantityField.text!.isEmpty {
            let message = "Quantity field is empty"
            generateAlert(message: message)
            return false
        }
        else if !isStringAnInt(string: quantity){
            let message = "Quantity is not a number"
            generateAlert(message: message)
            return false
        }
        else {
            return true
        }
    }
    
    //generate an alert
    func generateAlert(message: String) {
        let title = "Invalid Entry"
        let message = message
        let alertController =
        UIAlertController(title: title,
                          message: message,
                          preferredStyle: .alert)
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        alertController.addAction(cancelAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    
}

