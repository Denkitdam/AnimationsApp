//
//  ViewController.swift
//  Animations App
//
//  Created by Denis Kitaev on 03.05.2023.
//

import UIKit
import SpringAnimation

class AnimationsViewController: UIViewController {
    
    @IBOutlet var animationsView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!

    private let animations = DataStore.shared.getAnimations()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationsView.layer.cornerRadius = 15
       
    }

    @IBAction func animationsButtonTapped() {
        let animation = animations.randomElement()
        animationsView.animation = animation?.preset ?? ""
        animationsView.curve = animation?.curve ?? ""
        animationsView.force = animation?.force ?? 0
        animationsView.duration = animation?.duration ?? 0
        animationsView.delay = animation?.delay ?? 0
        
        setupLabelsFor(animation: animation)
        
        animationsView.animate()
        
    }
    
    private func setupLabelsFor(animation: Animation?) {
        presetLabel.text = " Preset: \(animation?.preset ?? "")"
        curveLabel.text = "Curve \(animation?.curve ?? "")"
        forceLabel.text = "Force \(animation?.force.formatted() ?? "")"
        durationLabel.text = "Duration \(animation?.duration.formatted() ?? "")"
        delayLabel.text = "Delay \(animation?.delay.formatted() ?? "")"
    }
}

