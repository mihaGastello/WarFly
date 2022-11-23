//
//  Background.swift
//  WarFly
//
//  Created by Kisluhin Mihail on 21.11.22.
//

import UIKit
import SpriteKit

class Background: SKSpriteNode {
    static func populateBackground(at point: CGPoint) -> Background {
        let background = Background(imageNamed: "background")
        background.position = point
        background.zPosition = 0
        
        return background
    }

}
