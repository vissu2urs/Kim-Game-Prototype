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
    var initialTouchLocation: CGPoint? = CGPoint(x:0.0,y: 0.0)
    var backgroundScreenSpritePosition: CGPoint? = CGPoint(x:0.0, y: 0.0)
    
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
    override func didMove(to view: SKView) {
        
        
        SnowPartical()
        
        backgroundSprite = self.childNode(withName: "Background") as? SKSpriteNode
        CatBubble = backgroundSprite?.childNode(withName: "CatBubbleNode") as? SKSpriteNode
        vickiSprite = backgroundSprite?.childNode(withName:"Vicki") as? SKSpriteNode
        
        
        lowerTorsoNode = backgroundSprite?.childNode(withName:"LowerTorso") as? SKSpriteNode
        upperTorsoNode = lowerTorsoNode?.childNode(withName:"UpperTorso") as? SKSpriteNode
        headNode = upperTorsoNode?.childNode(withName:"Head") as? SKSpriteNode
        rightUpperLegNode = lowerTorsoNode?.childNode(withName:"RightUpperLeg") as? SKSpriteNode
        leftUpperLegNode = lowerTorsoNode?.childNode(withName:"LeftUpperLeg") as? SKSpriteNode
        rightLowerLegNode = rightUpperLegNode?.childNode(withName:"RightLowerLeg") as? SKSpriteNode
        leftLoweLegNode = leftUpperLegNode?.childNode(withName:"LeftLowerLeg") as? SKSpriteNode
        rightFootNode = rightLowerLegNode?.childNode(withName:"RightFoot") as? SKSpriteNode
        leftFootNode = leftLoweLegNode?.childNode(withName:"LeftFoot") as? SKSpriteNode
        leftHandUpperArmNode = upperTorsoNode?.childNode(withName:"LeftUpperArm") as? SKSpriteNode
        leftHandLowerArmNode = leftHandUpperArmNode?.childNode(withName:"LeftLowerArm") as? SKSpriteNode
        leftHandNode = leftHandLowerArmNode?.childNode(withName:"LeftWrist") as? SKSpriteNode
        rightHandUpperArmNode = upperTorsoNode?.childNode(withName:"RightUpperArm") as? SKSpriteNode
        rightHandLowerArmNode = rightHandUpperArmNode?.childNode(withName:"RightLowerArm") as? SKSpriteNode
        rightHandNode = rightHandLowerArmNode?.childNode(withName:"RightWrist") as? SKSpriteNode
        
        initiateCharacterAnimations()
        vickiAnimation()
        BallNode = backgroundSprite?.childNode(withName:"BallNode")as? SKSpriteNode
        ProfileBallNode = backgroundSprite?.childNode(withName:"ProfileBallNode")as? SKSpriteNode
        ShoeProfileNode = backgroundSprite?.childNode(withName:"ShoeProfileNode")as? SKSpriteNode
        ShoeMoneyNode = backgroundSprite?.childNode(withName:"ShoeMoneyNode")as? SKSpriteNode
        ShoeNode = backgroundSprite?.childNode(withName:"ShoeNode")as? SKSpriteNode
        BallNode?.isHidden = true
        ProfileBallNode?.isHidden = true
        ShoeProfileNode?.isHidden = true
        ShoeMoneyNode?.isHidden = true
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: CGRect(x:0,y:120,width: 1024,height: 768))
        // 2. Set the friction of that physicsBody to 0
        borderBody.friction = 0
        // 3. Set physicsBody of scene to borderBody
        self.physicsBody = borderBody//         BallNode?.physicsBody?.gravity
        
        
        alertBoxNode = backgroundSprite?.childNode(withName:"AlertNode") as? SKSpriteNode
        okButtonNode =  alertBoxNode?.childNode(withName:"OkNode") as? SKSpriteNode
        alertBoxNode?.isHidden =  true
        ButtonsSetup()
        BubbleSetup()

        
    }
    
    func SnowPartical()
    {
        //snow partical
        let path = Bundle.main.path(forResource: "SnowParticle", ofType: "sks")
        let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        rainParticle.position = CGPoint(x:self.size.width/2, y:self.size.height)
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
        BodyNode.physicsBody!.velocity=CGVector(dx:velocityx,dy: velocityy)
        BodyNode.physicsBody?.usesPreciseCollisionDetection = false
        
        let waitZoomAction = SKAction.wait(forDuration:2.3)
        let run = SKAction.run {
            BodyNode.physicsBody = nil
        }
        BodyNode.run(SKAction.sequence([waitZoomAction,run]))
        
    }
    
    
    func BubbleSetup()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        bubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton1!.position = CGPoint(x:(self.CatBubble!.frame.minX)-85, y:(self.CatBubble!.frame.minY)-55);
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
            
            let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
            
            self.backgroundSprite!.run(SKAction.sequence([zoomInAction1]))
        })
        
        
        myLabel1 = SKLabelNode(fontNamed: "Arial")
        myLabel1!.text = "(Adopt. )"
        myLabel1!.fontSize = 15
        myLabel1!.fontColor = UIColor.black
        myLabel1!.position = CGPoint(x:(self.bubbleButton1!.frame.midX)-10, y:(self.bubbleButton1!.frame.midY)-3)
        myLabel1!.zPosition = 10
        backgroundSprite!.addChild(myLabel1!)
        
        let BubbleButtonTexture = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture = SKTexture(imageNamed: "OrangeBubble");
        bubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture, selectedTexture:BubbleButtonPressedTexture, disabledTexture:BubbleButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton2!.position = CGPoint(x:(self.CatBubble!.frame.minX)-85, y:(self.CatBubble!.frame.minY)-110);
        bubbleButton2!.size = CGSize(width: 230, height: 70)
        bubbleButton2!.zPosition = 2
        self.backgroundSprite!.addChild(bubbleButton2!);
        bubbleButton2!.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            self.check = false
            self.myLabel3?.isHidden = true
            
            let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
            let run = SKAction.run {
                self.bubbleButton?.isHidden = false
                self.isEnabled = true
            }
            self.CatBubble!.run(SKAction.scaleX(to: 0.095,y:0.212, duration: 0.8))
            
            
            let waitZoomAction = SKAction.wait(forDuration:1)
            self.backgroundSprite! .run(SKAction.sequence([zoomInAction1,waitZoomAction,run]))
            self.check = true
            
            self.bubbleButton1?.isHidden = true
            self.myLabel1?.isHidden = true
            self.bubbleButton2?.isHidden = true
            self.myLabel2?.isHidden = true
            self.CatBubble!.run(SKAction.moveTo(x: -149.841,duration: 0.8))
            
        })
        
         myLabel2 = SKLabelNode(fontNamed: "Arial")
        myLabel2!.text = "(Lee it alone.)"
        myLabel2!.fontSize = 15
        myLabel2!.fontColor = UIColor.black
        myLabel2!.position = CGPoint(x:(self.bubbleButton2!.frame.midX)-20, y:(self.bubbleButton2!.frame.midY)-3)
        myLabel2!.zPosition = 10
        backgroundSprite!.addChild(myLabel2!)
        self.bubbleButton2?.isHidden = true
        self.myLabel2?.isHidden = true
        self.bubbleButton1?.isHidden = true
        self.myLabel1?.isHidden = true
        
        
        myLabel3 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        myLabel3!.text = "Meow …"
        myLabel3!.fontSize = 20
        myLabel3!.fontColor = UIColor.black
        myLabel3!.position = CGPoint(x:(self.CatBubble!.frame.maxX)-110, y:(self.CatBubble!.frame.midY))
        myLabel3!.zPosition = 11
        
        self.backgroundSprite!.addChild(myLabel3!)
        self.messageButton?.isHidden = true
        self.myLabel3?.isHidden = true
        
        
    }
    
    
    
    
    
    func ButtonsSetup()
    {
        
        let buttonTexture = SKTexture(imageNamed: "CircleButton");
        let buttonPressedTexture = SKTexture(imageNamed: "CircleButtonTouchUp");
        let  PopGlamButton = FTButtonNode(normalTexture:buttonTexture, selectedTexture:buttonPressedTexture, disabledTexture:buttonPressedTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        PopGlamButton.position = CGPoint(x:-404.576, y: -87.216);
        PopGlamButton.size = CGSize(width: 90, height: 80)
        PopGlamButton.zPosition = 2
        self.backgroundSprite!.addChild(PopGlamButton);
        
        PopGlamButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            print("button touched")
            let transition = SKTransition.reveal(with: .right, duration: 0.8)
            if let scene = MagazineScene.unarchiveFromFile(file: "MagazineScene") as? MagazineScene {
                // Configure the view.
                let skView = self.view! as SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .aspectFill
                skView.presentScene(scene,transition: transition)
            }
            
        })
        
        
        
        
        
        
        let LifeStyleButtonTexture = SKTexture(imageNamed: "HomeGreen");
        let LifeStyleButtonPressedTexture = SKTexture(imageNamed: "HomeGreenTouchUp");
        let  LifeStyleButton = FTButtonNode(normalTexture:LifeStyleButtonTexture, selectedTexture:LifeStyleButtonPressedTexture, disabledTexture:buttonPressedTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        LifeStyleButton.position = CGPoint(x: +577.728 , y: -87.216);
        LifeStyleButton.size = CGSize(width: 90, height: 80)
        LifeStyleButton.zPosition = 2
        self.backgroundSprite!.addChild(LifeStyleButton);
        
        LifeStyleButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
             print("button touched")
            let transition = SKTransition.reveal(with: .right, duration: 0.8)
            if let scene = LifeStyleScene.unarchiveFromFile(file: "LifeStyleScene") as? LifeStyleScene {
                // Configure the view.
                let skView = self.view! as SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .aspectFill
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
        soChicButton.position = CGPoint(x:1800 , y:-87.216);
        soChicButton.size = CGSize(width: 90, height: 80)
        soChicButton.zPosition = 5
        self.backgroundSprite!.addChild(soChicButton);
        
        
        soChicButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            if self.isLockToSoChick
            {
                self.alertBoxNode?.isHidden =  false
            }else
            {
                print("button touched")
                let transition = SKTransition.reveal(with: .right, duration: 0.8)
                if let scene = SoChicScene.unarchiveFromFile(file: "SoChicScene") as? SoChicScene {
                    // Configure the view.
                    let skView = self.view! as SKView
                    skView.showsFPS = true
                    skView.showsNodeCount = true
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .aspectFill
                    skView.presentScene(scene,transition: transition)
                }
            }
            
        })
        
        let guardButtonTexture = SKTexture(imageNamed: "Guard");
        let guardButtonPressedTexture = SKTexture(imageNamed: "GuardTouchUp");
        let  guardButton = FTButtonNode(normalTexture:guardButtonTexture, selectedTexture:guardButtonPressedTexture, disabledTexture:guardButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        guardButton.position = CGPoint(x:267 , y: 59.756);
        guardButton.size = CGSize(width: 70, height: 260)
        guardButton.zPosition = 5
         self.backgroundSprite!.addChild(guardButton);
        guardButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            let zoomInAction1 = SKAction.scale(to: 1.1, duration: 0.3)
            let run = SKAction.scale(to: 1.0, duration: 0.3)
            let waitZoomAction = SKAction.wait(forDuration:0.2)
            guardButton.run(SKAction.sequence([zoomInAction1,waitZoomAction,run]))
            
            print("button touched")
            self.BallNode?.isHidden = false
            self.ProfileBallNode?.isHidden = false
            self.addPhysicsToBody(BodyNode: self.BallNode!,velocityx:100,velocityy: 100 )
            self.addPhysicsToBody(BodyNode: self.ProfileBallNode!,velocityx:200,velocityy: 200 )
            
        })
        
        let shoeButtonTexture = SKTexture(imageNamed: "ShoeIcon");
        let ShoeButtonPressedTexture = SKTexture(imageNamed: "ShoeIcon");
        
        let  shoeButton = FTButtonNode(normalTexture:shoeButtonTexture, selectedTexture:ShoeButtonPressedTexture, disabledTexture:shoeButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        shoeButton.position = CGPoint(x:-730 ,y: -135);
        shoeButton.size = CGSize(width: 110, height: 160)
        shoeButton.zPosition = 5
        
        self.backgroundSprite!.addChild(shoeButton);
        
        
        shoeButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            
            let zoomInAction1 = SKAction.scale(to: 1.1, duration: 0.3)
            let run = SKAction.scale(to: 1.0, duration: 0.3)
            let waitZoomAction = SKAction.wait(forDuration: 0.2)
            shoeButton.run(SKAction.sequence([zoomInAction1,waitZoomAction,run]))
            
            print("button touched")
            self.ShoeProfileNode?.isHidden = false
            self.ShoeMoneyNode?.isHidden = false
            self.addPhysicsToBody(BodyNode: self.ShoeProfileNode!,velocityx:100,velocityy: 100 )
            self.addPhysicsToBody(BodyNode: self.ShoeMoneyNode!,velocityx:200,velocityy: 200 )
            
        })
        
        
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
    
    func initiateCharacterAnimations() {
        let animationDelayZero = SKAction.wait(forDuration:1.5)
        let animationDelay = SKAction.wait(forDuration:3.0)
        
        let animateLeftUpperArm = SKAction.rotate(toAngle:CGFloat(50.0).degreesToRadians(), duration: 0.5)
        let animateLeftLowerArm = SKAction.rotate(toAngle:CGFloat(-80.0).degreesToRadians(), duration: 0.5)
        let upperTorsoAnimation = SKAction.rotate(toAngle:CGFloat(2.0).degreesToRadians(), duration: 0.5)
        
        let collectiveHandAnimation = SKAction.run({
            self.leftHandUpperArmNode?.run(animateLeftUpperArm)
            self.leftHandLowerArmNode?.run(animateLeftLowerArm)
            self.upperTorsoNode?.run(upperTorsoAnimation)
        })
        
        let initialAnimationSequence = SKAction.sequence([animationDelay, collectiveHandAnimation])
        
        let restoreLeftUpperArmAnimation = SKAction.rotate(toAngle:CGFloat(leftUpperArmOriginalAngle).degreesToRadians(), duration: 0.5)
        let restoreLeftLowerArmAnimation = SKAction.rotate(toAngle:CGFloat(leftLowerArmOriginalAngle).degreesToRadians(), duration: 0.5)
        let restoreTorsoAnimation = SKAction.rotate(toAngle:CGFloat(upperTorsoOriginalAngle).degreesToRadians(), duration: 0.5)
        
        let restoreCollectiveHandAnimation = SKAction.run({
            self.leftHandUpperArmNode?.run(restoreLeftUpperArmAnimation)
            self.leftHandLowerArmNode?.run(restoreLeftLowerArmAnimation)
            self.upperTorsoNode?.run(restoreTorsoAnimation)
        })
        
        let restoreAnimationSequence = SKAction.sequence([animationDelay, restoreCollectiveHandAnimation])
        
        //let animateRightUpperLeg = SKAction.rotate(toAngle:CGFloat(0.0).degreesToRadians(), duration: 0.3)
        //let restoreRightUpperLeg = SKAction.rotate(toAngle:CGFloat(rightUpperLegOriginalAngle).degreesToRadians(), duration: 0.3)
        //let legAnimation = SKAction.sequence([animationDelayZero, animateRightUpperLeg, restoreRightUpperLeg])
        //let rightLegAnimation = SKAction.repeatAction(legAnimation, count: 2)
        //_ = SKAction.run({
        //    self.rightUpperLegNode?.run(legAnimation)
        //})
        
        //let animateLeftUpperLeg = SKAction.rotate(toAngle:CGFloat(-5.506).degreesToRadians(), duration: 0.6)
        //let restoreLeftUpperLeg = SKAction.rotate(toAngle:CGFloat(leftUpperLegOriginalAngle).degreesToRadians(), duration: 0.6)
        //let leftUpperLegAnimationSequence = SKAction.sequence([animationDelayZero, animateLeftUpperLeg, restoreLeftUpperLeg])
        //let collectiveLeftUpperLegAnimation = SKAction.run({
        //    self.leftUpperLegNode?.run(leftUpperLegAnimationSequence)
        //})
        
        //head animation
        let changeHeadTextureAnimation = SKAction.setTexture(SKTexture(image: UIImage(named: "HeadEyesClosed")!))
        let restoreHeadTextureAnimation = SKAction.setTexture(SKTexture(image: UIImage(named: "Head")!))
        let blinkRepetation = SKAction.sequence([changeHeadTextureAnimation, SKAction.wait(forDuration:0.1),restoreHeadTextureAnimation])
        let headAnimationSequence = SKAction.sequence([animationDelayZero, blinkRepetation])
        let finalHeadAnimation = SKAction.run({
            self.headNode?.run(headAnimationSequence)
        })
        
        let animateLeftUpperArmTwo = SKAction.rotate(toAngle: CGFloat(105.0).degreesToRadians(), duration: 0.5)
        let animateLeftWrist = SKAction.rotate(toAngle:CGFloat(-76.0).degreesToRadians(), duration: 0.2)
        let restoreLeftWrist = SKAction.rotate(toAngle:CGFloat(leftHandOriginalAngle).degreesToRadians(), duration: 0.2)
        let leftWristAnimationSequence = SKAction.sequence([animateLeftWrist, SKAction.wait(forDuration:0.2), restoreLeftWrist, animateLeftWrist, SKAction.wait(forDuration:0.2), restoreLeftWrist])
        let leftWristAnimationFinal = SKAction.run({
            self.leftHandNode?.run(leftWristAnimationSequence)
        })
        let animateLeftHandSequence = SKAction.sequence([animationDelayZero, animateLeftUpperArmTwo, leftWristAnimationFinal, animationDelayZero, restoreLeftUpperArmAnimation])
        let leftHandAnimationTwo = SKAction.run({
            self.leftHandUpperArmNode?.run(animateLeftHandSequence)
        })
        
        
        
        let finalAnimationSequence = SKAction.sequence([initialAnimationSequence, finalHeadAnimation, restoreAnimationSequence, finalHeadAnimation, animationDelayZero, leftHandAnimationTwo, animationDelayZero])
        let finalAnimation = SKAction.repeatForever(finalAnimationSequence)
        
        self.run(finalAnimation)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        GameSceneController.sharedInstance.handleTouchMove(touches: touches, sprite: backgroundSprite, scene: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if isEnabled
        {
            for touch: AnyObject in touches {
                let location = touch.location(in: backgroundSprite!)
                
                if CatBubble!.contains(location)  {
                    self.isEnabled = false
                    if check
                    {
                        print("tapped!")
                        self.CatBubble!.run(SKAction.moveTo(x: (CatBubble?.frame.origin.x)!-40,duration: 0.8))
                        self.CatBubble!.run(SKAction.scaleX(to: 0.4, y : 0.4 ,duration: 0.8))
                        //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
                        let waitAction = SKAction.wait(forDuration:1.0)
                        let run = SKAction.run {
                            self.bubbleButton1?.isHidden = false
                            self.myLabel1?.isHidden = false
                        }
                        
                        let zoomInAction = SKAction.run {
                            self.backgroundSprite!.run(SKAction.scale(to: 1.1, duration: 0.8))
                        }
                        let alertBox = SKAction.run {
                            self.bubbleButton?.isHidden = false
                            self.myLabel3?.isHidden = false
                        }
                        
                        let waitZoomAction = SKAction.wait(forDuration: 0.8)
                        let waitSecondAction = SKAction.wait(forDuration:0.3)
                        let runSecond = SKAction.run {
                            
                            self.bubbleButton2?.isHidden = false
                            self.myLabel2?.isHidden = false
                            self.isEnabled = true
                        }
                        
                        self.run(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                        check = false
                        
                    }
                    else
                        
                    {
                        self.myLabel3?.isHidden = true
                        let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
                        let run = SKAction.run {
                            self.bubbleButton?.isHidden = false
                            self.isEnabled = true
                        }
                        self.CatBubble!.run(SKAction.scaleX(to: 0.095,y:0.212, duration: 0.8))
                        let waitZoomAction = SKAction.wait(forDuration: 1)
                        self.backgroundSprite!.run(SKAction.sequence([zoomInAction1,waitZoomAction,run]))
                        check = true
                        self.messageButton?.isHidden = true
                        self.bubbleButton1?.isHidden = true
                        self.myLabel1?.isHidden = true
                        self.bubbleButton2?.isHidden = true
                        self.myLabel2?.isHidden = true
                        self.CatBubble!.run(SKAction.moveTo(x: -149.841,duration: 0.8))
                    }
                    
                }
                
                if BallNode!.contains(location){
                    BallNode?.removeFromParent()
                    
                }
                if ProfileBallNode!.contains(location){
                    ProfileBallNode?.removeFromParent()
                }
                if ShoeProfileNode!.contains(location){
                    ShoeProfileNode?.removeFromParent()
                    
                }
                if ShoeMoneyNode!.contains(location){
                    ShoeMoneyNode?.removeFromParent()
                }
                
                if alertBoxNode!.contains(location)  {
                    let alertlLocation = touch.location(in: alertBoxNode!)
                    if okButtonNode!.contains(alertlLocation){
                        alertBoxNode?.isHidden = true
                        
                    }
                }
            }
        }
    }
    
    
    func ButtonClickMethod(PresentButton:SKSpriteNode)
    {
        PresentButton.alpha = 0.5
        let waitAction = SKAction.wait(forDuration: 0.1)
        let run = SKAction.run {
            PresentButton.alpha = 1.0
        }
        PresentButton.run(SKAction .sequence([waitAction,run]))
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
