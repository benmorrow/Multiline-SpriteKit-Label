//
//  GameViewController.swift
//  MultilinedSKLabelNode
//
//  Created by temporary on 9/27/16.
//  Copyright © 2016 benmorrow. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let view = self.view as! SKView? else {
      return
    }
    
    let scene = GameScene(size: view.frame.size)
    view.presentScene(scene)
  }
}
