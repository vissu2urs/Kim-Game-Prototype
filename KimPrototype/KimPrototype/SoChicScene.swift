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
    
    override func didMove(to view: SKView) {
        
        //MessageBoxNode
        listOfNames = ["fold shirts", "new outfits", "check sales","hang shirts"]
        backgroundSprite = self.childNode(withName: "SoChicBackground") as? SKSpriteNode
        let homeButtonTexture = SKTexture(imageNamed: "RedHome");
        let homeButtonPressedTexture = SKTexture(imageNamed: "RedHome");
        let  HomeButton = FTButtonNode(normalTexture:homeButtonTexture, selectedTexture:homeButtonPressedTexture, disabledTexture:homeButtonTexture);
        HomeButton.position = CGPoint(x: -635.609 ,y: -25.0);
        HomeButton.size = CGSize(width: 90, height: 80)
        HomeButton.zPosition = 5
        self.backgroundSprite!.addChild(HomeButton);
        HomeButton.actionTouchUpInside = FTButtonTarget.aBlock({ () -> Void in
            print("button touched")
            let transition = SKTransition.reveal(with: .right, duration: 0.8)
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
            
        })
        
        messageBox = backgroundSprite?.childNode(withName: "MessageBoxNode") as? SKSpriteNode
        
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "WorkButton");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "WorkButton");
        workBubble1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble2 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble3 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        workBubble4 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        
        
        vickiSprite = backgroundSprite?.childNode(withName: "Vicki") as? SKSpriteNode
        
        BubbleSetup()
        workButtonSetup(xpoint: -10,ypoint: -100,workBubble:workBubble1! )
        workButtonSetup(xpoint: -156,ypoint: -100,workBubble:workBubble2! )
        workButtonSetup(xpoint: +650,ypoint: -50,workBubble:workBubble3! )
        workButtonSetup(xpoint: -720,ypoint: +50,workBubble:workBubble4! )
        
        workLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        workLabel!.text = "rearrange"
        workLabel!.fontSize = 20
        workLabel!.fontColor = UIColor.black
        workLabel!.position = CGPoint(x:(workBubble1!.frame.midX)+165, y:(workBubble1!.frame.midY)+15)
        workLabel!.zPosition = 11
        backgroundSprite!.addChild(workLabel!)
        self.workLabel?.isHidden = true
        
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
            {    self.SetupForTwoWorkDone(WorkButton: workBubble)
                
            } else{
                self.setupForTwoHalfDone(WorkButton: workBubble)
            }
        })
        workBubble.isHidden = true
    }
    
    
    
    func BubbleSetup()
    {
        
        let BubbleButtonTexture1 = SKTexture(imageNamed: "Bubble");
        let BubbleButtonPressedTexture1 = SKTexture(imageNamed: "Bubble");
        bubbleButton1 = FTButtonNode(normalTexture:BubbleButtonTexture1, selectedTexture:BubbleButtonPressedTexture1, disabledTexture:BubbleButtonTexture1);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton1!.position = CGPoint(x:(self.messageBox!.frame.minX)-85, y:(self.messageBox!.frame.minY)-55);
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
            
            self.workBubble1?.isHidden = false
            self.workBubble4?.isHidden = false
         })
        
        
        
        
        
        bubbleLabel1 = SKLabelNode(fontNamed: "AvenirNext-Bold")
        bubbleLabel1!.text = "1 hour"
        bubbleLabel1!.fontSize = 15
        bubbleLabel1!.fontColor = UIColor.black
        bubbleLabel1!.position = CGPoint(x:(self.bubbleButton1!.frame.midX)-10, y:(self.bubbleButton1!.frame.midY)-3)
        bubbleLabel1!.zPosition = 10
        backgroundSprite!.addChild(bubbleLabel1!)
        
        
        
        
        let BubbleButtonTexture = SKTexture(imageNamed: "OrangeBubble");
        let BubbleButtonPressedTexture = SKTexture(imageNamed: "OrangeBubble");
        bubbleButton2 = FTButtonNode(normalTexture:BubbleButtonTexture, selectedTexture:BubbleButtonPressedTexture, disabledTexture:BubbleButtonTexture);
        //PopGlamButton.setButtonLabel("Play",font: "Helvetica",fontSize: 40);
        bubbleButton2!.position = CGPoint(x:(self.messageBox!.frame.minX)-85, y:(self.messageBox!.frame.minY)-110);
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
            self.workBubble1?.isHidden = false
            self.workBubble4?.isHidden = false
            
        })
        
        
        
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
        
        
        messageLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        messageLabel!.text = "How many hours do you want to work ?"
        messageLabel!.fontSize = 15
        messageLabel!.fontColor = UIColor.black
        messageLabel!.position = CGPoint(x:(self.messageBox!.frame.midX)-147, y:(self.messageBox!.frame.midY))
        messageLabel!.zPosition = 11
        
        self.backgroundSprite!.addChild(messageLabel!)
        self.messageLabel?.isHidden = true
        
        
        
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: backgroundSprite!)
            
            
            if messageBox!.contains(location)  {
                
                
                if check
                {
                    print("tapped!")
                    
                    self.messageBox!.run(SKAction.moveTo(x: (messageBox?.frame.origin.x)!-40,duration: 0.8))
                    self.messageBox!.run(SKAction.scaleX(to: 0.3, y : 0.35 ,duration: 0.8))
                    //  bubbleButton.transform = CGAffineTransformMakeScale(2, 2)
                    let waitAction = SKAction.wait(forDuration: 1.0)
                    let run = SKAction.run {
                        self.bubbleButton1?.isHidden = false
                        self.bubbleLabel1?.isHidden = false
                        
                    }
                    
                    let zoomInAction = SKAction.run {
                        self.backgroundSprite!.run(SKAction.scale(to: 1.1, duration: 0.8))
                    }
                    let alertBox = SKAction.run {
                        self.messageBox?.isHidden = false
                        self.messageLabel?.isHidden = false
                        
                    }
                    
                    let waitZoomAction = SKAction.wait(forDuration: 0.8)
                    let waitSecondAction = SKAction.wait(forDuration: 0.3)
                    let runSecond = SKAction.run {
                        
                        self.bubbleButton2?.isHidden = false
                        self.bubbleLabel2?.isHidden = false
                    }
                    
                    self.run(SKAction.sequence([zoomInAction,waitZoomAction,alertBox,waitAction,run,waitSecondAction,runSecond]))
                    check = false
                    
                }
                else
                    
                {
                    self.messageLabel?.isHidden = true
                    
                    let zoomInAction1 = SKAction.scale(to: 1, duration: 1)
                    let runAction = SKAction.run {
                        //self.bubbleButton?.hidden = false
                    }
                    self.messageBox!.run(SKAction.scaleX(to: 0.095,y:0.212, duration: 0.8))
                    
                    
                    let waitZoomAction = SKAction.wait(forDuration: 1)
                    self.backgroundSprite!.run(SKAction.sequence([zoomInAction1,waitZoomAction,runAction]))
                    check = true
                    self.bubbleButton1?.isHidden = true
                    self.bubbleLabel1?.isHidden = true
                    self.bubbleButton2?.isHidden = true
                    self.bubbleLabel2?.isHidden = true
                    self.messageBox!.run(SKAction.moveTo(x: 139.777,duration: 0.8))
                    
                    
                }
                
            }
            
            
        }
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
                
            }
            WorkButton.run(SKAction.sequence([waitDuration,runLabelAction]))
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
        let anim =  SKAction.animate(with: [WorkTexture1,WorkTexture2,WorkTexture3,WorkTexture4], timePerFrame: 0.05)
        WorkButton.run(anim)
        isCheck = true
        checkVariable+1    }
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
        let sortedVickiTextureNames = vickiTextureNames.sorted { (  s1,  s2) -> Bool in
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
        
