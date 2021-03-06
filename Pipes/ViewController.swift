//
//  ViewController.swift
//  Pipes
//
//  Created by Adam Sheeres-Paulicpulle on 2017-02-28.
//  Copyright © 2017 Farquad Labs. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = TitlePage(size: CGSize(width: 800, height: 600))
        
        let skView = SKView(frame: NSRect(origin: CGPoint(x: 0, y:0), size: CGSize(width: 800, height: 600)))
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        view.addSubview(skView)
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
        
       
    }
}


