//
//  GameScene.swift
//  MultilinedSKLabelNode
//
//  Created by temporary on 9/27/16.
//  Copyright © 2016 benmorrow. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  override func sceneDidLoad() {
    let text = "hot dogs\ncold beer\nteam jerseys"
    let singleLineMessage = SKLabelNode()
    singleLineMessage.fontSize = min(size.width, size.height) /
      CGFloat(text.components(separatedBy: "\n").count)
    singleLineMessage.verticalAlignmentMode = .center
    singleLineMessage.text = text
    let message = singleLineMessage.multilined()
    message.position = CGPoint(x: frame.midX, y: frame.midY)
    message.zPosition = 1001
    addChild(message)
  }

}
