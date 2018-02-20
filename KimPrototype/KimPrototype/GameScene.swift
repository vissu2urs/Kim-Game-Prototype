//
//  GameScene.swift
//  KimPrototype
//
//  Created by Arpit Williams on 16/12/15.
//  Copyright (c) 2015 Diet Code. All rights reserved.
//

import SpriteKit


@available(iOS 9.0, *)
class GameScene: SKScene {
    
    var backgroundSprite: SKSpriteNode?
    
    var lowerTorsoNode: SKSpriteNode?
    var upperTorsoNode: SKSpriteNode?
    
    var rightUpperLegNode: SKSpriteNode?
    var leftUpperLegNode: SKSpriteNode?
    
    var rightLowerLegNode: SKSpriteNode?
    var leftLoweLegNode: SKSpriteNode?
    
    var rightFootNode: SKSpriteNode?
    var leftFootNode: SKSpriteNode?
    
    var leftHandUpperArmNode: SKSpriteNode?
    var leftHandLowerArmNode: SKSpriteNode?
    var leftHandNode: SKSpriteNode?
    var leftWristTipNode: SKNode?
    var leftHandTargetNode: SKNode?
    
    var rightHandUpperArmNode: SKSpriteNode?
    var rightHandLowerArmNode: SKSpriteNode?
    var rightHandNode: SKSpriteNode?
    var rightHandTargetNode: SKSpriteNode?
    
    var headNode: SKSpriteNode?
    
    var leftUpperArmOriginalAngle: CGFloat = 2.8888
    var leftLowerArmOriginalAngle: CGFloat = 6.0000
    var upperTorsoOriginalAngle: CGFloat = -4.731
    
    var rightUpperLegOriginalAngle: CGFloat = 3.195
    var leftUpperLegOriginalAngle: CGFloat = 2.669
    var leftHandOriginalAngle: CGFloat = -83.872
    
    var backgroundMoving: Bool = false
    var initialTouchLocation: CGPoint? = CGPointMake(0.0, 0.0)
    var backgroundScreenSpritePosition: CGPoint? = CGPointMake(0.0, 0.0)
    
