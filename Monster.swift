//
//  Monster.swift
//  mylittlemonster
//
//  Created by Sagar Arora  on 5/16/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
 
   
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MonsterImg.littleOneSelected(_:)), name: "littleOneSelected", object: nil)
        // Action based on pressing this button calls the littleOneselectedFunction
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MonsterImg.OriginalMonsterSelected(_:)), name: "OriginalMonsterSelected", object: nil)
        // Action based on pressing originalMonsterbutton and calls originalOneSelectedFunction
    }
    
    var chosen: String!
    
    func littleOneSelected(notif: AnyObject) {
        
         chosen = "littleOne"
        playIdleAnimation()
        
        
    }
    
    func OriginalMonsterSelected(notif: AnyObject) {
        chosen = "Original"
        
        playIdleAnimation()
        
    }
    
    
    

    
  
    
    func playIdleAnimation () {
        self.image = UIImage(named: "Idle\(chosen)1.png")
        self.animationImages = nil 
        
        // Create an Array of the Images and Store each UI img into img and then add it to the array everytime and then
        // set equal  that array into the animationImages array.
        var ImgArray = [UIImage]()
        
        
        for x in 1...4 {
            
            let  img = UIImage(named: "Idle\(chosen)\(x).png")
            ImgArray.append(img!)
            
            
        }
        
        
        
        
        
        self.animationImages = ImgArray
        self.animationDuration =  0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        // All this code is for animating the monster!
        

      
        
        
    }
    
    func playDeathAnimation () {
       
        self.image = UIImage(named: "dead\(chosen)5.png")
        self.animationImages = nil
        
        var ImgDeadArray = [UIImage]()
        for x in 1...5 {
            let imgDead = UIImage(named: "dead\(chosen)\(x).png")
            ImgDeadArray.append(imgDead!)
        
        }
        
        self.animationImages = ImgDeadArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
        
        
    } 

}
