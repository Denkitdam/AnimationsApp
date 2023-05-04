//
//  ViewController.swift
//  Animations App
//
//  Created by Denis Kitaev on 03.05.2023.
//

import UIKit
import SpringAnimation

final class AnimationsViewController: UIViewController {
    
    @IBOutlet var animationsView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var runButton: UIButton!

    private var animations = DataStore.shared.getAnimations()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelsFor(animation: animations.first)
        animationsView.layer.cornerRadius = 15
        runButton.layer.cornerRadius = 15
       
    }

    @IBAction func animationsButtonTapped() {
            let firstAnimation = animations.first
            
            animationsView.animation = firstAnimation?.preset ?? ""
            animationsView.curve = firstAnimation?.curve ?? ""
            animationsView.force = firstAnimation?.force ?? 0
            animationsView.duration = firstAnimation?.duration ?? 0
            animationsView.delay = firstAnimation?.delay ?? 0
            
            animationsView.animate()
            setupLabelsFor(animation: firstAnimation)
            
            let secondAnimation = animations.last
            runButton.setTitle("Run \(secondAnimation?.preset ?? "")", for: .normal)
            
            animationsView.animation = secondAnimation?.preset ?? ""
            animationsView.curve = secondAnimation?.curve ?? ""
            animationsView.force = secondAnimation?.force ?? 0
            animationsView.duration = secondAnimation?.duration ?? 0
            animationsView.delay = secondAnimation?.delay ?? 00
            
            animationsView.animate()
            setupLabelsFor(animation: secondAnimation)
            
            animations.shuffle()
            runButton.setTitle("Run \(animations.first?.preset ?? "")", for: .normal)
    }
    
    private func setupLabelsFor(animation: Animation?) {
        presetLabel.text = " Preset: \(animation?.preset ?? "")"
        curveLabel.text = "Curve: \(animation?.curve ?? "")"
        forceLabel.text = "Force: \(animation?.force.formatted() ?? "")"
        durationLabel.text = "Duration: \(animation?.duration.formatted() ?? "")"
        delayLabel.text = "Delay: \(animation?.delay.formatted() ?? "")"
    }
}