    var vickiSprite: SKSpriteNode?
    
    
    var CatBubble: SKSpriteNode?
    
    
    var bubbleButton1: FTButtonNode?
    var myLabel1 :SKLabelNode?
    var bubbleButton2: FTButtonNode?
    var myLabel2 :SKLabelNode?
    var button1: SKSpriteNode?
    var messageButton: SKSpriteNode?
    var bubbleButton: SKSpriteNode?
    var isEnabled :Bool = true
    var myLabel3 :SKLabelNode?
    var cameraNode :SKNode?
    var check :Bool = true
    var isLockToSoChick = true
    var alertBoxNode :SKSpriteNode?
    var okButtonNode :SKSpriteNode?
    var BallNode: SKSpriteNode?
    var ProfileBallNode : SKSpriteNode?
    var ShoeMoneyNode : SKSpriteNode?
    var ShoeProfileNode : SKSpriteNode?
    var ShoeNode : SKSpriteNode?
    override func didMoveToView(view: SKView) {
        
        
        SnowPartical()
        
        backgroundSprite = self.childNodeWithName("Background") as? SKSpriteNode
        CatBubble = backgroundSprite?.childNodeWithName("CatBubbleNode") as? SKSpriteNode
        vickiSprite = backgroundSprite?.childNodeWithName("Vicki") as? SKSpriteNode
        
        
        lowerTorsoNode = backgroundSprite?.childNodeWithName("LowerTorso") as? SKSpriteNode
        upperTorsoNode = lowerTorsoNode?.childNodeWithName("UpperTorso") as? SKSpriteNode
        headNode = upperTorsoNode?.childNodeWithName("Head") as? SKSpriteNode
        rightUpperLegNode = lowerTorsoNode?.childNodeWithName("RightUpperLeg") as? SKSpriteNode
        leftUpperLegNode = lowerTorsoNode?.childNodeWithName("LeftUpperLeg") as? SKSpriteNode
        rightLowerLegNode = rightUpperLegNode?.childNodeWithName("RightLowerLeg") as? SKSpriteNode
        leftLoweLegNode = leftUpperLegNode?.childNodeWithName("LeftLowerLeg") as? SKSpriteNode
        rightFootNode = rightLowerLegNode?.childNodeWithName("RightFoot") as? SKSpriteNode
        leftFootNode = leftLoweLegNode?.childNodeWithName("LeftFoot") as? SKSpriteNode
        leftHandUpperArmNode = upperTorsoNode?.childNodeWithName("LeftUpperArm") as? SKSpriteNode
        leftHandLowerArmNode = leftHandUpperArmNode?.childNodeWithName("LeftLowerArm") as? SKSpriteNode
        leftHandNode = leftHandLowerArmNode?.childNodeWithName("LeftWrist") as? SKSpriteNode
        rightHandUpperArmNode = upperTorsoNode?.childNodeWithName("RightUpperArm") as? SKSpriteNode
        rightHandLowerArmNode = rightHandUpperArmNode?.childNodeWithName("RightLowerArm") as? SKSpriteNode
        rightHandNode = rightHandLowerArmNode?.childNodeWithName("RightWrist") as? SKSpriteNode
        
        initiateCharacterAnimations()
        vickiAnimation()
        BallNode = backgroundSprite?.childNodeWithName("BallNode")as? SKSpriteNode
        ProfileBallNode = backgroundSprite?.childNodeWithName("ProfileBallNode")as? SKSpriteNode
        ShoeProfileNode = backgroundSprite?.childNodeWithName("ShoeProfileNode")as? SKSpriteNode
        ShoeMoneyNode = backgroundSprite?.childNodeWithName("ShoeMoneyNode")as? SKSpriteNode
        ShoeNode = backgroundSprite?.childNodeWithName("ShoeNode")as? SKSpriteNode
        BallNode?.hidden = true
        ProfileBallNode?.hidden = true
        ShoeProfileNode?.hidden = true
        ShoeMoneyNode?.hidden = true
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(0,120, 1024, 768))
        // 2. Set the friction of that physicsBody to 0
        borderBody.friction = 0
        // 3. Set physicsBody of scene to borderBody
        self.physicsBody = borderBody//         BallNode?.physicsBody?.gravity
        
        
        alertBoxNode = backgroundSprite?.childNodeWithName("AlertNode") as? SKSpriteNode
        okButtonNode =  alertBoxNode?.childNodeWithName("OkNode") as? SKSpriteNode
        alertBoxNode?.hidden =  true
        ButtonsSetup()
        BubbleSetup()

        
    }
    
    func SnowPartical()
    {
        //snow partical
        let path = NSBundle.mainBundle().pathForResource("SnowParticle", ofType: "sks")
        let rainParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        rainParticle.position = CGPointMake(self.size.width/2, self.size.height)
        rainParticle.name = "rainParticle"
        rainParticle.targetNode = self.scene
        rainParticle.zPosition = 100
        
        self.addChild(rainParticle)
        
    }
    
    
    
    
    func addPhysicsToBody(BodyNode: SKSpriteNode , velocityx:CGFloat , velocityy:CGFloat)
    {
        
        BodyNode.physicsBody = SKPhysicsBody(circleOfRadius:(BallNode?.size.width)!*0.5)
        BodyNode.physicsBody!.mass = 100.0
        BodyNode.physicsBody!.restitution = 0.6
        BodyNode.physicsBody?.affectedByGravity = true
        BodyNode.physicsBody?.density =  2.0
        BodyNode.physicsBody!.velocity=CGVectorMake(velocityx, velocityy)
        BodyNode.physicsBody?.usesPreciseCollisionDetection = false
        
        let waitZoomAction = SKAction.waitForDuration(2.3)
        let runAction = SKAction.runBlock {
            BodyNode.physicsBody = nil
        }
        BodyNode.runAction(SKAction.sequence([waitZoomAction,runAction]))
        
    }
    
    
    func BubbleSetup()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        bubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton1!.position = CGPoint(x:CGRectGetMinX(self.CatBubble!.frame)-85, y:CGRectGetMinY(self.CatBubble!.frame)-55);
        bubbleButton1!.size = CGSize(width: 230, height: 70)
        bubbleButton1!.zPosition = 2
        self.backgroundSprite!.addChild(bubbleButton1!);
        bubbleButton1!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            self.CatBubble?.removeFromParent()
            self.bubbleButton1?.removeFromParent()
            self.myLabel1?.removeFromParent()
            self.bubbleButton2?.removeFromParent()
            self.myLabel2?.removeFromParent()
            self.myLabel3?.removeFromParent()
            
            let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
            
            self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1]))
        })
        
        
        myLabel1 = SKLabelNode(fontNamed: "Arial")
        myLabel1!.text = "(Adopt. )"
        myLabel1!.fontSize = 15
        myLabel1!.fontColor = UIColor.blackColor()
        myLabel1!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton1!.frame)-10, y:CGRectGetMidY(self.bubbleButton1!.frame)-3)
        myLabel1!.zPosition = 10
        backgroundSprite!.addChild(myLabel1!)
        
        let BubbleButtonTexture = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture = SKTexture(imageNamed: "OrangeBubble");
        bubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture, selectedTexture:BubbleButtonPressedTexture, disabledTexture:BubbleButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton2!.position = CGPoint(x:CGRectGetMinX(self.CatBubble!.frame)-85, y:CGRectGetMinY(self.CatBubble!.frame)-110);
        bubbleButton2!.size = CGSize(width: 230, height: 70)
        bubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(bubbleButton2!);
        bubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.check = false
            self.myLabel3?.hidden = true
            
            let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
            let runAction = SKAction.runBlock {
                self.bubbleButton?.hidden = false
                self.isEnabled = true
            }
            self.CatBubble!.runAction(SKAction.scaleXTo(0.095,y:0.212, duration: 0.8))
            
            
            let waitZoomAction = SKAction.waitForDuration(1)
            self.backgroundSprite! .runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
            self.check = true
            
            self.bubbleButton1?.hidden = true
            self.myLabel1?.hidden = true
            self.bubbleButton2?.hidden = true
            self.myLabel2?.hidden = true
            self.CatBubble!.runAction(SKAction.moveToX(-149.841,duration: 0.8))
            
        })
        
         myLabel2 = SKLabelNode(fontNamed: "Arial")
        myLabel2!.text = "(Lee it alone.)"
        myLabel2!.fontSize = 15
        myLabel2!.fontColor = UIColor.blackColor()
        myLabel2!.position = CGPoint(x:CGRectGetMidX(self.bubbleButton2!.frame)-20, y:CGRectGetMidY(self.bubbleButton2!.frame)-3)
        myLabel2!.zPosition = 10
        backgroundSprite!.addChild(myLabel2!)
        self.bubbleButton2?.hidden = true
        self.myLabel2?.hidden = true
        self.bubbleButton1?.hidden = true
        self.myLabel1?.hidden = true
        
        
        myLabel3 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel3!.text = "Meow …"
        myLabel3!.fontSize = 20
        myLabel3!.fontColor = UIColor.blackColor()
        myLabel3!.position = CGPoint(x:CGRectGetMaxX(self.CatBubble!.frame)-110, y:CGRectGetMidY(self.CatBubble!.frame))
        myLabel3!.zPosition = 11
        
        self.backgroundSprite!.addChild(myLabel3!)
        self.messageButton?.hidden = true
        self.myLabel3?.hidden = true
        
        
    }
    
    
    
    
    
    func ButtonsSetup()
    {
        
        let buttonTexture = SKTexture(imageNamed: "CircleButton");
        let buttonPressedTexture = SKTexture(imageNamed: "CircleButtonTouchUp");
        let  PopGlamButton = FTButtonNode(normalTexture:buttonTexture, selectedTexture:buttonPressedTexture, disabledTexture:buttonPressedTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        PopGlamButton.position = CGPointMake(-404.576 , -87.216);
        PopGlamButton.size = CGSize(width: 90, height: 80)
        PopGlamButton.zPosition = 2
        self.backgroundSprite!.addChild(PopGlamButton);
        
        PopGlamButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            print("button touched")
            let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
            if let scene = MagazineScene.unarchiveFromFile("MagazineScene") as? MagazineScene {
                // Configure the view.
                let skView = self.view! as SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .AspectFill
                skView.presentScene(scene,transition: transition)
            }
            
        })
        
        
        
        
        
        
        let LifeStyleButtonTexture = SKTexture(imageNamed: "HomeGreen");
        let LifeStyleButtonPressedTexture = SKTexture(imageNamed: "HomeGreenTouchUp");
        let  LifeStyleButton = FTButtonNode(normalTexture:LifeStyleButtonTexture, selectedTexture:LifeStyleButtonPressedTexture, disabledTexture:buttonPressedTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        LifeStyleButton.position = CGPointMake(+577.728 , -87.216);
        LifeStyleButton.size = CGSize(width: 90, height: 80)
        LifeStyleButton.zPosition = 2
        self.backgroundSprite!.addChild(LifeStyleButton);
        
        LifeStyleButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
             print("button touched")
            let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
            if let scene = LifeStyleScene.unarchiveFromFile("LifeStyleScene") as? LifeStyleScene {
                // Configure the view.
                let skView = self.view! as SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .AspectFill
                skView.presentScene(scene,transition: transition)
            }
            
        })
        
         let  soChicButton : FTButtonNode
        if self.isLockToSoChick{
            
            let soChicButtonTexture = SKTexture(imageNamed: "LockButton");
            let soChicButtonPressedTexture = SKTexture(imageNamed: "LockTouchUp");
            soChicButton   = FTButtonNode(normalTexture:soChicButtonTexture, selectedTexture:soChicButtonPressedTexture, disabledTexture:soChicButtonTexture);
        }
        else{
            let soChicButtonTexture = SKTexture(imageNamed: "BuildingButton");
            let soChicButtonPressedTexture = SKTexture(imageNamed: "BuildingButtonTouchUp");
            soChicButton   = FTButtonNode(normalTexture:soChicButtonTexture, selectedTexture:soChicButtonPressedTexture, disabledTexture:soChicButtonTexture);
        }
        soChicButton.position = CGPointMake(1800 , -87.216);
        soChicButton.size = CGSize(width: 90, height: 80)
        soChicButton.zPosition = 5
        self.backgroundSprite!.addChild(soChicButton);
        
        
        soChicButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            if self.isLockToSoChick
            {
                self.alertBoxNode?.hidden =  false
            }else
            {
                print("button touched")
                let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
                if let scene = SoChicScene.unarchiveFromFile("SoChicScene") as? SoChicScene {
                    // Configure the view.
                    let skView = self.view! as SKView
                    skView.showsFPS = true
                    skView.showsNodeCount = true
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .AspectFill
                    skView.presentScene(scene,transition: transition)
                }
            }
            
        })
        
        let guardButtonTexture = SKTexture(imageNamed: "Guard");
        let guardButtonPressedTexture = SKTexture(imageNamed: "GuardTouchUp");
        let  guardButton = FTButtonNode(normalTexture:guardButtonTexture, selectedTexture:guardButtonPressedTexture, disabledTexture:guardButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        guardButton.position = CGPointMake(267 , 59.756);
        guardButton.size = CGSize(width: 70, height: 260)
        guardButton.zPosition = 5
         self.backgroundSprite!.addChild(guardButton);
        guardButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            let zoomInAction1 = SKAction.scaleTo(1.1, duration: 0.3)
            let runAction = SKAction.scaleTo(1.0, duration: 0.3)
            let waitZoomAction = SKAction.waitForDuration(0.2)
            guardButton.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
            
            print("button touched")
            self.BallNode?.hidden = false
            self.ProfileBallNode?.hidden = false
            self.addPhysicsToBody(self.BallNode!,velocityx:100,velocityy: 100 )
            self.addPhysicsToBody(self.ProfileBallNode!,velocityx:200,velocityy: 200 )
            
        })
        
        let shoeButtonTexture = SKTexture(imageNamed: "ShoeIcon");
        let ShoeButtonPressedTexture = SKTexture(imageNamed: "ShoeIcon");
        
        let  shoeButton = FTButtonNode(normalTexture:shoeButtonTexture, selectedTexture:ShoeButtonPressedTexture, disabledTexture:shoeButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        shoeButton.position = CGPointMake(-730 , -135);
        shoeButton.size = CGSize(width: 110, height: 160)
        shoeButton.zPosition = 5
        
        self.backgroundSprite!.addChild(shoeButton);
        
        
        shoeButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
              let zoomInAction1 = SKAction.scaleTo(1.1, duration: 0.3)
            let runAction = SKAction.scaleTo(1.0, duration: 0.3)
            let waitZoomAction = SKAction.waitForDuration(0.2)
            shoeButton.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
            
            print("button touched")
            self.ShoeProfileNode?.hidden = false
            self.ShoeMoneyNode?.hidden = false
            self.addPhysicsToBody(self.ShoeProfileNode!,velocityx:100,velocityy: 100 )
            self.addPhysicsToBody(self.ShoeMoneyNode!,velocityx:200,velocityy: 200 )
            
        })
        
        
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
    
    func initiateCharacterAnimations() {
        let animationDelayZero = SKAction.waitForDuration(1.5)
        let animationDelay = SKAction.waitForDuration(3.0)
        
        let animateLeftUpperArm = SKAction.rotateToAngle(CGFloat(50.0).degreesToRadians(), duration: 0.5)
        let animateLeftLowerArm = SKAction.rotateToAngle(CGFloat(-80.0).degreesToRadians(), duration: 0.5)
        let upperTorsoAnimation = SKAction.rotateToAngle(CGFloat(2.0).degreesToRadians(), duration: 0.5)
        
        let collectiveHandAnimation = SKAction.runBlock({
            self.leftHandUpperArmNode?.runAction(animateLeftUpperArm)
            self.leftHandLowerArmNode?.runAction(animateLeftLowerArm)
            self.upperTorsoNode?.runAction(upperTorsoAnimation)
        })
        
        let initialAnimationSequence = SKAction.sequence([animationDelay, collectiveHandAnimation])
        
        let restoreLeftUpperArmAnimation = SKAction.rotateToAngle(CGFloat(leftUpperArmOriginalAngle).degreesToRadians(), duration: 0.5)
        let restoreLeftLowerArmAnimation = SKAction.rotateToAngle(CGFloat(leftLowerArmOriginalAngle).degreesToRadians(), duration: 0.5)
        let restoreTorsoAnimation = SKAction.rotateToAngle(CGFloat(upperTorsoOriginalAngle).degreesToRadians(), duration: 0.5)
        
        let restoreCollectiveHandAnimation = SKAction.runBlock({
            self.leftHandUpperArmNode?.runAction(restoreLeftUpperArmAnimation)
            self.leftHandLowerArmNode?.runAction(restoreLeftLowerArmAnimation)
            self.upperTorsoNode?.runAction(restoreTorsoAnimation)
        })
        
        let restoreAnimationSequence = SKAction.sequence([animationDelay, restoreCollectiveHandAnimation])
        
        //let animateRightUpperLeg = SKAction.rotateToAngle(CGFloat(0.0).degreesToRadians(), duration: 0.3)
        //let restoreRightUpperLeg = SKAction.rotateToAngle(CGFloat(rightUpperLegOriginalAngle).degreesToRadians(), duration: 0.3)
        //let legAnimation = SKAction.sequence([animationDelayZero, animateRightUpperLeg, restoreRightUpperLeg])
        //let rightLegAnimation = SKAction.repeatAction(legAnimation, count: 2)
        //_ = SKAction.runBlock({
        //    self.rightUpperLegNode?.runAction(legAnimation)
        //})
        
        //let animateLeftUpperLeg = SKAction.rotateToAngle(CGFloat(-5.506).degreesToRadians(), duration: 0.6)
        //let restoreLeftUpperLeg = SKAction.rotateToAngle(CGFloat(leftUpperLegOriginalAngle).degreesToRadians(), duration: 0.6)
        //let leftUpperLegAnimationSequence = SKAction.sequence([animationDelayZero, animateLeftUpperLeg, restoreLeftUpperLeg])
        //let collectiveLeftUpperLegAnimation = SKAction.runBlock({
        //    self.leftUpperLegNode?.runAction(leftUpperLegAnimationSequence)
        //})
        
        //head animation
        let changeHeadTextureAnimation = SKAction.setTexture(SKTexture(image: UIImage(named: "HeadEyesClosed")!))
        let restoreHeadTextureAnimation = SKAction.setTexture(SKTexture(image: UIImage(named: "Head")!))
        let blinkRepetation = SKAction.sequence([changeHeadTextureAnimation, SKAction.waitForDuration(0.1),restoreHeadTextureAnimation])
        let headAnimationSequence = SKAction.sequence([animationDelayZero, blinkRepetation])
        let finalHeadAnimation = SKAction.runBlock({
            self.headNode?.runAction(headAnimationSequence)
        })
        
        let animateLeftUpperArmTwo = SKAction.rotateToAngle(CGFloat(105.0).degreesToRadians(), duration: 0.5)
        let animateLeftWrist = SKAction.rotateToAngle(CGFloat(-76.0).degreesToRadians(), duration: 0.2)
        let restoreLeftWrist = SKAction.rotateToAngle(CGFloat(leftHandOriginalAngle).degreesToRadians(), duration: 0.2)
        let leftWristAnimationSequence = SKAction.sequence([animateLeftWrist, SKAction.waitForDuration(0.2), restoreLeftWrist, animateLeftWrist, SKAction.waitForDuration(0.2), restoreLeftWrist])
        let leftWristAnimationFinal = SKAction.runBlock({
            self.leftHandNode?.runAction(leftWristAnimationSequence)
        })
        let animateLeftHandSequence = SKAction.sequence([animationDelayZero, animateLeftUpperArmTwo, leftWristAnimationFinal, animationDelayZero, restoreLeftUpperArmAnimation])
        let leftHandAnimationTwo = SKAction.runBlock({
            self.leftHandUpperArmNode?.runAction(animateLeftHandSequence)
        })
        
        
        
        let finalAnimationSequence = SKAction.sequence([initialAnimationSequence, finalHeadAnimation, restoreAnimationSequence, finalHeadAnimation, animationDelayZero, leftHandAnimationTwo, animationDelayZero])
        let finalAnimation = SKAction.repeatActionForever(finalAnimationSequence)
        
        self.runAction(finalAnimation)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        GameSceneController.sharedInstance.handleTouchMove(touches, sprite: backgroundSprite, scene: self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        if isEnabled
        {
            for touch: AnyObject in touches {
                let location = touch.locationInNode(backgroundSprite!)
                
                if CatBubble!.containsPoint(location)  {
                    self.isEnabled = false
                    if check
                    {
                        print("tapped!")
                        self.CatBubble!.runAction(SKAction.moveToX((CatBubble?.frame.origin.x)!-40,duration: 0.8))
                        self.CatBubble!.runAction(SKAction.scaleXTo(0.4, y : 0.4 ,duration: 0.8))
                        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
                        let waitAction = SKAction.waitForDuration(1.0)
                        let run = SKAction.runBlock {
                            self.bubbleButton1?.hidden = false
                            self.myLabel1?.hidden = false
                        }
                        
                        let zoomInAction = SKAction.runBlock {
                            self.backgroundSprite!.runAction(SKAction.scaleTo(1.1, duration: 0.8))
                        }
                        let alertBox = SKAction.runBlock {
                            self.bubbleButton?.hidden = false
                            self.myLabel3?.hidden = false
                        }
                        
                        let waitZoomAction = SKAction.waitForDuration(0.8)
                        let waitSecondAction = SKAction.waitForDuration(0.3)
                        let runSecond = SKAction.runBlock {
                            
                            self.bubbleButton2?.hidden = false
                            self.myLabel2?.hidden = false
                            self.isEnabled = true
                        }
                        
                        self.runAction(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                        check = false
                        
                    }
                    else
                        
                    {
                        self.myLabel3?.hidden = true
                        let zoomInAction1 = SKAction.scaleTo(1, duration: 1)
                        let runAction = SKAction.runBlock {
                            self.bubbleButton?.hidden = false
                            self.isEnabled = true
                        }
                        self.CatBubble!.runAction(SKAction.scaleXTo(0.095,y:0.212, duration: 0.8))
                        let waitZoomAction = SKAction.waitForDuration(1)
                        self.backgroundSprite!.runAction(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
                        check = true
                        self.messageButton?.hidden = true
                        self.bubbleButton1?.hidden = true
                        self.myLabel1?.hidden = true
                        self.bubbleButton2?.hidden = true
                        self.myLabel2?.hidden = true
                        self.CatBubble!.runAction(SKAction.moveToX(-149.841,duration: 0.8))
                    }
                    
                }
                
                if BallNode!.containsPoint(location){
                    BallNode?.removeFromParent()
                    
                }
                if ProfileBallNode!.containsPoint(location){
                    ProfileBallNode?.removeFromParent()
                }
                if ShoeProfileNode!.containsPoint(location){
                    ShoeProfileNode?.removeFromParent()
                    
                }
                if ShoeMoneyNode!.containsPoint(location){
                    ShoeMoneyNode?.removeFromParent()
                }
                
                if alertBoxNode!.containsPoint(location)  {
                    let alertlLocation = touch.locationInNode(alertBoxNode!)
                    if okButtonNode!.containsPoint(alertlLocation){
                        alertBoxNode?.hidden = true
                        
                    }
                }
            }
        }
    }
    
    
    func ButtonClickMethod(PresentButton:SKSpriteNode)
    {
        PresentButton.alpha = 0.5
        let waitAction = SKAction.waitForDuration(0.1)
        let run = SKAction.runBlock {
            PresentButton.alpha = 1.0
        }
         PresentButton.runAction(SKAction .sequence([waitAction,run]))
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
