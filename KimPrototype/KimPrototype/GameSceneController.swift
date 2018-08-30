//
//  GameSceneController.swift
//  KimPrototype
//
//  Created by Arpit Williams on 29/12/15.
//  Copyright © 2015 Diet Code. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameSceneController: UIViewController {
    
    static let sharedInstance = GameSceneController()
    
    func handleTouchMove (touches: Set<UITouch>, sprite: SKSpriteNode?, scene: SKScene) {
        
        
        print(scene.name)
        for touch in touches {
            let touchLocation = touch.location(in: scene)
            let prevLocation = touch.previousLocation(in: scene)
            let dX = touchLocation.x - prevLocation.x
            
            print(dX)
            print((sprite?.position.x))
            // Todo - Try to change if statement logic
            if ( dX < 0) {
                // Left Direction GameScene LifeStyleScene
                
                if scene.name == "GameScene"
                {
                if ((sprite?.position.x)! + (dX)) >= -(sprite?.size.width)!/4   {
                    sprite?.position = CGPoint(x: (sprite?.position.x)! + dX , y: (sprite?.position.y)!)
                }
                }
                 else if scene.name == "LifeStyleScene"
                {
                    if ((sprite?.position.x)! + (dX)) >= -50 {
                        sprite?.position = CGPoint(x: (sprite?.position.x)! + dX , y: (sprite?.position.y)!)
                    }
                }
                else if scene.name == "Magazine"
                {
                    if ((sprite?.position.x)! + (dX)) >= 55   {
                        sprite?.position = CGPoint(x: (sprite?.position.x)! + dX , y: (sprite?.position.y)!)
                    }
                  
                }
                else
                {
                    
                    if ((sprite?.position.x)! + (dX)) >= 90{
                        sprite?.position = CGPoint( x: (sprite?.position.x)! + dX , y: (sprite?.position.y)!)
                    }
                    
                }
            } else {
                //Right Direction
                if ((sprite?.position.x)! + (dX)) <= (sprite?.size.width)!/2 {
                    sprite?.position = CGPoint(x: (sprite?.position.x)! + dX , y: (sprite?.position.y)!)
                }
            }
        }
    }
    
}


//if scene.name == "GameScene"
//{
//    if ((sprite?.position.x)! + (dX)) >= -(sprite?.size.width)!/4   {
//        sprite?.position = CGPointMake((sprite?.position.x)! + dX , (sprite?.position.y)!)
//    }
//}
//else if scene.name == "LifeStyleScene"
//{
//    if ((sprite?.position.x)! + (dX)) >= -(sprite?.size.width)!/50   {
//        sprite?.position = CGPointMake((sprite?.position.x)! + dX , (sprite?.position.y)!)
//    }
//}
//else if scene.name == "Magazine"
//{
//    if ((sprite?.position.x)! + (dX)) >= -(sprite?.size.width)!/400   {
//        sprite?.position = CGPointMake((sprite?.position.x)! + dX , (sprite?.position.y)!)
//    }
//    
//}
//else
//{
//    
//    if ((sprite?.position.x)! + (dX)) >= -(sprite?.size.width)!/800   {
//        sprite?.position = CGPointMake((sprite?.position.x)! + dX , (sprite?.position.y)!)
//    }
//    
//}
