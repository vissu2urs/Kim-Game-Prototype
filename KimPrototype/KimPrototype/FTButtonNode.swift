//// Button node for Sprite kit in swift 2.1
//// http://stackoverflow.com/questions/19082202/setting-up-buttons-in-skscene



import Foundation
import SpriteKit

enum FTButtonTarget {
    case aSelector(Selector, AnyObject)
    case aBlock(() -> Void)
}

class FTButtonNode: SKSpriteNode {
    
    var actionTouchUp : FTButtonTarget?
    var actionTouchUpInside : FTButtonTarget?
    var actionTouchDown : FTButtonTarget?
    var label: SKLabelNode
    
    var isSelectedImageEnabled: Bool = true
    var isEnabled: Bool = true {
        didSet {
            if (disabledTexture != nil) {
                texture = isEnabled ? defaultTexture : disabledTexture
            }
        }
    }
    var isSelected: Bool = false {
        didSet {
            if isSelectedImageEnabled
            {
            texture = isSelected ? selectedTexture : defaultTexture
            }
        }
    }
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(normalTexture defaultTexture: SKTexture!, selectedTexture:SKTexture!, disabledTexture: SKTexture?) {
        
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        self.disabledTexture = disabledTexture
        self.label = SKLabelNode(fontNamed: "Helvetica");
        
        super.init(texture: defaultTexture, color: UIColor.blackColor(), size: defaultTexture.size())
        
        userInteractionEnabled = true
      //  self.label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center;
        self.label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center;
      //  self.label.position = CGPoint(x: self.frame.size.width/2,y: self.frame.size.height/2)
        //self.label.color = UIColor.
        self.label.color = UIColor.blackColor()
        self.label.zPosition = 5
          self.addChild(self.label)
        // Adding this node as an empty layer. Without it the touch functions are not being called
        // The reason for this is unknown when this was implemented...?
        let bugFixLayerNode = SKSpriteNode(texture: nil, color:UIColor.clearColor() , size: defaultTexture.size())
        bugFixLayerNode.position = self.position
        addChild(bugFixLayerNode)
        
    }
    
    var disabledTexture: SKTexture?
    
    func callTarget(buttonTarget:FTButtonTarget) {
        
        switch buttonTarget {
        case let .aSelector(selector, target):
            if target.respondsToSelector(selector) {
                UIApplication.sharedApplication().sendAction(selector, to: target, from: self, forEvent: nil)
            }
        case let .aBlock(block):
            block()
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)  {
         let touch: AnyObject! = touches.first
        let touchLocation = touch.locationInNode(parent!)
        
        if (!isEnabled) {
            return
        }
        isSelected = true
        
        if let act = actionTouchDown {
            callTarget(act)
        }
        
    }
    
    
    func setButtonLabel(title: NSString, font: String, fontSize: CGFloat,color : UIColor) {
        self.label.text = title as String
        self.label.fontSize = fontSize
        self.label.fontName = font
        self.label.fontColor = UIColor.blackColor()
        
      
        }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
        if (!isEnabled) {
            return
        }
        
          let touch: AnyObject! = touches.first
        let touchLocation = touch.locationInNode(parent!)
        
        if (CGRectContainsPoint(frame, touchLocation)) {
            isSelected = true
        } else {
            isSelected = false
        }
        
    }
    
    func setScaleForLabel()
    {
        
        let runSecond = SKAction.scaleXTo(0.3, y: 1.0, duration: 0.0)
        self.label.runAction(runSecond)
        
        self.label.position = CGPoint(x:0  , y:5 )
        //self.label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Baseline;
        //self.label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center;
        
    }
    

    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if (!isEnabled) {
            return
        }
        
        isSelected = false
        
         let touch: AnyObject! = touches.first
        let touchLocation = touch.locationInNode(parent!)
        
        if (CGRectContainsPoint(frame, touchLocation) ) {
            
            if let act = actionTouchUpInside {
                callTarget(act)
            }
        }
        
        if let act = actionTouchUp {
            callTarget(act)
        }
    }
}