//
//  Cloud.swift
//  WarFly
//
//  Created by Kisluhin Mihail on 24.11.22.
//


import SpriteKit
import GameplayKit

protocol GameBackgroundSpriteable {
    static func populateSprite(at point: CGPoint) -> Self
}
    
final class Cloud: SKSpriteNode, GameBackgroundSpriteable {
    static func populateSprite(at point: CGPoint) -> Cloud {
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point
        cloud.zPosition = 10
        cloud.run(move(from: point))
        
        return cloud
    }

    fileprivate static func configureName() -> String{
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNumber = distribution.nextInt()
        let imageName = "cl" + "\(randomNumber)"
        
        return imageName
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        
        return randomNumber
    }
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed: CGFloat = 75
        let duration = moveDistance / movementSpeed
        
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
    
}

