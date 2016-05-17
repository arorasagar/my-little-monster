//
//  secondMonster.swift
//  mylittlemonster
//
//  Created by Sagar Arora  on 5/16/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import Foundation
import UIKit

class secondMonster: MonsterImg {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
   override func playIdleAnimation () {
        self.image = UIImage(named: "littleIdle1.png")
        self.animationImages = nil
        
        // Create an Array of the Images and Store each UI img into img and then add it to the array everytime and then
        // set equal  that array into the animationImages array.
        var ImgArray = [UIImage]()
        
        
        for x in 1...4 {
            
            let  img = UIImage(named: "littleIdle\(x).png")
            ImgArray.append(img!)
            
            
        }
        
        
        
        
        
        self.animationImages = ImgArray
        self.animationDuration =  0.8
        self.animationRepeatCount = 0
        self.startAnimating()
        // All this code is for animating the monster!
        
        
        
        
        
    }
    
  override  func playDeathAnimation () {
        self.image = UIImage(named: "littleDead5.png")
        self.animationImages = nil
        
        var ImgDeadArray = [UIImage]()
        for x in 1...5 {
            let imgDead = UIImage(named: "littleDead\(x).png")
            ImgDeadArray.append(imgDead!)
            
        }
        
        self.animationImages = ImgDeadArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
        
        
    } 
    
}
