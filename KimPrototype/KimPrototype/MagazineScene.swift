//
//  MagazineScene.swift
//  KimPrototype
//
//  Created by niiu on 29/12/15.
//  Copyright © 2015 Diet Code. All rights reserved.
//

import SpriteKit


class MagazineScene: SKScene
{
    
    var CircleWorkButton: SKSpriteNode?
    var CircleWorkButton2: SKSpriteNode?
    var CircleWorkButton3: SKSpriteNode?
    var CircleWorkButton4: SKSpriteNode?
    var CircleWorkButton5: SKSpriteNode?
    var isCheck :Bool = true
    var workLabel :SKLabelNode?
    var backgroundSprite: SKSpriteNode?
    
    var isEnabled :Bool = true
    var isButtonEnabled :Bool = false
    var check :Bool = true
    //
    
    var bubbleButton1: SKSpriteNode?
    var bubbleLabel1 :SKLabelNode?
    var bubbleButton2: SKSpriteNode?
    var bubbleLabel2 :SKLabelNode?
    var bubbleNode: SKSpriteNode?
    
    var bubbleLabel :SKLabelNode?
    var checkVariable:Int = 0
    
    var HomeButton:SKSpriteNode?
    
    var vickiSprite:SKSpriteNode?
    
    var workBubble1 :FTButtonNode?
    var workBubble2 :FTButtonNode?
    var workBubble3 :FTButtonNode?
    var workBubble4:FTButtonNode?
    var listOfNames:NSArray?
    var countWorksDone : Int = 0
    
    var checkForSocheck = false
    
    
    
