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
        while animations.count <= DataStore.shared.animationPresets.count {
            let animation = Animation(
                preset: DataStore.shared.animationPresets.randomElement() ?? "",
                curve: DataStore.shared.animationsCurves.randomElement() ?? "",
                force: Double.random(in: 0.0...2.0),
                duration: Double.random(in: 0.0...2.0),
                delay: 1.0
            )
            animations.append(animation)
        }
        
        return animations
    }
}

