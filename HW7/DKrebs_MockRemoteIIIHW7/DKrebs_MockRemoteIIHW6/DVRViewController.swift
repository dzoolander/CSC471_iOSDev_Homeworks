//
//  DVRViewController.swift
//  DKrebs_MockRemoteIIHW6
//
//  Created by user165127 on 2/23/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {
    
    var state = "Stopped"
    var force = false

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var fastRewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var controlView: UIView!
    
    @IBAction func powerToggled(_ sender: UISwitch) {
        powerLabel.text = "DVR Power:    " + (sender.isOn ? "On" : "Off")
        state = "Stopped"
        stateLabel.text = "State:  " + "\(state)"
        powerSwitch.setOn(sender.isOn, animated: true)
        sender.isOn ?  enableControls() : disableControls()
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        if state == "Play" || state == "Pause" || state == "Stopped" || state == "Fast Forward" || state == "Fast Rewind" {
            state = "Play"
            stateLabel.text = "State:  " + "\(state)"
        }
        else {
            generateAlert(message: "Invalid state. Force 'Play' action?", forceStateTo: "Play")
        }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        state = "Stopped"
        stateLabel.text = "State:  " + "\(state)"
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if state == "Play" || state == "Pause" {
            state = "Pause"
            stateLabel.text = "State:  " + "\(state)"
        }
        else {
            generateAlert(message: "Invalid state. Force 'Pause' action?", forceStateTo: "Pause")
        }
    }
    
    @IBAction func fastForwardPressed(_ sender: UIButton) {
        if state == "Play" || state == "Fast Forward" {
            state = "Fast Forward"
            stateLabel.text = "State:  " + "\(state)"
        }
        else {
            generateAlert(message: "Invalid state. Force 'Fast Forward' action?", forceStateTo: "Fast Forward")
        }
    }
    
    @IBAction func fastRewindPressed(_ sender: UIButton) {
        if state == "Play" || state == "Fast Rewind" {
            state = "Fast Rewind"
            stateLabel.text = "State:  " + "\(state)"
        }
        else {
            generateAlert(message: "Invalid state. Force 'Fast Rewind' action?", forceStateTo: "Fast Rewind")
        }
    }
    
    @IBAction func recordPressed(_ sender: UIButton) {
        if state == "Stopped"  {
            state = "Recording"
            stateLabel.text = "State:  " + "\(state)"
        }
        else {
            generateAlert(message: "Invalid state. Force 'Record' action?", forceStateTo: "Recording")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func enableControls(){
        controlView.isUserInteractionEnabled = true
    }
    
    func disableControls() {
        controlView.isUserInteractionEnabled = false
    }
    
    //generate an alert
    func generateAlert(message: String, forceStateTo: String) {
        let message = message
        let alertController = UIAlertController(title: "Invalid Command", message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { action in
            let cancelController = UIAlertController(title: "Cancel Confirmation", message: "Action Cancelled", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            cancelController.addAction(okayAction)
            self.present(cancelController, animated: true, completion: nil)
        }
        
        let forceAction = UIAlertAction(title: "Force", style: .default) { action in
            self.state = forceStateTo
            let forceController = UIAlertController(title: "Force Operation Confirmation", message: "Current operation stopped, requested operation proceding", preferredStyle: .alert)
            let forceAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            forceController.addAction(forceAction)
            self.present(forceController, animated: true, completion: nil)
            self.stateLabel.text = "State:  " + "\(forceStateTo)"
        }
        alertController.addAction(forceAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
