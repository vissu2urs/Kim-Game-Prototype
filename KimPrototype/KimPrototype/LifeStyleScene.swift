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
    
    
    
    override func didMove(to view: SKView) {
        
        
        backgroundSprite = self.childNode(withName: "HomeBackgroundNode") as? SKSpriteNode
        HomeBuyButton = backgroundSprite!.childNode(withName: "HomeBuyButtonNode") as? SKSpriteNode
        HomeButtonNode = backgroundSprite!.childNode(withName: "HomeNode") as? SKSpriteNode
        WallFrame = backgroundSprite!.childNode(withName: "WallFrameNode") as? SKSpriteNode
        
        AquariumButtonNode = backgroundSprite!.childNode(withName: "BuyAquariumButtonNode") as? SKSpriteNode
        AqariumFrame = backgroundSprite!.childNode(withName: "AqariumImageNode") as? SKSpriteNode
        
        
        vickiSprite = backgroundSprite?.childNode(withName: "Vicki") as? SKSpriteNode
        
        BuyComputerButton = backgroundSprite!.childNode(withName: "BuyComputerButtonNode") as? SKSpriteNode
        ComputerNode = backgroundSprite!.childNode(withName: "ComputerNode") as? SKSpriteNode
        
        AqariumFrame?.isHidden = true
        WallFrame?.isHidden = true
        ComputerNode?.isHidden = true
        
        
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
        AquariumBubbleButton1!.position = CGPoint(x:(self.AquariumButtonNode!.frame.minX)-85, y:(self.AquariumButtonNode!.frame.minY)-55);
        AquariumBubbleButton1!.size = CGSize(width: 230, height: 70)
        AquariumBubbleButton1!.zPosition = 5
        self.backgroundSprite!.addChild(AquariumBubbleButton1!);
        AquariumBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.AquariumButtonNode?.removeFromParent()
            self.BuyOptionClicked(alphaObject: self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
        })
        
        
        
        AquariumLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        AquariumLabel1!.text = "buy"
        AquariumLabel1!.fontSize = 15
        
        AquariumLabel1!.fontColor = UIColor.black
        AquariumLabel1!.position = CGPoint(x:(self.AquariumBubbleButton1!.frame.midX)-10, y:(self.AquariumBubbleButton1!.frame.midY)-3)
        AquariumLabel1!.zPosition = 10
        backgroundSprite!.addChild(AquariumLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        AquariumBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        AquariumBubbleButton2!.position = CGPoint(x:(self.AquariumButtonNode!.frame.minX)-85, y:(self.AquariumButtonNode!.frame.minY)-110);
        AquariumBubbleButton2!.size = CGSize(width: 230, height: 70)
        AquariumBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(AquariumBubbleButton2!);
        AquariumBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(alphaObject: self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
            self.check = true
            
            
        })
        
        AquariumLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        AquariumLabel2!.text = "Cancel"
        AquariumLabel2!.fontSize = 15
        AquariumLabel2!.fontColor = UIColor.black
        AquariumLabel2!.position = CGPoint(x:(self.AquariumBubbleButton2!.frame.midX)-20, y:(self.AquariumBubbleButton2!.frame.midY)-3)
        AquariumLabel2!.zPosition = 10
        backgroundSprite!.addChild(AquariumLabel2!)
        
        self.bubbleButton2?.isHidden = true
        self.AquariumLabel1?.isHidden = true
        self.bubbleButton1?.isHidden = true
        self.AquariumLabel2?.isHidden = true
        
        
        AquariumBubbleButton1?.isHidden = true
        AquariumBubbleButton2?.isHidden = true
        
        
    }
    
    
    
    
    func  setupPCBuy()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        pcBubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        pcBubbleButton1!.position = CGPoint(x:(self.BuyComputerButton!.frame.minX)-85, y:(self.BuyComputerButton!.frame.minY)-55);
        pcBubbleButton1!.size = CGSize(width: 230, height: 70)
        pcBubbleButton1!.zPosition = 5
        self.backgroundSprite!.addChild(pcBubbleButton1!);
        pcBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.BuyComputerButton?.removeFromParent()
            self.BuyOptionClicked(alphaObject: self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
        })
        
        
        
        pcLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        pcLabel1!.text = "buy"
        pcLabel1!.fontSize = 15
        
        pcLabel1!.fontColor = UIColor.black
        pcLabel1!.position = CGPoint(x:(self.pcBubbleButton1!.frame.midX)-10, y:(self.pcBubbleButton1!.frame.midY)-3)
        pcLabel1!.zPosition = 10
        backgroundSprite!.addChild(pcLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        pcBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        pcBubbleButton2!.position = CGPoint(x:(self.BuyComputerButton!.frame.minX)-85, y:(self.BuyComputerButton!.frame.minY)-110);
        pcBubbleButton2!.size = CGSize(width: 230, height: 70)
        pcBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(pcBubbleButton2!);
        pcBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(alphaObject: self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
            self.check = true
            
            
        })
        
        pcLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        pcLabel2!.text = "Cancel"
        pcLabel2!.fontSize = 15
        pcLabel2!.fontColor = UIColor.black
        pcLabel2!.position = CGPoint(x:(self.pcBubbleButton2!.frame.midX)-20, y:(self.pcBubbleButton2!.frame.midY)-3)
        pcLabel2!.zPosition = 10
        backgroundSprite!.addChild(pcLabel2!)
        self.pcBubbleButton1?.isHidden = true
        self.pcLabel2?.isHidden = true
        self.pcBubbleButton2?.isHidden = true
        self.pcLabel1?.isHidden = true
        
        
        
    }
    
    
    
    
    
    
    
    func setupForWallFrameBuy ()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        WallBubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        WallBubbleButton1!.position = CGPoint(x:(self.HomeBuyButton!.frame.minX)-85, y:(self.HomeBuyButton!.frame.minY)-55);
        WallBubbleButton1!.size = CGSize(width: 230, height: 70)
        WallBubbleButton1!.zPosition = 2
        self.backgroundSprite!.addChild(WallBubbleButton1!);
        WallBubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.HomeBuyButton?.removeFromParent()
            self.BuyOptionClicked(alphaObject: self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
            
            
        })
        
        
        
        myLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel1!.text = "buy"
        myLabel1!.fontSize = 15
        
        myLabel1!.fontColor = UIColor.black
        myLabel1!.position = CGPoint(x:(self.WallBubbleButton1!.frame.midX)-10, y:(self.WallBubbleButton1!.frame.midY)-3)
        myLabel1!.zPosition = 10
        backgroundSprite!.addChild(myLabel1!)
        
        
        
        let BubbleButtonTexture2 = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture2 = SKTexture(imageNamed: "OrangeBubble");
        WallBubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture2, selectedTexture:BubbleButtonPressedTexture2, disabledTexture:BubbleButtonTexture2);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        WallBubbleButton2!.position = CGPoint(x:(self.HomeBuyButton!.frame.minX)-85, y:(self.HomeBuyButton!.frame.minY)-110);
        WallBubbleButton2!.size = CGSize(width: 230, height: 70)
        WallBubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(WallBubbleButton2!);
        WallBubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CancelAnimationForBuy(alphaObject: self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
            self.check = true
            
            
        })
        
        myLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel2!.text = "Cancel"
        myLabel2!.fontSize = 15
        myLabel2!.fontColor = UIColor.black
        myLabel2!.position = CGPoint(x:(self.WallBubbleButton2!.frame.midX)-20, y:(self.WallBubbleButton2!.frame.midY)-3)
        myLabel2!.zPosition = 10
        backgroundSprite!.addChild(myLabel2!)
        self.bubbleButton2?.isHidden = true
        self.myLabel2?.isHidden = true
        self.bubbleButton1?.isHidden = true
        self.myLabel1?.isHidden = true
        
        
        WallBubbleButton1?.isHidden = true
        WallBubbleButton2?.isHidden = true
        
    }
    
    func setupForOwnerBubble()
    {
        
        CatBubble = backgroundSprite?.childNode(withName: "CatBubbleNode") as? SKSpriteNode
        
        let bubbleButton4 = SKTexture(imageNamed: "GreenBubble")
        self.bubbleButton4 = SKSpriteNode(texture:bubbleButton4);
        self.bubbleButton4?.size = CGSize(width: 230, height: 70)
        
        self.bubbleButton4!.position = CGPoint(x:(self.CatBubble!.frame.minX)-85, y:(self.CatBubble!.frame.minY)-55);
        self.bubbleButton4!.zPosition = 5
        myLabel4 = SKLabelNode(fontNamed: "Arial")
        myLabel4!.text = "Here's your money."
        myLabel4!.fontSize = 15
        
        myLabel4!.fontColor = UIColor.black
        myLabel4!.position = CGPoint(x:(self.bubbleButton4!.frame.midX)-35, y:(self.bubbleButton4!.frame.midY)-3)
        myLabel4!.zPosition = 10
        backgroundSprite!.addChild(myLabel4!)
        backgroundSprite!.addChild(self.bubbleButton4!)
        
        let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        
        //let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        self.bubbleButton5 = SKSpriteNode(texture:bubbleButton2);
        //self.bubbleButton2 = SKSpriteNode(color: SKColor.blueColor(), size: CGSizeMake(180, 85))
        self.bubbleButton5!.zPosition = 2
        self.bubbleButton5?.size = CGSize(width: 230, height: 70)
        self.bubbleButton5!.position = CGPoint(x:(self.CatBubble!.frame.midX)-85, y:(self.CatBubble!.frame.midY)-110);
        self.bubbleButton5!.zPosition = 5
        backgroundSprite!.addChild(self.bubbleButton5!)
        
        myLabel5 = SKLabelNode(fontNamed: "Arial")
        myLabel5!.text = "I don't have it ..."
        myLabel5!.fontSize = 15
        myLabel5!.fontColor = UIColor.black
        myLabel5!.position = CGPoint(x:(self.bubbleButton5!.frame.minX)-40, y:(self.bubbleButton5!.frame.minY)-3)
        myLabel5!.zPosition = 10
        backgroundSprite!.addChild(myLabel5!)
        self.bubbleButton4?.isHidden = true
        self.myLabel4?.isHidden = true
        self.bubbleButton5?.isHidden = true
        self.myLabel5?.isHidden = true
        
        
        myLabel3 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel3!.text = "Do you have the $750 for rent yet? "
        myLabel3!.fontSize = 14
        myLabel3!.fontColor = UIColor.black
        myLabel3!.position = CGPoint(x:(self.CatBubble!.frame.minX), y:(self.CatBubble!.frame.minY))
        myLabel3!.zPosition = 11
        let cgrect = CGRect(x:self.CatBubble!.frame.origin.x-180,y: self.CatBubble!.frame.origin.y ,width: 250,height: 130)
        self.adjustLabelFontSizeToFitRect(labelNode: myLabel3!,rect: cgrect)
        self.backgroundSprite!.addChild(myLabel3!)
        // self.messageButton?.hidden = true
        self.myLabel3?.isHidden = true
        
        
    }
    
    func adjustLabelFontSizeToFitRect(labelNode:SKLabelNode, rect:CGRect) {
        let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
        labelNode.fontSize *= scalingFactor
        labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.location(in: backgroundSprite!)
            
            if HomeButtonNode!.contains(location)
            {
                let transition = SKTransition.reveal(with: .right, duration: 0.8)
                
                if #available(iOS 9.0, *) {
                    if let scene = GameScene.unarchiveFromFile(file: "GameScene") as? GameScene {
                        // Configure the view.
                        let skView = self.view! as SKView
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        scene.scaleMode = .aspectFill
                        scene.isLockToSoChick = false
                        skView.presentScene(scene,transition: transition)
                        
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
            
            
            
            
            if HomeBuyButton!.contains(location)  {
                
                if check
                {
                    let moveAction   = SKAction.moveTo(x: (((HomeBuyButton?.frame.origin.x)!+375)),duration: 0.8)
                    let runAction = SKAction.run {
                        self.SetupAnimationForBuy(alphaObject: self.WallFrame!,bubbleButton1: self.WallBubbleButton1!,bubbleButton2: self.WallBubbleButton2!,bubbleLabel1: self.myLabel1!,bubbleLabel2: self.myLabel2!  )
                    }
                    self.backgroundSprite! .run(SKAction.sequence([moveAction,runAction]))
                }
                
            }
            
            if AquariumButtonNode!.contains(location)  {
                
                if isAquariumCheck{
                    let moveAction   = SKAction.moveTo(x: (((AquariumButtonNode?.frame.origin.x)!-375)),duration: 0.8)
                    let runAction = SKAction.run {
                        self.SetupAnimationForBuy(alphaObject: self.AqariumFrame!,bubbleButton1: self.AquariumBubbleButton1!,bubbleButton2: self.AquariumBubbleButton2!,bubbleLabel1: self.AquariumLabel1!,bubbleLabel2: self.AquariumLabel2!  )
                        
                    }
                    self.backgroundSprite! .run(SKAction.sequence([moveAction,runAction]))
                }
                
            }
            
            
            if BuyComputerButton!.contains(location)  {
                if isPCCheck{
                    let moveAction   = SKAction.moveTo(x: ((-(BuyComputerButton?.frame.origin.x)!+225)),duration: 0.8)
                    let runAction = SKAction.run {
                        self.SetupAnimationForBuy(alphaObject: self.ComputerNode!,bubbleButton1: self.pcBubbleButton1!,bubbleButton2: self.pcBubbleButton2!,bubbleLabel1: self.pcLabel1!,bubbleLabel2: self.pcLabel2!  )
                    }
                    self.backgroundSprite! .run(SKAction.sequence([moveAction,runAction]))
                }
            }
            
            
            if isButtonEnabled1{
                if bubbleButton4!.contains(location){
                    self.PayOwnersMoney()
                }
                
                if bubbleButton5!.contains(location){
                    self.IDontPayToOwner()
                }
                
            }
            
            if CatBubble!.contains(location)  {
                
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
        let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
        
        self.backgroundSprite!.run(SKAction.sequence([zoomInAction1]))
        
        
        
    }
    
    func IDontPayToOwner()
    {
        
        
        checkForOwner = false
        self.myLabel3?.isHidden = true
        isButtonEnabled1 = false
        let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
        let runAction = SKAction.run {
            
            
        }
        self.CatBubble!.run(SKAction.scaleX(to: 0.095,y:0.212, duration: 0.8))
        
        
        let waitZoomAction = SKAction.wait(forDuration: 1)
        self.backgroundSprite! .run(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
        checkForOwner = true
        
        self.bubbleButton4?.isHidden = true
        self.myLabel4?.isHidden = true
        self.bubbleButton5?.isHidden = true
        self.myLabel5?.isHidden = true
        self.CatBubble!.run(SKAction.moveTo(x: 586.734,duration: 0.8))
        
        
        
    }
    
    
    
    func SetupOwnerBubbleAnimation()
    {
        print("tapped!")
        
        self.CatBubble!.run(SKAction.moveTo(x: (CatBubble?.frame.origin.x)!-40,duration: 0.8))
        self.CatBubble!.run(SKAction.scaleX(to: 0.4, y : 0.4 ,duration: 0.8))
        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
        let waitAction = SKAction.wait(forDuration: 1.0)
        let run = SKAction.run {
            self.bubbleButton4?.isHidden = false
            self.myLabel4?.isHidden = false
            
        }
        
        let zoomInAction = SKAction.run {
            self.backgroundSprite!.run(SKAction.scale(to: 1.1, duration: 0.8))
        }
        let alertBox = SKAction.run {
            
            self.myLabel3?.isHidden = false
            
            //self.bubbleButton!.runAction(SKAction.moveToX((self.bubbleButton?.frame.origin.x)!-50,duration: 0))
            
            // self.messageButton?.hidden = false
            
        }
        
        let waitZoomAction = SKAction.wait(forDuration: 0.8)
        let waitSecondAction = SKAction.wait(forDuration: 0.3)
        let runSecond = SKAction.run {
            
            self.bubbleButton5?.isHidden = false
            self.myLabel5?.isHidden = false
            
            self.isButtonEnabled1 = true
            
        }
        
        self.run(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
        checkForOwner = false
        
        
    }
    
    
    
    
    
    func BuyOptionClicked( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  )
    {
        alphaObject.alpha = 1.0
        bubbleButton1.isHidden = true
        bubbleLabel1.isHidden = true
        bubbleButton2.isHidden = true
        bubbleLabel2.isHidden = true
        let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
        
        self.backgroundSprite!.run(SKAction.sequence([zoomInAction1]))
        
        
        
    }
    
    
    
    
    func SetupAnimationForBuy( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  ){
        
        
        alphaObject.isHidden = false
        alphaObject.alpha = 0.5
        
        
        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
        let run = SKAction.run {
            bubbleButton1.isHidden = false
            bubbleLabel1.isHidden = false
        }
        
        let zoomInAction = SKAction.run {
            self.backgroundSprite!.run(SKAction.scale(to: 1.1, duration: 0.8))
        }
        let waitSecondAction = SKAction.wait(forDuration: 0.3)
        let runSecond = SKAction.run {
            
            bubbleButton2.isHidden = false
            bubbleLabel2.isHidden = false
        }
        
        self.run(SKAction.sequence([zoomInAction,run,waitSecondAction,runSecond]))
        check = false
        
    }
    
    
    
    
    func CancelAnimationForBuy( alphaObject:SKSpriteNode ,bubbleButton1:SKSpriteNode,bubbleButton2: SKSpriteNode,bubbleLabel1:SKLabelNode,bubbleLabel2:SKLabelNode  )
    {
        
        let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
        let runAction = SKAction.run {
            
            
        }
        let waitZoomAction = SKAction.wait(forDuration: 1)
        self.backgroundSprite!.run(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
        bubbleButton1.isHidden = true
        bubbleLabel1.isHidden = true
        bubbleButton2.isHidden = true
        bubbleLabel2.isHidden = true
        alphaObject.isHidden = true
        
        
    }
    
    
    func vickiAnimation () {
        
        let vickiTextureAtlas = SKTextureAtlas(named: "Vicki")
        let vickiTextureNames = vickiTextureAtlas.textureNames as Array
        let sortedVickiTextureNames = vickiTextureNames.sorted { (  s1,  s2) -> Bool in
           // s1 = s1.stringByReplacingOccurrencesOfString(".png", withString: "")
           // s2 = s2.stringByReplacingOccurrencesOfString(".png", withString: "")
            return s1 < s2
        }
        
        var vickiTexturesArray = [SKTexture]()
        
        for eachTextureName in sortedVickiTextureNames {
            print("\(eachTextureName)")
            let vickiTexture = vickiTextureAtlas.textureNamed(eachTextureName)
            vickiTexturesArray.append(vickiTexture)
        }
        
        let vickiHandAction = SKAction.animate(with: vickiTexturesArray, timePerFrame: 0.25, resize: false, restore: true)
        
        vickiSprite?.run(SKAction.repeatForever(vickiHandAction))
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameSceneController.sharedInstance.handleTouchMove(touches: touches, sprite: backgroundSprite, scene: self)
    }
}
