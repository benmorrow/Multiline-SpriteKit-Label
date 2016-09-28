# Multiline SpriteKit Label
Adds support via an extension to lay out text on multiple lines in an `SKLabelNode`

![simulator screenshot multiline SKLabelNode](http://i.imgur.com/7TmCORE.png)

SpriteKit is the 2D game development framework for Apple platforms: macOS, iOS, tvOS, and watchOS. In SpriteKit, you use an `SKLabelNode` to add text to the scene. However, `SKLabelNode` does not support multiline strings. Since `SKLabelNode`'s functionality is limited, you can use this extension to solve the problem. Just add newline characters, "\n", in the `String` whereever you want a line break.

Here's the solution in Swift 3:

```swift
extension SKLabelNode {
  func multilined() -> SKLabelNode {
    let substrings: [String] = self.text!.components(separatedBy: "\n")
    return substrings.enumerated().reduce(SKLabelNode()) {
      let label = SKLabelNode(fontNamed: self.fontName)
      label.text = $1.element
      label.fontColor = self.fontColor
      label.fontSize = self.fontSize
      label.position = self.position
      label.horizontalAlignmentMode = self.horizontalAlignmentMode
      label.verticalAlignmentMode = self.verticalAlignmentMode
      let y = CGFloat($1.offset - substrings.count / 2) * self.fontSize
      label.position = CGPoint(x: 0, y: -y)
      $0.addChild(label)
      return $0
    }
  }
}
```

Here's how you use it:

```swift
let text = "hot dogs\ncold beer\nteam jerseys"
let singleLineMessage = SKLabelNode()
singleLineMessage.fontSize = min(size.width, size.height) /
  CGFloat(text.components(separatedBy: "\n").count) // Fill the screen
singleLineMessage.verticalAlignmentMode = .center // Keep the origin in the center
singleLineMessage.text = text
let message = singleLineMessage.multilined()
message.position = CGPoint(x: frame.midX, y: frame.midY)
message.zPosition = 1001  // On top of all other nodes
addChild(message)
```
Download this project to try it out. Build and run the iOS app scheme. You'll see the multiline `SKLabelNode` displayed in the simulator.
