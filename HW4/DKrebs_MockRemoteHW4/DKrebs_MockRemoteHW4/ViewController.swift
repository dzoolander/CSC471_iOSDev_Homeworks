//
//  ViewController.swift
//  DKrebs_MockRemoteHW4
//
//  Created by user165127 on 2/19/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var channel = 7
    var firstNum = 0
    var secondNum = 0
    var isFirst = true
    var chanName = ""

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var speakerVolLabel: UILabel!
    @IBOutlet weak var currChanLabel: UILabel!
    @IBOutlet weak var tempChanDisplay: UILabel!
    
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var favChanSelector: UISegmentedControl!
    
    @IBAction func powerToggled(_ sender: UISwitch) { powerLabel.text = "TV Power:   " + (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        sender.isOn ?  enableControls() : disableControls()
    }
    
    @IBAction func volSliderMoved(_ sender: UISlider) { speakerVolLabel.text = "Speaker Volume: \(Int(volSlider.value))"    }
    
    @IBAction func chanUpPressed(_ sender: UIButton) { if channel == 99{
        channel = 1
        currChanLabel.text = "Current Channel:  " + "\(channel)"
        favChanSelector.selectedSegmentIndex = -1
        }
    else {
        channel += 1
        currChanLabel.text = "Current Channel:  " + "\(channel)"
        favChanSelector.selectedSegmentIndex = -1
        }
    }
    
    @IBAction func chanDownPressed(_ sender: UIButton) { if channel == 1{
        channel = 99
        currChanLabel.text = "Current Channel:  " + "\(channel)"
        favChanSelector.selectedSegmentIndex = -1
        }
    else {
        channel -= 1
        currChanLabel.text = "Current Channel:  " + "\(channel)"
        favChanSelector.selectedSegmentIndex = -1
        }
    }
    
    @IBAction func digitPressed(_ sender: UIButton) { guard let digit = Int(sender.titleLabel!.text!)else {return}
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
                currChanLabel.text = "Current Channel:  " + "\(channel)"
                tempChanDisplay.text = ""
                isFirst = true
                favChanSelector.selectedSegmentIndex = -1
            }
            isFirst = true
        }
    }
    
    @IBAction func favSelected(_ sender: UISegmentedControl) { if let name = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            chanName = name
        }
        
        switch chanName {
        case "Sci":
            channel = 49
            currChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "NBC":
            channel = 5
            currChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "CNN":
            channel = 54
            currChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        case "CNBC":
            channel = 44
            currChanLabel.text = "Current Channel:  " + "\(channel)"
            break
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        speakerVolLabel.text = "Speaker Volume: \(Int(volSlider.value))"
        currChanLabel.text = "Current Channel:  " + "\(channel)"
        tempChanDisplay.text = ""
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
        favChanSelector.isEnabled = true
        buttonContainer.isUserInteractionEnabled = true
    }
    
    func disableControls() {
        volSlider.isEnabled = false
        favChanSelector.isEnabled = false
        buttonContainer.isUserInteractionEnabled = false
    }


}

