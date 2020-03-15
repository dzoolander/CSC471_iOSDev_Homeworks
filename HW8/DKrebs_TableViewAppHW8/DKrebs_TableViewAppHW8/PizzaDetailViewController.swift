//
//  ViewController.swift
//  DKrebs_TableViewAppHW8
//
//  Created by user165127 on 3/11/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class PizzaDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    
    var pizzaPlace: PizzaPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        if let p = pizzaPlace {
            nameLabel.text = p.name
            descripLabel.text = p.longDesc
        }
    }


}

