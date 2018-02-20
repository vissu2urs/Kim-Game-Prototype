//
//  SoChicScene.swift
//  KimPrototypes
//
//  Created by niiu on 07/01/16.
//  Copyright © 2016 Diet Code. All rights reserved.
//
import SpriteKit


class SoChicScene: SKScene
{
    
    var backgroundSprite: SKSpriteNode?
    var bubbleButton1: FTButtonNode?
    var bubbleLabel1 :SKLabelNode?
    var bubbleButton2: FTButtonNode?
    var bubbleLabel2 :SKLabelNode?
    var workLabel :SKLabelNode?
    var messageLabel :SKLabelNode?
    var messageBox : SKSpriteNode?
    var isEnabled :Bool = true
    
    var check :Bool = true
    var workBubble1 :FTButtonNode?
    var workBubble2 :FTButtonNode?
    var workBubble3 :FTButtonNode?
    var workBubble4:FTButtonNode?
    
    
    var isCheck :Bool = true
    //var check :Bool = true
    var checkVariable:Int = 0
    var listOfNames:NSArray?
    var countWorksDone : Int = 0
    var vickiSprite:SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        
        //MessageBoxNode
        listOfNames = ["fold shirts", "new outfits", "check sales","hang shirts"]
        backgroundSprite = self.childNodeWithName("SoChicBackground") as? SKSpriteNode
        let homeButtonTexture = SKTexture(imageNamed: "RedHome");
        let homeButtonPressedTexture = SKTexture(imageNamed: "RedHome");
        let  HomeButton = FTButtonNode(normalTexture:homeButtonTexture, selectedTexture:homeButtonPressedTexture, disabledTexture:homeButtonTexture);
        HomeButton.position = CGPointMake(-635.609 , -25.0);
        HomeButton.size = CGSize(width: 90, height: 80)
        HomeButton.zPosition = 5
        self.backgroundSprite!.addChild(HomeButton);
        HomeButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            print("button touched")
            let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
            if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
                // Configure the view.
                let skView = self.view! as SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .AspectFill
                scene.isLockToSoChick = false
                
