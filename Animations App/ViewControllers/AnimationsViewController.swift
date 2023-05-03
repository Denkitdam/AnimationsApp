//
//  ViewController.swift
//  Animations App
//
//  Created by Denis Kitaev on 03.05.2023.
//

import UIKit
import SpringAnimation

class AnimationsViewController: UIViewController {
    
    @IBOutlet var AnimationsView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func animationsButtonTapped() {
        
    }
}

