                                                              //
//  DragImg.swift
//  mylittlemonster
//
//  Created by Sagar Arora  on 5/16/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var OriginalPosition: CGPoint!
    var dropTarget: UIView?
    // a place where the original position can be stored.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        OriginalPosition = self.center
        // Takes the position where it is touched and stores it into a variable. (self.center is where it is touched)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
            // if there is a touch then store it in touch variable and then find that location where the touch is and store it in the position variable. Then set the center point equal to those coordinations of the position variable(position equals where the touch was).
            
            
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview)
            // If the target is dropped at this position then there will be a notification to the view controller and the observer can then call an action. They do this in this case so once this notification is recieved there wont be a skull.
            if CGRectContainsPoint(target.frame, position) {
                
            
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "OnTargetDropped", object: nil))
            }
            // If that point is at the point where the monster is send a notification!
        }
        
        self.center = OriginalPosition
        // The self.center as it is moved is equal to a different location so you need reset back to its original position which based on the touches begin is equal to whatever original positions is and original position is equal to the initial self.center when touches began.
        
    }
}

