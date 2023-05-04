//
//  Animation.swift
//  Animations App
//
//  Created by Denis Kitaev on 03.05.2023.
//


struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        let presets = DataStore.shared.animationPresets.shuffled()
        let curves = DataStore.shared.animationsCurves.shuffled()
        
        for index in 0..<presets.count {
            let animation = Animation(
                preset: presets[index],
                curve: curves[index],
                force: Double.random(in: 0.0...2.0),
                duration: Double.random(in: 0.0...2.0),
                delay: 1.0
            )
            animations.append(animation)
        }
        
        return animations
    }
}

