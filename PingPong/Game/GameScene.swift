//
//  GameScene.swift
//  SwiftUILearning
//
//  Created by Erik on 03.01.2023.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    var selectedNodes:[UITouch:SKSpriteNode] = [:]
    var player1Score = 0
    var player2Score = 0
    var score = SKLabelNode(text: "")
    override func didMove(to view: SKView) {
        print("game loaded")
        
        createPlatform(pos: CGPoint(x: UIScreen.main.bounds.width / 2, y: 100), color: .white, platform: myPlatform)
        createPlatform(pos: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 100), color: .white, platform: enemyPlatform)
        createBall(pos: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2), color: .white)
        
        score.text = "\(player1Score) : \(player2Score)"
        score.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(score)
        update(TimeInterval(1))
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderOfFrame()
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    let myPlatform = SKSpriteNode()
    let enemyPlatform = SKSpriteNode()
    let ball = SKShapeNode(circleOfRadius: 10)
    
    func restart() {
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.fieldBitMask = 0
        ball.physicsBody?.contactTestBitMask = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.velocity = CGVector(dx: 10, dy: 10)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if isBallScoredForPlayerOne() {
            restart()
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
            player2Score += 1
        }
        if isBallScoredForPlayerTwo() {
            restart()
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
            player1Score += 1
        }
        score.text = "\(player1Score) : \(player2Score)"
    }
   
    func isBallScoredForPlayerOne() -> Bool {
        
        if (ball.position.y < 100){
            return true
        }
        return false
    }
    
    func isBallScoredForPlayerTwo() -> Bool {
        
        if (ball.position.y > size.height - 100){
            return true
        }
        return false
    }
    
    func borderOfFrame() {
        let frame = self.frame
        let path = UIBezierPath(roundedRect: frame, cornerRadius: 60)
        
        let borderLine = SKShapeNode(path: path.cgPath)
        borderLine.lineWidth = 2
        borderLine.strokeColor = .white
        
        self.addChild(borderLine)
    }
    
    func createBall(pos: CGPoint, color: UIColor) {
        ball.name = "ball"
        ball.fillColor = color
        ball.position = pos
        
        //physics properties
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.pinned = false
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.fieldBitMask = 0
        ball.physicsBody?.contactTestBitMask = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.velocity = CGVector(dx: 10, dy: 10)
        self.addChild(ball)
        
    }
    
    func createPlatform(pos: CGPoint, color: UIColor, platform: SKSpriteNode){
        platform.size = CGSize(width: UIScreen.main.bounds.width / 3, height: 10)
        platform.color = color
        platform.position = pos
        platform.name = "myPlatform"
        
        //physics properties
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.frame.size)
        platform.physicsBody?.isDynamic = false
        platform.physicsBody?.allowsRotation = false
        platform.physicsBody?.pinned = false
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.usesPreciseCollisionDetection = true
        platform.physicsBody?.categoryBitMask = 1
        platform.physicsBody?.collisionBitMask = 2
        platform.physicsBody?.fieldBitMask = 0
        platform.physicsBody?.contactTestBitMask = 2
        
        self.addChild(platform)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let center = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if touchLocation.y < center.y {
                let newLocation = CGPoint(x: touchLocation.x, y: myPlatform.position.y)
                let move = SKAction.move(to: newLocation, duration: 0.1)
                myPlatform.run(move)
            } else {
                let newLocation = CGPoint(x: touchLocation.x, y: enemyPlatform.position.y)
                let move = SKAction.move(to: newLocation, duration: 0.1)
                enemyPlatform.run(move)
            }
        }
    }
    
}
