//
//  LifeStyleScene.swift
//  KimPrototype
//
//  Created by niiu on 29/12/15.
//  Copyright © 2015 Diet Code. All rights reserved.
//

import SpriteKit


class LifeStyleScene: SKScene
{
    
    var backgroundSprite: SKSpriteNode?
    var HomeBuyButton: SKSpriteNode?
    
    var bubbleButton1: SKSpriteNode?
    var myLabel1 :SKLabelNode?
    var bubbleButton2: SKSpriteNode?
    var myLabel2 :SKLabelNode?
    
    var check :Bool = true
    
    
    var isButtonEnabled1 :Bool = false
    var HomeButtonNode: SKSpriteNode?
    
    var CatBubble: SKSpriteNode?
    var myLabel3 :SKLabelNode?
    
    var bubbleButton4: SKSpriteNode?
    var myLabel4 :SKLabelNode?
    var bubbleButton5: SKSpriteNode?
    var myLabel5 :SKLabelNode?
    
    
    var WallFrame: SKSpriteNode?
    var checkForOwner :Bool = true
    
    var AquariumButtonNode: SKSpriteNode?
    var isAquariumCheck :Bool = true
    
    var AqariumFrame: SKSpriteNode?
    var BuyComputerButton: SKSpriteNode?
    var ComputerNode: SKSpriteNode?
    var isPCCheck :Bool = true
    var vickiSprite:SKSpriteNode?
    
    
    
    
    
    var WallBubbleButton1:FTButtonNode?
    var WallBubbleButton2:FTButtonNode?
    
    
    var AquariumBubbleButton1:FTButtonNode?
    var AquariumBubbleButton2:FTButtonNode?
    var AquariumLabel1 :SKLabelNode?
    var AquariumLabel2 :SKLabelNode?
    
    
    
    var pcBubbleButton1:FTButtonNode?
    var pcBubbleButton2:FTButtonNode?
    var pcLabel1 :SKLabelNode?
    var pcLabel2 :SKLabelNode?
    
    
    
    override func didMoveToView(view: SKView) {
        
        
        backgroundSprite = self.childNodeWithName("HomeBackgroundNode") as? SKSpriteNode
        HomeBuyButton = backgroundSprite!.childNodeWithName("HomeBuyButtonNode") as? SKSpriteNode
        HomeButtonNode = backgroundSprite!.childNodeWithName("HomeNode") as? SKSpriteNode
        WallFrame = backgroundSprite!.childNodeWithName("WallFrameNode") as? SKSpriteNode
        
        AquariumButtonNode = backgroundSprite!.childNodeWithName("BuyAquariumButtonNode") as? SKSpriteNode
        AqariumFrame = backgroundSprite!.childNodeWithName("AqariumImageNode") as? SKSpriteNode
        
        
        vickiSprite = backgroundSprite?.childNodeWithName("Vicki") as? SKSpriteNode
        
        BuyComputerButton = backgroundSprite!.childNodeWithName("BuyComputerButtonNode") as? SKSpriteNode
        ComputerNode = backgroundSprite!.childNodeWithName("ComputerNode") as? SKSpriteNode
        
        AqariumFrame?.hidden = true
        WallFrame?.hidden = true
        ComputerNode?.hidden = true
        
        
        self.setupForWallFrameBuy()
        self.setupForOwnerBubble()
        setupAquariumBuy()
        vickiAnimation()
        setupPCBuy()
        
        
    }
    
    
    
    
    
