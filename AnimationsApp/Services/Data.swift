//
//  Data.swift
//  Animations App
//
//  Created by Denis Kitaev on 03.05.2023.
//

import SpringAnimation

final class DataStore {
    
    static let shared = DataStore()
    
    func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        
        while animations.count < AnimationPreset.allCases.count {
            let animation = Animation(
                preset: AnimationPreset.allCases.randomElement()?.rawValue ?? "",
                curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "",
                force: Double.random(in: 0.0...2.0),
                duration: Double.random(in: 0.0...2.0),
                delay: 1.0
            )
            animations.append(animation)
        }
        return animations
    }
    
    private init(){}
}
