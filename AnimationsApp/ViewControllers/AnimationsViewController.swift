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

    private var animations = Animation.getAnimations()
    private var firstTap = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelsFor(animation: animations.first)
        animationsView.layer.cornerRadius = 15
        runButton.layer.cornerRadius = 15
       
    }

    @IBAction func animationsButtonTapped() {
        if firstTap {
            let firstAnimation = animations.first
            setup(firstAnimation)
            animationsView.animate()
            setupLabelsFor(animation: firstAnimation)
            firstTap = false
            runButton.setTitle("Run \(animations.last?.preset ?? "")", for: .normal)
        } else {
            let secondAnimation = animations.last
            setup(secondAnimation)
            animationsView.animate()
            setupLabelsFor(animation: secondAnimation)
            
            animations.shuffle()
            runButton.setTitle("Run \(animations.first?.preset ?? "")", for: .normal)
            firstTap = true
        }
    }
    
    private func setupLabelsFor(animation: Animation?) {
        presetLabel.text = " Preset: \(animation?.preset ?? "")"
        curveLabel.text = "Curve: \(animation?.curve ?? "")"
        forceLabel.text = "Force: \(animation?.force.formatted() ?? "")"
        durationLabel.text = "Duration: \(animation?.duration.formatted() ?? "")"
        delayLabel.text = "Delay: \(animation?.delay.formatted() ?? "")"
    }
    private func setup(_ animation: Animation?) {
        animationsView.animation = animation?.preset ?? ""
        animationsView.curve = animation?.curve ?? ""
        animationsView.force = animation?.force ?? 0
        animationsView.duration = animation?.duration ?? 0
        animationsView.delay = animation?.delay ?? 00
    }
}