    func  setupAquariumBuy()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        AquariumBubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        AquariumBubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.AquariumButtonNode!.frame)-85, y:CGRectGetMinY(self.AquariumButtonNode!.frame)-55);
        AquariumBubbleButton1!.size = CGSize(width: 230, height: 70)
        AquariumBubbleButton1!.zPosition = 5
        self.backgroundSprite!.addChild(AquariumBubbleButton1!);
        AquariumBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.AquariumButtonNode?.removeFromParent()
            self.BuyOptionClicked(self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
        })
        
        
        
        AquariumLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        AquariumLabel1!.text = "buy"
        AquariumLabel1!.fontSize = 15
        
        AquariumLabel1!.fontColor = UIColor.blackColor()
        AquariumLabel1!.position = CGPoint(x:CGRectGetMidX(self.AquariumBubbleButton1!.frame)-10, y:CGRectGetMidY(self.AquariumBubbleButton1!.frame)-3)
        AquariumLabel1!.zPosition = 10
        backgroundSprite!.addChild(AquariumLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        AquariumBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        AquariumBubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.AquariumButtonNode!.frame)-85, y:CGRectGetMinY(self.AquariumButtonNode!.frame)-110);
        AquariumBubbleButton2!.size = CGSize(width: 230, height: 70)
        AquariumBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(AquariumBubbleButton2!);
        AquariumBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
            self.check = true
            
            
        })
        
        AquariumLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        AquariumLabel2!.text = "Cancel"
        AquariumLabel2!.fontSize = 15
        AquariumLabel2!.fontColor = UIColor.blackColor()
        AquariumLabel2!.position = CGPoint(x:CGRectGetMidX(self.AquariumBubbleButton2!.frame)-20, y:CGRectGetMidY(self.AquariumBubbleButton2!.frame)-3)
        AquariumLabel2!.zPosition = 10
        backgroundSprite!.addChild(AquariumLabel2!)
        
        self.bubbleButton2?.hidden = true
        self.AquariumLabel1?.hidden = true
        self.bubbleButton1?.hidden = true
        self.AquariumLabel2?.hidden = true
        
        
        AquariumBubbleButton1?.hidden = true
        AquariumBubbleButton2?.hidden = true
        
        
    }
    
    
    
    
    func  setupPCBuy()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        pcBubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        pcBubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.BuyComputerButton!.frame)-85, y:CGRectGetMinY(self.BuyComputerButton!.frame)-55);
        pcBubbleButton1!.size = CGSize(width: 230, height: 70)
        pcBubbleButton1!.zPosition = 5
        self.backgroundSprite!.addChild(pcBubbleButton1!);
        pcBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.BuyComputerButton?.removeFromParent()
            self.BuyOptionClicked(self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
        })
        
        
        
        pcLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        pcLabel1!.text = "buy"
        pcLabel1!.fontSize = 15
        
        pcLabel1!.fontColor = UIColor.blackColor()
        pcLabel1!.position = CGPoint(x:CGRectGetMidX(self.pcBubbleButton1!.frame)-10, y:CGRectGetMidY(self.pcBubbleButton1!.frame)-3)
        pcLabel1!.zPosition = 10
        backgroundSprite!.addChild(pcLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        pcBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        pcBubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.BuyComputerButton!.frame)-85, y:CGRectGetMinY(self.BuyComputerButton!.frame)-110);
        pcBubbleButton2!.size = CGSize(width: 230, height: 70)
        pcBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(pcBubbleButton2!);
        pcBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
            self.check = true
            
            
        })
        
        pcLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        pcLabel2!.text = "Cancel"
        pcLabel2!.fontSize = 15
        pcLabel2!.fontColor = UIColor.blackColor()
        pcLabel2!.position = CGPoint(x:CGRectGetMidX(self.pcBubbleButton2!.frame)-20, y:CGRectGetMidY(self.pcBubbleButton2!.frame)-3)
        pcLabel2!.zPosition = 10
        backgroundSprite!.addChild(pcLabel2!)
        self.pcBubbleButton1?.hidden = true
        self.pcLabel2?.hidden = true
        self.pcBubbleButton2?.hidden = true
        self.pcLabel1?.hidden = true
        
        
        
    }
    
    
    
    
    
    
    
    func setupForWallFrameBuy ()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        WallBubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        WallBubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.HomeBuyButton!.frame)-85, y:CGRectGetMinY(self.HomeBuyButton!.frame)-55);
        WallBubbleButton1!.size = CGSize(width: 230, height: 70)
        WallBubbleButton1!.zPosition = 2
        self.backgroundSprite!.addChild(WallBubbleButton1!);
        WallBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.HomeBuyButton?.removeFromParent()
            self.BuyOptionClicked(self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
            
            
        })
        
        
        
        myLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel1!.text = "buy"
        myLabel1!.fontSize = 15
        
        myLabel1!.fontColor = UIColor.blackColor()
        myLabel1!.position = CGPoint(x:CGRectGetMidX(self.WallBubbleButton1!.frame)-10, y:CGRectGetMidY(self.WallBubbleButton1!.frame)-3)
        myLabel1!.zPosition = 10
        backgroundSprite!.addChild(myLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        WallBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        WallBubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.HomeBuyButton!.frame)-85, y:CGRectGetMinY(self.HomeBuyButton!.frame)-110);
        WallBubbleButton2!.size = CGSize(width: 230, height: 70)
        WallBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(WallBubbleButton2!);
        WallBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
            self.check = true
            
            
        })
        
        myLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel2!.text = "Cancel"
        myLabel2!.fontSize = 15
        myLabel2!.fontColor = UIColor.blackColor()
        myLabel2!.position = CGPoint(x:CGRectGetMidX(self.WallBubbleButton2!.frame)-20, y:CGRectGetMidY(self.WallBubbleButton2!.frame)-3)
        myLabel2!.zPosition = 10
        backgroundSprite!.addChild(myLabel2!)
        self.bubbleButton2?.hidden = true
        self.myLabel2?.hidden = true
        self.bubbleButton1?.hidden = true
        self.myLabel1?.hidden = true
        
        
        WallBubbleButton1?.hidden = true
        WallBubbleButton2?.hidden = true
        
    }
    
    func setupForOwnerBubble()
    {
        
        CatBubble = backgroundSprite?.childNodeWithName("CatBubbleNode") as? SKSpriteNode
        
        let bubbleButton4 = SKTexture(imageNamed: "GreenBubble")
        self.bubbleButton4 = SKSpriteNode(texture:bubbleButton4);
        self.bubbleButton4?.size = CGSize(width: 230, height: 70)
        
        self.bubbleButton4!.position = CGPoint(x:CGRectGetMinX(self.CatBubble!.frame)-85, y:CGRectGetMinY(self.CatBubble!.frame)-55);
        self.bubbleButton4!.zPosition = 5
        myLabel4 = SKLabelNode(fontNamed: "Arial")
        myLabel4!.text = "Here's your money."
        myLabel4!.fontSize = 15
        
        myLabel4!.fontColor = UIColor.blackColor()
        myLabel4!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton4!.frame)-35, y:CGRectGetMidY(self.bubbleButton4!.frame)-3)
        myLabel4!.zPosition = 10
        backgroundSprite!.addChild(myLabel4!)
        backgroundSprite!.addChild(self.bubbleButton4!)
        
        let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        
        //let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        self.bubbleButton5 = SKSpriteNode(texture:bubbleButton2);
        //self.bubbleButton2 = SKSpriteNode(color: SKColor.blueColor(), size: CGSizeMake(180, 85))
        self.bubbleButton5!.zPosition = 2
        self.bubbleButton5?.size = CGSize(width: 230, height: 70)
        self.bubbleButton5!.position = CGPoint(x:CGRectGetMinX(self.CatBubble!.frame)-85, y:CGRectGetMinY(self.CatBubble!.frame)-110);
        self.bubbleButton5!.zPosition = 5
        backgroundSprite!.addChild(self.bubbleButton5!)
        
        myLabel5 = SKLabelNode(fontNamed: "Arial")
        myLabel5!.text = "I don't have it ..."
        myLabel5!.fontSize = 15
        myLabel5!.fontColor = UIColor.blackColor()
        myLabel5!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton5!.frame)-40, y:CGRectGetMidY(self.bubbleButton5!.frame)-3)
        myLabel5!.zPosition = 10
        backgroundSprite!.addChild(myLabel5!)
        self.bubbleButton4?.hidden = true
        self.myLabel4?.hidden = true
        self.bubbleButton5?.hidden = true
        self.myLabel5?.hidden = true
        
        
        myLabel3 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel3!.text = "Do you have the $750 for rent yet? "
        myLabel3!.fontSize = 14
        myLabel3!.fontColor = UIColor.blackColor()
        myLabel3!.position = CGPoint(x:CGRectGetMinX(self.CatBubble!.frame), y:CGRectGetMinY(self.CatBubble!.frame))
        myLabel3!.zPosition = 11
        let cgrect = CGRectMake(self.CatBubble!.frame.origin.x-180,self.CatBubble!.frame.origin.y , 250, 130)
        self.adjustLabelFontSizeToFitRect(myLabel3!,rect: cgrect)
        self.backgroundSprite!.addChild(myLabel3!)
        // self.messageButton?.hidden = true
        self.myLabel3?.hidden = true
        
        
    }
    
    func adjustLabelFontSizeToFitRect(labelNode:SKLabelNode, rect:CGRect) {
        let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
        labelNode.fontSize *= scalingFactor
        labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
    }
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(backgroundSprite!)
            
            if HomeButtonNode!.containsPoint(location)
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
                        scene.isLockToSoChick = false
                        skView.presentScene(scene,transition: transition)
                        
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
            
            
            
            
            if HomeBuyButton!.containsPoint(location)  {
                
                if check
                {
                    let moveAction   = SKAction.moveToX((((HomeBuyButton?.frame.origin.x)!+375)),duration: 0.8)
                    let runAction = SKAction.runBlock {
                        self.SetupAnimationForBuy(self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
                    }
                    self.backgroundSprite! .runAction(SKAction.sequence([moveAction,runAction]))
                }
                
            }
            
            if AquariumButtonNode!.containsPoint(location)  {
                
                if isAquariumCheck{
                    let moveAction   = SKAction.moveToX((((AquariumButtonNode?.frame.origin.x)!-375)),duration: 0.8)
                    let runAction = SKAction.runBlock {
                        self.SetupAnimationForBuy(self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
                        
                    }
                    self.backgroundSprite! .runAction(SKAction.sequence([moveAction,runAction]))
                }
                
            }
            
            
            if BuyComputerButton!.containsPoint(location)  {
                if isPCCheck{
                    let moveAction   = SKAction.moveToX(((-(BuyComputerButton?.frame.origin.x)!+225)),duration: 0.8)
                    let runAction = SKAction.runBlock {
                        self.SetupAnimationForBuy(self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
                    }
                    self.backgroundSprite! .runAction(SKAction.sequence([moveAction,runAction]))
                }
            }
            
            
            if isButtonEnabled1{
                if bubbleButton4!.containsPoint(location){
                    self.PayOwnersMoney()
                }
                
                if bubbleButton5!.containsPoint(location){
                    self.IDontPayToOwner()
                }
                
            }
            
            if CatBubble!.containsPoint(location)  {
                
                if checkForOwner{
                    self.SetupOwnerBubbleAnimation()
                }
            }
            
        }
        
    }
    
    
    func PayOwnersMoney()
    {
        
        
        self.CatBubble?.removeFromParent()
        self.bubbleButton4?.removeFromParent()
        self.myLabel4?.removeFromParent()
        self.bubbleButton5?.removeFromParent()
        self.myLabel5?.removeFromParent()
        self.myLabel3?.removeFromParent()
        let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
        
        self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1]))
        
        
        
    }
    
    func IDontPayToOwner()
    {
        
        
        checkForOwner = false
        self.myLabel3?.hidden = true
        isButtonEnabled1 = false
        let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
        let runAction = SKAction.runBlock {
            
            
        }
        self.CatBubble!.runAction(SKAction.scaleXTo(0.095,y:0.212, duration: 0.8))
        
        
        let waitZoomAction = SKAction.waitForDuration(1)
        self.backgroundSprite! .runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
        checkForOwner = true
        
        self.bubbleButton4?.hidden = true
        self.myLabel4?.hidden = true
        self.bubbleButton5?.hidden = true
        self.myLabel5?.hidden = true
        self.CatBubble!.runAction(SKAction.moveToX(586.734,duration: 0.8))
        
        
        
    }
    
    
    
    func SetupOwnerBubbleAnimation()
    {
        print("tapped!")
        
        self.CatBubble!.runAction(SKAction.moveToX((CatBubble?.frame.origin.x)!-40,duration: 0.8))
        self.CatBubble!.runAction(SKAction.scaleXTo(0.4, y : 0.4 ,duration: 0.8))
        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
        let waitAction = SKAction.waitForDuration(1.0)
        let run = SKAction.runBlock {
            self.bubbleButton4?.hidden = false
            self.myLabel4?.hidden = false
            
        }
        
        let zoomInAction = SKAction.runBlock {
            self.backgroundSprite!.runAction(SKAction.scaleTo(1.1, duration: 0.8))
        }
        let alertBox = SKAction.runBlock {
            
            self.myLabel3?.hidden = false
            
            //self.bubbleButton!.runAction(SKAction.moveToX((self.bubbleButton?.frame.origin.x)!-50,duration: 0))
            
            // self.messageButton?.hidden = false
            
        }
        
        let waitZoomAction = SKAction.waitForDuration(0.8)
        let waitSecondAction = SKAction.waitForDuration(0.3)
        let runSecond = SKAction.runBlock {
            
            self.bubbleButton5?.hidden = false
            self.myLabel5?.hidden = false
            
            self.isButtonEnabled1 = true
            
        }
        
        self.runAction(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
        checkForOwner = false
        
        
    }
    
    
    
    
    
    func BuyOptionClicked( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  )
    {
        alphaObject.alpha = 1.0
        bubbleButton1.hidden = true
        bubbleLabel1.hidden = true
        bubbleButton2.hidden = true
        bubbleLabel2.hidden = true
        let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
        
        self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1]))
        
        
        
    }
    
    
    
    
    func SetupAnimationForBuy( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  ){
        
        
        alphaObject.hidden = false
        alphaObject.alpha = 0.5
        
        
        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
        let run = SKAction.runBlock {
            bubbleButton1.hidden = false
            bubbleLabel1.hidden = false
        }
        
        let zoomInAction = SKAction.runBlock {
            self.backgroundSprite!.runAction(SKAction.scaleTo(1.1, duration: 0.8))
        }
        let waitSecondAction = SKAction.waitForDuration(0.3)
        let runSecond = SKAction.runBlock {
            
            bubbleButton2.hidden = false
            bubbleLabel2.hidden = false
        }
        
        self.runAction(SKAction.sequence([zoomInAction,run,waitSecondAction,runSecond]))
        check = false
        
    }
    
    
    
    
    func CancelAnimationForBuy( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  )
    {
        
        let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
        let runAction = SKAction.runBlock {
            
            
        }
        let waitZoomAction = SKAction.waitForDuration(1)
        self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
        bubbleButton1.hidden = true
        bubbleLabel1.hidden = true
        bubbleButton2.hidden = true
        bubbleLabel2.hidden = true
        alphaObject.hidden = true
        
        
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