//
//  ViewController.swift
//  DKrebs_MockRemoteIIHW6
//
//  Created by user165127 on 2/23/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var channel = 7
    var firstNum = 0
    var secondNum = 0
    var isFirst = true
    var chanName = ""
    
    @IBOutlet weak var tvPowerLabel: UILabel!
    @IBOutlet weak var speakerVolLabel: UILabel!
    @IBOutlet weak var currentChanLabel: UILabel!
    @IBOutlet weak var tempChanDisplay: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var favChanSelector: UISegmentedControl!
    
    @IBAction func powerToggled(_ sender: UISwitch) { tvPowerLabel.text = "TV Power:    " + (sender.isOn ? "On" : "Off")
    powerSwitch.setOn(sender.isOn, animated: true)
    sender.isOn ?  enableControls() : disableControls()
    }
    
    @IBAction func volChanged(_ sender: UISlider) { speakerVolLabel.text = "Speaker Volume: \(Int(volSlider.value))"
    }
    
    @IBAction func chanUpPressed(_ sender: UIButton) {
        if channel == 99{
            channel = 1
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            favChanSelector.selectedSegmentIndex = -1
            }
        else {
            channel += 1
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            favChanSelector.selectedSegmentIndex = -1
            }
    }
    
    @IBAction func chanDownPressed(_ sender: UIButton) {
        if channel == 1{
            channel = 99
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            favChanSelector.selectedSegmentIndex = -1
            }
        else {
            channel -= 1
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            favChanSelector.selectedSegmentIndex = -1
            }
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        guard let digit = Int(sender.titleLabel!.text!)else {return}
        let digitText = sender.titleLabel?.text
        if isFirst {
            firstNum = digit
            tempChanDisplay.text = digitText! + " _"
            isFirst = false
        }
        else {
            secondNum = digit
            calcChannel()
            if channel > 0 {
                currentChanLabel.text = "Current Channel:  " + "\(channel)"
                tempChanDisplay.text = ""
                isFirst = true
                favChanSelector.selectedSegmentIndex = -1
            }
            isFirst = true
        }
    }
    
    @IBAction func favChanSelected(_ sender: UISegmentedControl) {
        if let name = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            chanName = name
        }
        
        switch chanName {
        case "Sci":
            channel = 49
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "NBC":
            channel = 5
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "CNN":
            channel = 54
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "CNBC":
            channel = 44
            currentChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calcChannel() {
        if firstNum == 0 {
            channel = secondNum
        }
        else {
            channel = (firstNum * 10) + secondNum
        }
    }
    
    func enableControls(){
        volSlider.isEnabled = true
        buttonView.isUserInteractionEnabled = true
        favChanSelector.isUserInteractionEnabled = true
    }
    
    func disableControls() {
        volSlider.isEnabled = false
        buttonView.isUserInteractionEnabled = false
        favChanSelector.isUserInteractionEnabled = false
    }


}

