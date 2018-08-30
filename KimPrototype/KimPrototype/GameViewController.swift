//
//  GameViewController.swift
//  KimPrototype
//
//  Created by Arpit Williams on 16/12/15.
//  Copyright (c) 2015 Diet Code. All rights reserved.
//

import UIKit
import SpriteKit


extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = Bundle.main.path(forResource: file as String, ofType: "sks") {
            var sceneData: NSData?
            // Error occurs on the following line:
            do {
                sceneData = try  NSData(contentsOfFile: path, options: .mappedIfSafe)
            } catch _ as NSError {
                
            }
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData! as Data)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! SKNode
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 9.0, *) {
            if let scene = GameScene.unarchiveFromFile(file: "GameScene") as? GameScene {
                // Configure the view.
                let skView = self.view as! SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                skView.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        } else {
            // Fallback on earlier versions
        }
    }

     func shouldAutorotate() -> Bool {
        return true
    }

     func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == . phone {
        return .allButUpsideDown
        } else {
            return .all
        }
    }


     func prefersStatusBarHidden() -> Bool {
        return true
    }

    
}
