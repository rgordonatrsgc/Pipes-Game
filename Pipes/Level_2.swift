//
//  Level_2.swift
//  Pipes
//
//  Created by Adam Sheeres-Paulicpulle on 2017-04-20.
//  Copyright © 2017 Farquad Labs. All rights reserved.
//

import SpriteKit
import GameplayKit

class level2: SKScene  {
    
    // Properties
    let logic = GameLogic()
    
    func map( x: Int, y: Int) -> (Int, Int) {
        var x = x
        var y = y
        
        //Map the grid value to a 1-7 value becuase the grid is 7x7.
        //Take away bounradies of the grid.
        x = x - 125
        y = y - 75
        
        //Divide by the width and height of the grid quare.
        x = x/50
        x -= 1
        y = y/50
        
        return(x, y)
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        //Create variable that allows all the boxes to have an assigned number.
        var boxCount : Int = 0
        
        //Make array of X and Y values for the circles being used.
        let circlePositionArray = [250, 150, 350, 200, 300, 250, 550, 450, 250, 350, 250, 450, 250, 400, 450, 250]
        
        //Background
        let background = SKSpriteNode(imageNamed: "Background3")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = self.frame.size
        background.zPosition = 0
        addChild(background)
        
        //Title
        let titleText = SKLabelNode(fontNamed: "Helvetica")
        titleText.text = "Level 1"
        titleText.fontSize = 25
        titleText.fontColor = SKColor.black
        titleText.zPosition = 1
        titleText.position = CGPoint(x: 400, y: 550)
        addChild(titleText)
        
        //Make the grid start at the top left and end at the bottom right.
        for j in stride(from: 425, through: 125, by: -50) {
            for i in stride(from: 225, through: 525, by: 50) {
                let boxGrid = SKShapeNode(rect: CGRect(x: i, y: j, width: 50, height: 50))
                boxGrid.zPosition = 1
                boxGrid.fillColor = SKColor.clear
                boxGrid.name = "boxGRid-\(boxCount)"
                addChild(boxGrid)
                
                boxCount += 1
            }
        }
        //Add the different circles to be connected by lines.
        //Red circle 1
        let circleR1 = SKShapeNode(circleOfRadius: 22)
        circleR1.position = CGPoint(x: circlePositionArray[0], y: circlePositionArray[1])
        circleR1.zPosition = 2
        circleR1.strokeColor = SKColor.clear
        circleR1.fillColor = SKColor.red
        circleR1.name = "circle-1"
        addChild(circleR1)
        
        //Red Circle 2
        let circleR2 = SKShapeNode(circleOfRadius: 22)
        circleR2.position = CGPoint(x: circlePositionArray[2], y: circlePositionArray[3])
        circleR2.zPosition = 2
        circleR2.strokeColor = SKColor.clear
        circleR2.fillColor = SKColor.red
        circleR2.name = "circle-2"
        addChild(circleR2)
        
        //Blue Circle 1
        let circleB1 = SKShapeNode(circleOfRadius: 22)
        circleB1.position = CGPoint(x: circlePositionArray[4], y: circlePositionArray[5])
        circleB1.zPosition = 2
        circleB1.strokeColor = SKColor.clear
        circleB1.fillColor = SKColor.blue
        circleB1.name = "circle-3"
        addChild(circleB1)
        
        //Blue Circle 2
        let circleB2 = SKShapeNode(circleOfRadius: 22)
        circleB2.position = CGPoint(x: circlePositionArray[6], y: circlePositionArray[7])
        circleB2.zPosition = 2
        circleB2.strokeColor = SKColor.clear
        circleB2.fillColor = SKColor.blue
        circleB2.name = "circle-4"
        addChild(circleB2)
        
        //Yellow Circle 1
        let circleY1 = SKShapeNode(circleOfRadius: 22)
        circleY1.position = CGPoint(x: circlePositionArray[8], y: circlePositionArray[9])
        circleY1.zPosition = 2
        circleY1.strokeColor = SKColor.clear
        circleY1.fillColor = SKColor.yellow
        circleY1.name = "circle-5"
        addChild(circleY1)
        
        //Yellow Circle 2
        let circleY2 = SKShapeNode(circleOfRadius: 22)
        circleY2.position = CGPoint(x: circlePositionArray[10], y: circlePositionArray[11])
        circleY2.zPosition = 2
        circleY2.strokeColor = SKColor.clear
        circleY2.fillColor = SKColor.yellow
        circleY2.name = "circle-6"
        addChild(circleY2)
        
        //Purple Circle 1
        let circleP1 = SKShapeNode(circleOfRadius: 22)
        circleP1.position = CGPoint(x: circlePositionArray[12], y: circlePositionArray[13])
        circleP1.zPosition = 2
        circleP1.strokeColor = SKColor.clear
        circleP1.fillColor = SKColor.purple
        circleP1.name = "circle-7"
        addChild(circleP1)
        
        //Purple Circle 2
        let circleP2 = SKShapeNode(circleOfRadius: 22)
        circleP2.position = CGPoint(x: circlePositionArray[14], y: circlePositionArray[15])
        circleP2.zPosition = 2
        circleP2.strokeColor = SKColor.clear
        circleP2.fillColor = SKColor.purple
        circleP2.name = "circle-8"
        addChild(circleP2)
        
    }
    override func mouseDown(with event: NSEvent) {
        
        let mappedVal = logic.map(x: Int(event.locationInWindow.x), y: Int(event.locationInWindow.y))
        
        //Print the now mappe values of the grid.
        print("The mapped values are: ", "\(mappedVal)")
        print("The real values are: ", "\(event.locationInWindow.x)", "&", "\(event.locationInWindow.y)")
        
        for node in self.children {
            if let nodeName = node.name {
                if nodeName.contains("circle") {
                    if node.contains(event.locationInWindow) {
                        
                        print(String(describing: node.name))
                    }
                }
            }
        }
    }
}
