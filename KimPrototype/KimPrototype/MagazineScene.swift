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
    
    
    
    override func didMove(to view: SKView) {
        
        
        listOfNames = ["fold shirts", "new outfits", "check sales","hips forward"]
        backgroundSprite = self.childNode(withName: "PopClamBackgroundNode") as? SKSpriteNode
        CircleWorkButton = backgroundSprite!.childNode(withName: "CircleWorkButtonNode") as? SKSpriteNode
        CircleWorkButton2 = backgroundSprite!.childNode(withName: "CircleWorkButtonNode2") as? SKSpriteNode
        CircleWorkButton3 = backgroundSprite!.childNode(withName: "CircleWorkButtonNode3") as? SKSpriteNode
        CircleWorkButton4 = backgroundSprite!.childNode(withName:"CircleWorkButtonNode4") as? SKSpriteNode
        CircleWorkButton5 = backgroundSprite!.childNode(withName:"CircleWorkButtonNode5") as? SKSpriteNode
        bubbleNode = backgroundSprite!.childNode(withName:"BubbleImageNode") as? SKSpriteNode
        HomeButton = backgroundSprite!.childNode(withName:"HomeButtonNode") as? SKSpriteNode
        vickiSprite = backgroundSprite?.childNode(withName:"Vicki") as? SKSpriteNode
        //HomeButtonNode
        
        CircleWorkButton?.isHidden = true
        CircleWorkButton2?.isHidden = true
        CircleWorkButton3?.isHidden = true
        CircleWorkButton4?.isHidden = true
        CircleWorkButton5?.isHidden = true
        
        
        
        
        workLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        workLabel!.text = "balance"
        workLabel!.fontSize = 20
        workLabel!.fontColor = UIColor.black
        //workLabel!.position = CGPoint(x:CGRect.midX(CircleWorkButton!.frame)+165, y:CGRect.midY(CircleWorkButton!.frame)+15)
        workLabel!.zPosition = 11
        backgroundSprite!.addChild(workLabel!)
        self.workLabel?.isHidden = true
        
        let bubbleButton = SKTexture(imageNamed: "Bubble")
        self.bubbleButton1 = SKSpriteNode(texture:bubbleButton);
        self.bubbleButton1?.size = CGSize(width: 230, height: 70)
        self.bubbleButton1!.position = CGPoint(x:(self.bubbleNode!.frame.minX)-85, y:(self.bubbleNode!.frame.minY)-55);
        self.bubbleButton1!.zPosition = 5
        
        
        bubbleLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel1!.text = "1 hour"
        bubbleLabel1!.fontSize = 15
        bubbleLabel1!.fontColor = UIColor.black
        bubbleLabel1!.position = CGPoint(x:(self.bubbleButton1!.frame.midX)-10, y:(self.bubbleButton1!.frame.midY)-3)
        bubbleLabel1!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel1!)
        backgroundSprite!.addChild(self.bubbleButton1!)
        
        
        
        // self.bubbleButton2 = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 10, height: 50))
        let bubbleButton2 = SKTexture(imageNamed: "OrangeBubble")
        self.bubbleButton2 = SKSpriteNode(texture:bubbleButton2);
        //self.bubbleButton2 = SKSpriteNode(color: SKColor.blueColor(), size: CGSizeMake(180, 85))
        self.bubbleButton2!.zPosition = 2
        self.bubbleButton2?.size = CGSize(width: 230, height: 70)
        self.bubbleButton2!.position = CGPoint(x:(self.bubbleNode!.frame.minX)-85, y:(self.bubbleNode!.frame.minY)-110);
        self.bubbleButton2!.zPosition = 5
        backgroundSprite!.addChild(self.bubbleButton2!)
        
        bubbleLabel2 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel2!.text = "4 hours"
        bubbleLabel2!.fontSize = 15
        bubbleLabel2!.fontColor = UIColor.black
        bubbleLabel2!.position = CGPoint(x:(self.bubbleButton2!.frame.midX)-20, y:(self.bubbleButton2!.frame.midY)-3)
        bubbleLabel2!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel2!)
        self.bubbleButton2?.isHidden = true
        self.bubbleLabel2?.isHidden = true
        self.bubbleButton1?.isHidden = true
        self.bubbleLabel1?.isHidden = true
        
        
        bubbleLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel!.text = "How many hours do you want to work ?"
        bubbleLabel!.fontSize = 15
        bubbleLabel!.fontColor = UIColor.black
        bubbleLabel!.position = CGPoint(x:(self.bubbleNode!.frame.maxX)-147, y:(self.bubbleNode!.frame.midY))
        bubbleLabel!.zPosition = 11
        
        self.backgroundSprite!.addChild(bubbleLabel!)
        self.bubbleLabel?.isHidden = true
        
        
        /* Setup your scene here */
        
        vickiAnimation()
        
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "WorkButton");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "WorkButton");
        workBubble1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble2 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble3 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble4 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workButtonSetup(xpoint: -10,ypoint: -100,workBubble:workBubble1! )
        workButtonSetup(xpoint: -130,ypoint: +140,workBubble:workBubble2! )
        workButtonSetup(xpoint: +420,ypoint: +150,workBubble:workBubble3! )
        workButtonSetup(xpoint: -643,ypoint: -100,workBubble:workBubble4! )
        
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
            {    self.SetupForTwoWorkDone(WorkButton: workBubble)
                
            } else{
                self.setupForTwoHalfDone(WorkButton: workBubble)
            }
        })
        workBubble.isHidden = true
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: backgroundSprite!)
            if HomeButton!.contains(location)
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
                
                if bubbleButton1!.contains(location)
                {
                    
                    self.bubbleNode?.removeFromParent()
                    self.bubbleButton1?.removeFromParent()
                    self.bubbleLabel1?.removeFromParent()
                    self.bubbleButton2?.removeFromParent()
                    self.bubbleLabel2?.removeFromParent()
                    self.bubbleLabel?.removeFromParent()
                    
                    
                    self.workBubble1?.isHidden = false
                    self.workBubble4?.isHidden = false
                    
                }
                
                if bubbleButton2!.contains(location)
                {
                    
                    self.bubbleNode?.removeFromParent()
                    self.bubbleButton1?.removeFromParent()
                    self.bubbleLabel1?.removeFromParent()
                    self.bubbleButton2?.removeFromParent()
                    self.bubbleLabel2?.removeFromParent()
                    self.bubbleLabel?.removeFromParent()
                    
                    
                    self.workBubble1?.isHidden = false
                    self.workBubble4?.isHidden = false
                }
                
            }
            
            if bubbleNode!.contains(location)  {
                
                
                if check
                {
                    print("tapped!")
                    
                    self.bubbleNode!.run(SKAction.moveTo(x: (bubbleNode?.frame.origin.x)!-40,duration: 0.8))
                    self.bubbleNode!.run(SKAction.scaleX(to: 0.3, y : 0.35 ,duration: 0.8))
                    let waitAction = SKAction.wait(forDuration: 1.0)
                    let run = SKAction.run {
                        self.bubbleButton1?.isHidden = false
                        self.bubbleLabel1?.isHidden = false
                    }
                    
                    let zoomInAction = SKAction.run {
                        self.backgroundSprite!.run(SKAction.scale(to: 1.1, duration: 0.8))
                    }
                    let alertBox = SKAction.run {
                        self.bubbleNode?.isHidden = false
                        self.bubbleLabel?.isHidden = false
                    }
                    
                    let waitZoomAction = SKAction.wait(forDuration: 0.8)
                    let waitSecondAction = SKAction.wait(forDuration: 0.3)
                    let runSecond = SKAction.run {
                        self.bubbleButton2?.isHidden = false
                        self.bubbleLabel2?.isHidden = false
                        self.isButtonEnabled = true
                        
                    }
                    
                    self.run(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                    check = false
                    
                }
                else{
                    self.bubbleLabel?.isHidden = true
                    isButtonEnabled = false
                    let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
                    let runAction = SKAction.run {
                        
                    }
                    self.bubbleNode!.run(SKAction.scaleX(to: 0.095,y:0.212, duration: 0.8))
                    let waitZoomAction = SKAction.wait(forDuration: 1)
                    self.backgroundSprite!.run(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
                    check = true
                    self.bubbleButton1?.isHidden = true
                    self.bubbleLabel1?.isHidden = true
                    self.bubbleButton2?.isHidden = true
                    self.bubbleLabel2?.isHidden = true
                    self.bubbleNode!.run(SKAction.moveTo(x: 139.777,duration: 0.8))
                }
                
            }
        }
    }
    
    
    
    
    func setupForTwoHalfDone(WorkButton:SKSpriteNode){
        let WorkTexture1 = SKTexture(imageNamed: "1.png")
        let WorkTexture2 = SKTexture(imageNamed: "2.png")
        let WorkTexture3 = SKTexture(imageNamed: "3.png")
        let WorkTexture4 = SKTexture(imageNamed: "WorkHalfDone")
        let anim =  SKAction.animate(with: [WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.run(anim)
        isCheck = true
        checkVariable+1
    }
    
    
    func ButtonClickMethod(PresentButton:SKSpriteNode){
        PresentButton.alpha = 0.5
        let waitAction = SKAction.wait(forDuration: 0.05)
        let run = SKAction.run {
            PresentButton.alpha = 1.0
        }
        PresentButton.run(SKAction .sequence([waitAction,run]))
    }
    
    
    func SetupForTwoWorkDone( WorkButton:FTButtonNode )
    {
        isEnabled = false
        
        if checkVariable == 0{
            workLabel!.position = CGPoint(x:(WorkButton.frame.midX)+90, y:(WorkButton.frame.midY)+10)
            
        }
        let WorkTexture1 = SKTexture(imageNamed: "5.png")
        let WorkTexture2 = SKTexture(imageNamed: "6.png")
        let WorkTexture3 = SKTexture(imageNamed: "7.png")
        let WorkTexture4 = SKTexture(imageNamed: "WorkDoneButton")
        let anim =  SKAction.animate(with: [WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.run(anim)
        let runSecond = SKAction.run {
            
            WorkButton.run(SKAction.scaleX(to: 3.8, y: 1.2, duration: 0.5))
        }
        
        let runFirst = SKAction.moveTo(x: (WorkButton.frame.origin.x)+114, duration: 0.5)
        let waitDuration = SKAction.wait(forDuration: 0.6)
        let runLabelAction = SKAction.run {
            self.workLabel?.isHidden = true
            WorkButton.label.isHidden = true
            WorkButton.setButtonLabel(title: (self.workLabel?.text)! as NSString, font: "AvenirNext-Bold", fontSize: 20, color: UIColor.black)
            
            WorkButton.setScaleForLabel()
            WorkButton.label.isHidden = false
            //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
            
            self.isEnabled = true
        }
        checkVariable+1
        WorkButton.run(SKAction.group([runSecond,runFirst]))
        self.run(SKAction.sequence([waitDuration,runLabelAction]))
        isCheck = false
        if checkVariable >= 3
        {
            let waitDuration = SKAction.wait(forDuration: 0.6)
            let runLabelAction = SKAction.run {
                self.workBubble3?.isHidden = false
                self.workBubble2?.isHidden = false
                self.workLabel?.isHidden = true
                WorkButton.removeFromParent()
                self.workLabel!.text = self.listOfNames?.object(at: self.countWorksDone) as? String
                
                self.countWorksDone+1
                if self.countWorksDone<=3{
                    self.checkForSocheck = true
                }
            }
            WorkButton.run(SKAction.sequence([waitDuration,runLabelAction]))
            checkVariable = 0
            isCheck = true
        }
        
    }
    
    
    
    func vickiAnimation () {
        
        let vickiTextureAtlas = SKTextureAtlas(named: "Vicki")
        let vickiTextureNames = vickiTextureAtlas.textureNames as Array
        let sortedVickiTextureNames = vickiTextureNames.sorted {  ( s1,  s2) -> Bool in
            //s1 = s1.stringByReplacingOccurrencesOfString(".png", withString: "")
            //s2 = s2.stringByReplacingOccurrencesOfString(".png", withString: "")
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