    override func didMoveToView(view: SKView) {
        
        
        listOfNames = ["fold shirts", "new outfits", "check sales","hips forward"]
        backgroundSprite = self.childNodeWithName("PopClamBackgroundNode") as? SKSpriteNode
        CircleWorkButton = backgroundSprite!.childNodeWithName("CircleWorkButtonNode") as? SKSpriteNode
        CircleWorkButton2 = backgroundSprite!.childNodeWithName("CircleWorkButtonNode2") as? SKSpriteNode
        CircleWorkButton3 = backgroundSprite!.childNodeWithName("CircleWorkButtonNode3") as? SKSpriteNode
        CircleWorkButton4 = backgroundSprite!.childNodeWithName("CircleWorkButtonNode4") as? SKSpriteNode
        CircleWorkButton5 = backgroundSprite!.childNodeWithName("CircleWorkButtonNode5") as? SKSpriteNode
        bubbleNode = backgroundSprite!.childNodeWithName("BubbleImageNode") as? SKSpriteNode
        HomeButton = backgroundSprite!.childNodeWithName("HomeButtonNode") as? SKSpriteNode
        vickiSprite = backgroundSprite?.childNodeWithName("Vicki") as? SKSpriteNode
        //HomeButtonNode
        
        CircleWorkButton?.hidden = true
        CircleWorkButton2?.hidden = true
        CircleWorkButton3?.hidden = true
        CircleWorkButton4?.hidden = true
        CircleWorkButton5?.hidden = true
        
        
        
        
        workLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        workLabel!.text = "balance"
        workLabel!.fontSize = 20
        workLabel!.fontColor = UIColor.blackColor()
        //workLabel!.position = CGPoint(x:CGRectGetMidX(CircleWorkButton!.frame)+165, y:CGRectGetMidY(CircleWorkButton!.frame)+15)
        workLabel!.zPosition = 11
        backgroundSprite!.addChild(workLabel!)
        self.workLabel?.hidden = true
        
        let bubbleButton = SKTexture(imageNamed: "Bubble")
        self.bubbleButton1 = SKSpriteNode(texture:bubbleButton);
        self.bubbleButton1?.size = CGSize(width: 230, height: 70)
        self.bubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.bubbleNode!.frame)-85, y:CGRectGetMinY(self.bubbleNode!.frame)-55);
        self.bubbleButton1!.zPosition = 5
        
        
        bubbleLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel1!.text = "1 hour"
        bubbleLabel1!.fontSize = 15
        bubbleLabel1!.fontColor = UIColor.blackColor()
        bubbleLabel1!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton1!.frame)-10, y:CGRectGetMidY(self.bubbleButton1!.frame)-3)
        bubbleLabel1!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel1!)
        backgroundSprite!.addChild(self.bubbleButton1!)
        
        
        
        // self.bubbleButton2 = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 10, height: 50))
        let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        self.bubbleButton2 = SKSpriteNode(texture:bubbleButton2);
        //self.bubbleButton2 = SKSpriteNode(color: SKColor.blueColor(), size: CGSizeMake(180, 85))
        self.bubbleButton2!.zPosition = 2
        self.bubbleButton2?.size = CGSize(width: 230, height: 70)
        self.bubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.bubbleNode!.frame)-85, y:CGRectGetMinY(self.bubbleNode!.frame)-110);
        self.bubbleButton2!.zPosition = 5
        backgroundSprite!.addChild(self.bubbleButton2!)
        
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
        
        
        bubbleLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel!.text = "How many hours do you want to work ?"
        bubbleLabel!.fontSize = 15
        bubbleLabel!.fontColor = UIColor.blackColor()
        bubbleLabel!.position = CGPoint(x:CGRectGetMaxX(self.bubbleNode!.frame)-147, y:CGRectGetMidY(self.bubbleNode!.frame))
        bubbleLabel!.zPosition = 11
        
        self.backgroundSprite!.addChild(bubbleLabel!)
        self.bubbleLabel?.hidden = true
        
        
        /* Setup your scene here */
        
        vickiAnimation()
        
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "WorkButton");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "WorkButton");
        workBubble1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble2 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble3 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble4 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workButtonSetup(-10,ypoint: -100,workBubble:workBubble1! )
        workButtonSetup(-130,ypoint: +140,workBubble:workBubble2! )
        workButtonSetup(+420,ypoint: +150,workBubble:workBubble3! )
        workButtonSetup(-643,ypoint: -100,workBubble:workBubble4! )
        
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
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(backgroundSprite!)
            if HomeButton!.containsPoint(location)
            {
                let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
                
                if #available(iOS 9.0, *) {
                    if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
                        // Configure the view.
                        let skView = self.view! as SKView
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        scene.scaleMode = .AspectFill
                        if self.checkForSocheck
                        {
                            scene.isLockToSoChick = false
                        }
                        else
                        {
                            scene.isLockToSoChick = true
                        }
                        skView.presentScene(scene,transition: transition)
                        
                    }
                }
            }
            
            
            
            
            if isButtonEnabled
            {
                
                if bubbleButton1!.containsPoint(location)
                {
                    
                    self.bubbleNode?.removeFromParent()
                    self.bubbleButton1?.removeFromParent()
                    self.bubbleLabel1?.removeFromParent()
                    self.bubbleButton2?.removeFromParent()
                    self.bubbleLabel2?.removeFromParent()
                    self.bubbleLabel?.removeFromParent()
                    
                    
                    self.workBubble1?.hidden = false
                    self.workBubble4?.hidden = false
                    
                }
                
                if bubbleButton2!.containsPoint(location)
                {
                    
                    self.bubbleNode?.removeFromParent()
                    self.bubbleButton1?.removeFromParent()
                    self.bubbleLabel1?.removeFromParent()
                    self.bubbleButton2?.removeFromParent()
                    self.bubbleLabel2?.removeFromParent()
                    self.bubbleLabel?.removeFromParent()
                    
                    
                    self.workBubble1?.hidden = false
                    self.workBubble4?.hidden = false
                }
                
            }
            
            if bubbleNode!.containsPoint(location)  {
                
                
                if check
                {
                    print("tapped!")
                    
                    self.bubbleNode!.runAction(SKAction.moveToX((bubbleNode?.frame.origin.x)!-40,duration: 0.8))
                    self.bubbleNode!.runAction(SKAction.scaleXTo(0.3, y : 0.35 ,duration: 0.8))
                    let waitAction = SKAction.waitForDuration(1.0)
                    let run = SKAction.runBlock {
                        self.bubbleButton1?.hidden = false
                        self.bubbleLabel1?.hidden = false
                    }
                    
                    let zoomInAction = SKAction.runBlock {
                        self.backgroundSprite!.runAction(SKAction.scaleTo(1.1, duration: 0.8))
                    }
                    let alertBox = SKAction.runBlock {
                        self.bubbleNode?.hidden = false
                        self.bubbleLabel?.hidden = false
                    }
                    
                    let waitZoomAction = SKAction.waitForDuration(0.8)
                    let waitSecondAction = SKAction.waitForDuration(0.3)
                    let runSecond = SKAction.runBlock {
                        self.bubbleButton2?.hidden = false
                        self.bubbleLabel2?.hidden = false
                        self.isButtonEnabled = true
                        
                    }
                    
                    self.runAction(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                    check = false
                    
                }
                else{
                    self.bubbleLabel?.hidden = true
                    isButtonEnabled = false
                    let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
                    let runAction = SKAction.runBlock {
                        
                    }
                    self.bubbleNode!.runAction(SKAction.scaleXTo(0.095,y:0.212, duration: 0.8))
                    let waitZoomAction = SKAction.waitForDuration(1)
                    self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
                    check = true
                    self.bubbleButton1?.hidden = true
                    self.bubbleLabel1?.hidden = true
                    self.bubbleButton2?.hidden = true
                    self.bubbleLabel2?.hidden = true
                    self.bubbleNode!.runAction(SKAction.moveToX(139.777,duration: 0.8))
                }
                
            }
        }
    }
    
    
    
    
    func setupForTwoHalfDone(WorkButton:SKSpriteNode){
        let WorkTexture1 = SKTexture(imageNamed: "1.png")
        let WorkTexture2 = SKTexture(imageNamed: "2.png")
        let WorkTexture3 = SKTexture(imageNamed: "3.png")
        let WorkTexture4 = SKTexture(imageNamed: "WorkHalfDone")
        let anim =  SKAction.animateWithTextures([WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.runAction(anim)
        isCheck = true
        ++checkVariable
    }
    
    
    func ButtonClickMethod(PresentButton:SKSpriteNode){
        PresentButton.alpha = 0.5
        let waitAction = SKAction.waitForDuration(0.05)
        let run = SKAction.runBlock {
            PresentButton.alpha = 1.0
        }
        PresentButton.runAction(SKAction .sequence([waitAction,run]))
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
            //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
            
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
                if self.countWorksDone<=3{
                    self.checkForSocheck = true
                }
            }
            WorkButton.runAction(SKAction.sequence([waitDuration,runLabelAction]))
            checkVariable = 0
            isCheck = true
        }
        
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