                skView.presentScene(scene,transition: transition)
            }
            
        })
        
        messageBox = backgroundSprite?.childNodeWithName("MessageBoxNode") as? SKSpriteNode
        
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "WorkButton");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "WorkButton");
        workBubble1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble2 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble3 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble4 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        
        
        vickiSprite = backgroundSprite?.childNodeWithName("Vicki") as? SKSpriteNode
        
        BubbleSetup()
        workButtonSetup(-10,ypoint: -100,workBubble:workBubble1! )
        workButtonSetup(-156,ypoint: -100,workBubble:workBubble2! )
        workButtonSetup(+650,ypoint: -50,workBubble:workBubble3! )
        workButtonSetup(-720,ypoint: +50,workBubble:workBubble4! )
        
        workLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        workLabel!.text = "rearrange"
        workLabel!.fontSize = 20
        workLabel!.fontColor = UIColor.blackColor()
        workLabel!.position = CGPoint(x:CGRectGetMidX(workBubble1!.frame)+165, y:CGRectGetMidY(workBubble1!.frame)+15)
        workLabel!.zPosition = 11
        backgroundSprite!.addChild(workLabel!)
        self.workLabel?.hidden = true
        
        vickiAnimation()
        
    }
    
    
    
    
    func workButtonSetup(xpoint:CGFloat,ypoint:CGFloat, workBubble : FTButtonNode)
    {
        
        workBubble.position = CGPoint(x: xpoint,y: ypoint);
        workBubble.size = CGSize(width: 60, height: 70)
        workBubble.zPosition = 5
        workBubble.isSelectedImageEnabled = false
        self.backgroundSprite!.addChild(workBubble);
        workBubble.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            if self.isCheck
            {    self.SetupForTwoWorkDone(workBubble)
                
            } else{
                self.setupForTwoHalfDone(workBubble)
            }
        })
        workBubble.hidden = true
    }
    
    
    
    func BubbleSetup()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        bubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.messageBox!.frame)-85, y:CGRectGetMinY(self.messageBox!.frame)-55);
        bubbleButton1!.size = CGSize(width: 230, height: 70)
        bubbleButton1!.zPosition = 2
        self.backgroundSprite!.addChild(bubbleButton1!);
        bubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.bubbleButton1?.removeFromParent()
            self.bubbleLabel1?.removeFromParent()
            self.bubbleButton2?.removeFromParent()
            self.bubbleLabel2?.removeFromParent()
            self.messageLabel?.removeFromParent()
            self.messageBox?.removeFromParent()
            
            self.workBubble1?.hidden = false
            self.workBubble4?.hidden = false
         })
        
        
        
        
        
        bubbleLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel1!.text = "1 hour"
        bubbleLabel1!.fontSize = 15
        bubbleLabel1!.fontColor = UIColor.blackColor()
        bubbleLabel1!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton1!.frame)-10, y:CGRectGetMidY(self.bubbleButton1!.frame)-3)
        bubbleLabel1!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel1!)
        
        
        
        
        let BubbleButtonTexture = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture = SKTexture(imageNamed: "OrangeBubble");
        bubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture, selectedTexture:BubbleButtonPressedTexture, disabledTexture:BubbleButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.messageBox!.frame)-85, y:CGRectGetMinY(self.messageBox!.frame)-110);
        bubbleButton2!.size = CGSize(width: 230, height: 70)
        bubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(bubbleButton2!);
        bubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.bubbleButton1?.removeFromParent()
            self.bubbleLabel1?.removeFromParent()
            self.bubbleButton2?.removeFromParent()
            self.bubbleLabel2?.removeFromParent()
            self.messageLabel?.removeFromParent()
            self.messageBox?.removeFromParent()
            self.workBubble1?.hidden = false
            self.workBubble4?.hidden = false
            
        })
        
        
        
        bubbleLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel2!.text = "4 hours"
        bubbleLabel2!.fontSize = 15
        bubbleLabel2!.fontColor = UIColor.blackColor()
        bubbleLabel2!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton2!.frame)-20, y:CGRectGetMidY(self.bubbleButton2!.frame)-3)
        bubbleLabel2!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel2!)
        self.bubbleButton2?.hidden = true
        self.bubbleLabel2?.hidden = true
        self.bubbleButton1?.hidden = true
        self.bubbleLabel1?.hidden = true
        
        
        messageLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        messageLabel!.text = "How many hours do you want to work ?"
        messageLabel!.fontSize = 15
        messageLabel!.fontColor = UIColor.blackColor()
        messageLabel!.position = CGPoint(x:CGRectGetMaxX(self.messageBox!.frame)-147, y:CGRectGetMidY(self.messageBox!.frame))
        messageLabel!.zPosition = 11
        
        self.backgroundSprite!.addChild(messageLabel!)
        self.messageLabel?.hidden = true
        
        
        
    }
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(backgroundSprite!)
            
            
            if messageBox!.containsPoint(location)  {
                
                
                if check
                {
                    print("tapped!")
                    
                    self.messageBox!.runAction(SKAction.moveToX((messageBox?.frame.origin.x)!-40,duration: 0.8))
                    self.messageBox!.runAction(SKAction.scaleXTo(0.3, y : 0.35 ,duration: 0.8))
                    //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
                    let waitAction = SKAction.waitForDuration(1.0)
                    let run = SKAction.runBlock {
                        self.bubbleButton1?.hidden = false
                        self.bubbleLabel1?.hidden = false
                        
                    }
                    
                    let zoomInAction = SKAction.runBlock {
                        self.backgroundSprite!.runAction(SKAction.scaleTo(1.1, duration: 0.8))
                    }
                    let alertBox = SKAction.runBlock {
                        self.messageBox?.hidden = false
                        self.messageLabel?.hidden = false
                        
                    }
                    
                    let waitZoomAction = SKAction.waitForDuration(0.8)
                    let waitSecondAction = SKAction.waitForDuration(0.3)
                    let runSecond = SKAction.runBlock {
                        
                        self.bubbleButton2?.hidden = false
                        self.bubbleLabel2?.hidden = false
                    }
                    
                    self.runAction(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                    check = false
                    
                }
                else
                    
                {
                    self.messageLabel?.hidden = true
                    
                    let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
                    let runAction = SKAction.runBlock {
                        //self.bubbleButton?.hidden = false
                    }
                    self.messageBox!.runAction(SKAction.scaleXTo(0.095,y:0.212, duration: 0.8))
                    
                    
                    let waitZoomAction = SKAction.waitForDuration(1)
                    self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
                    check = true
                    self.bubbleButton1?.hidden = true
                    self.bubbleLabel1?.hidden = true
                    self.bubbleButton2?.hidden = true
                    self.bubbleLabel2?.hidden = true
                    self.messageBox!.runAction(SKAction.moveToX(139.777,duration: 0.8))
                    
                    
                }
                
            }
            
            
        }
    }
    
    
    
    func SetupForTwoWorkDone( WorkButton:FTButtonNode )
    {
        isEnabled = false
        
        if checkVariable == 0{
            workLabel!.position = CGPoint(x:CGRectGetMidX(WorkButton.frame)+90, y:CGRectGetMidY(WorkButton.frame)+10)
        }
        
        
        let WorkTexture1 = SKTexture(imageNamed: "5.png")
        let WorkTexture2 = SKTexture(imageNamed: "6.png")
        let WorkTexture3 = SKTexture(imageNamed: "7.png")
        let WorkTexture4 = SKTexture(imageNamed: "WorkDoneButton")
        let anim =  SKAction.animateWithTextures([WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.runAction(anim)
        let runSecond = SKAction.runBlock {
            
            WorkButton.runAction(SKAction.scaleXTo(3.8, y: 1.2, duration: 0.5))
        }
        
        let runFirst = SKAction.moveToX((WorkButton.frame.origin.x)+114, duration: 0.5)
        let waitDuration = SKAction.waitForDuration(0.6)
        let runLabelAction = SKAction.runBlock {
            self.workLabel?.hidden = true
            WorkButton.label.hidden = true
            WorkButton.setButtonLabel((self.workLabel?.text)!, font: "AvenirNext-Bold", fontSize: 20, color: UIColor.blackColor())
            WorkButton.setScaleForLabel()
            WorkButton.label.hidden = false
            self.isEnabled = true
        }
        ++checkVariable
        WorkButton.runAction(SKAction.group([runSecond,runFirst]))
        self.runAction(SKAction.sequence([waitDuration,runLabelAction]))
        isCheck = false
        if checkVariable >= 3
        {
            let waitDuration = SKAction.waitForDuration(0.6)
            let runLabelAction = SKAction.runBlock {
                self.workBubble3?.hidden = false
                self.workBubble2?.hidden = false
                self.workLabel?.hidden = true
                WorkButton.removeFromParent()
                self.workLabel!.text = self.listOfNames?.objectAtIndex(self.countWorksDone) as? String
                self.countWorksDone++
                
            }
            WorkButton.runAction(SKAction.sequence([waitDuration,runLabelAction]))
            checkVariable = 0
            isCheck = true
        }
        
    }
    
    
    func setupForTwoHalfDone(WorkButton:FTButtonNode)
    {
        let WorkTexture1 = SKTexture(imageNamed: "1.png")
        let WorkTexture2 = SKTexture(imageNamed: "2.png")
        let WorkTexture3 = SKTexture(imageNamed: "3.png")
        let WorkTexture4 = SKTexture(imageNamed: "WorkHalfDone")
        let anim =  SKAction.animateWithTextures([WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.runAction(anim)
        isCheck = true
        ++checkVariable
    }
    func adjustLabelFontSizeToFitRect(labelNode:SKLabelNode, rect:CGRect) {
        
        // Determine the font scaling factor that should let the label text fit in the given rectangle.
        let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
        // Change the fontSize.
        labelNode.fontSize *= scalingFactor
        // Optionally move the SKLabelNode to the center of the rectangle.
        labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
    }
    
    
    
    func vickiAnimation () {
        
        let vickiTextureAtlas = SKTextureAtlas(named: "Vicki")
        let vickiTextureNames = vickiTextureAtlas.textureNames as Array
        let sortedVickiTextureNames = vickiTextureNames.sort { (var s1, var s2) -> Bool in
            s1 = s1.stringByReplacingOccurrencesOfString(".png", withString: "")
            s2 = s2.stringByReplacingOccurrencesOfString(".png", withString: "")
            return Int(s1) < Int(s2)
        }
        
        var vickiTexturesArray = [SKTexture]()
        for eachTextureName in sortedVickiTextureNames {
            print("\(eachTextureName)")
            let vickiTexture = vickiTextureAtlas.textureNamed(eachTextureName)
            vickiTexturesArray.append(vickiTexture)
        }
        
        let vickiHandAction = SKAction.animateWithTextures(vickiTexturesArray, timePerFrame: 0.25, resize: false, restore: true)
        vickiSprite?.runAction(SKAction.repeatActionForever(vickiHandAction))
        
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        GameSceneController.sharedInstance.handleTouchMove(touches, sprite: backgroundSprite, scene: self)
    }
}
        