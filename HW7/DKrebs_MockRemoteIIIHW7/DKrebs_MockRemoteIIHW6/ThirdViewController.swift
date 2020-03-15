//
//  ThirdViewController.swift
//  DKrebs_MockRemoteIIIHW7
//
//  Created by user165127 on 3/10/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var validName = false
    
    @IBOutlet weak var FavSegment: UISegmentedControl!
    @IBOutlet weak var channelStepper: UIStepper!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var favText: UITextField!
    
    @IBAction func favTextEditEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        favText.resignFirstResponder()
    }
    
    @IBAction func channelStepper(_ sender: UIStepper) {
        channel = Int(sender.value)
        channelLabel.text = "\(channel)"
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        validateName(FavoriteName: favText.text!)
        if validName {
            channel = Int(channelLabel.text!)!
            favSegment = FavSegment.selectedSegmentIndex
            favName = favText.text!
            favChannels[FavSegment.selectedSegmentIndex] = channel
            successMessage()
            validName = false
        }
        else {
            favText.text = ""
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        let title = "Cancel Entry"
        let message = "You have cancelled your entry, no data saved"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
        
        FavSegment.selectedSegmentIndex = 0
        channel = 1
        channelLabel.text = "\(channel)"
        favText.text = ""
        channelStepper.value = 1
    }
    
    @IBAction func favSegmentSelected(_ sender: UISegmentedControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavSegment.selectedSegmentIndex = 0
        channelLabel.text = "\(channel)"
        channelStepper.value = Double(channel)
    }
    
    func validateName (FavoriteName name: String){
        if name.count == 4{
            validName = true
        }
        else{
            let title = "Invalid Entry"
            let message = "You have entered an invalid favorite name for the selected channel"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okayAction = UIAlertAction(title: "Re-Input", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func successMessage() {
        let title = "Sucess!"
        let message = "Favorite channel updated"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
