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
        playIdleAnimation ()
    }
    
    func playIdleAnimation () {
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil 
        
        // Create an Array of the Images and Store each UI img into img and then add it to the array everytime and then
        // set equal  that array into the animationImages array.
        var ImgArray = [UIImage]()
        
        
        for x in 1...4 {
            
            let  img = UIImage(named: "idle\(x).png")
            ImgArray.append(img!)
            
            
        }
        
        
        
        
        
        self.animationImages = ImgArray
        self.animationDuration =  0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        // All this code is for animating the monster!
        

      
        
        
    }
    
    func playDeathAnimation () {
       
        self.image = UIImage(named: "animationProperty")
        self.animationImages = nil
        
        var ImgDeadArray = [UIImage]()
        for x in 1...5 {
            let imgDead = UIImage(named: "dead\(x).png")
            ImgDeadArray.append(imgDead!)
        
        }
        
        self.animationImages = ImgDeadArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
        
        
    } 

}
