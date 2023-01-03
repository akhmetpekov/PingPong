//
//  GameView.swift
//  SwiftUILearning
//
//  Created by Erik on 03.01.2023.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //Defining Scene
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        scene.backgroundColor = .black
        return scene
    }
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(width: screenWidth, height: screenHeight)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
