//
//  ViewController.swift
//  mylittlemonster
//
//  Created by Sagar Arora  on 5/15/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    @IBOutlet weak var penalty3: UIImageView!
    @IBOutlet weak var penalty2: UIImageView!
    @IBOutlet weak var penalty1: UIImageView!
    @IBOutlet weak var Monster : MonsterImg!
    @IBOutlet weak var HeartImg: DragImg!
    @IBOutlet weak var FoodImg: DragImg!
    @IBOutlet weak var LittleMonster : MonsterImg!
    @IBOutlet weak var MonsterBtn: UIButton!
    @IBOutlet weak var LittleOneBtn: UIButton!
  
    @IBOutlet weak var BeginningImageView: UIImageView!
    @IBOutlet weak var restartBtn: UIButton!
    // They are all type of a certain class 
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var currentPenalties = 0
    var Timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!

    
    @IBAction func onLittleOnePressed(sender: AnyObject) {
        BeginningImageView.hidden = true
        MonsterBtn.hidden = true
        LittleOneBtn.hidden = true
        Monster.hidden = true
        restartGame()
        restartBtn.hidden = true
        
     
    }
    @IBAction func onMonsterBtnPressed(sender: AnyObject) {
        BeginningImageView.hidden = true
        LittleOneBtn.hidden = true
        MonsterBtn.hidden = true
        LittleMonster.hidden = true
        restartGame()
        restartBtn.hidden = true
    }
    
    @IBAction func onRestartBtnPressed(sender: AnyObject) {
        restartGame()
        restartBtn.hidden = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodImg.dropTarget = Monster
        HeartImg.dropTarget = Monster
        penalty1.alpha = DIM_ALPHA
        penalty2.alpha = DIM_ALPHA
        penalty3.alpha = DIM_ALPHA
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "OnTargetDropped", object: nil)
        do {
                
                 try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            
                try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
                try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
                try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
                try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            // Setting all the audio variables above equal to the sound.wav and .mp3 files accordingly 
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            
            
        } catch let err as NSError  {
            print(err.debugDescription)
                
                
            
        }
        
        
        
        
        StartTimer()
        
      
      
        
                   
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        StartTimer()
        
        if currentItem == 0 {
            sfxHeart.play()
            
        
        } else {
            
            sfxBite.play()
        }
        
        
       
        
        FoodImg.alpha = DIM_ALPHA
        FoodImg.userInteractionEnabled = false
        HeartImg.alpha = DIM_ALPHA
        HeartImg.userInteractionEnabled = false
        
    }
    
    func StartTimer()  {
        if Timer != nil {
            Timer.invalidate()
            
        }
        
        Timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.ChangeGameState), userInfo: nil , repeats: true)
    }
    func gameOver() {
        
        Timer.invalidate()
        LittleMonster.playDeathAnimation()
        Monster.playDeathAnimation()
        sfxDeath.play()
        restartBtn.hidden = false
        FoodImg.alpha = DIM_ALPHA
        FoodImg.userInteractionEnabled = false
        HeartImg.alpha = DIM_ALPHA
        HeartImg.userInteractionEnabled = false

      
        
    }
    
    func ChangeGameState() {
        
        if !monsterHappy {
            
            currentPenalties += 1
            sfxSkull.play()
            
            if currentPenalties == 1 {
                penalty1.alpha = OPAQUE
                penalty2.alpha = DIM_ALPHA
                penalty3.alpha = DIM_ALPHA
               
                
            }
            else if currentPenalties == 2 {
                penalty2.alpha = OPAQUE
                penalty3.alpha = DIM_ALPHA
                
                
            }
            else if currentPenalties >= 3 {
                penalty3.alpha = OPAQUE
                
                
            }
                
            else {
                
                penalty3.alpha = DIM_ALPHA
                penalty2.alpha = DIM_ALPHA
                penalty1.alpha = DIM_ALPHA
                
            }
            
            if currentPenalties >= MAX_PENALTIES {
                gameOver()
                
            }
        }
            
            let rand = arc4random_uniform(2) // 0 and 1 Give me a random range between two numbers(starts at 0 so 0 or 1)
            
            if rand == 0 {
                
                FoodImg.alpha = DIM_ALPHA
                FoodImg.userInteractionEnabled = false
                HeartImg.alpha = OPAQUE
                HeartImg.userInteractionEnabled = true
                
                
                
            } else {
                
              FoodImg.alpha = OPAQUE
              FoodImg.userInteractionEnabled = true
              HeartImg.alpha = DIM_ALPHA
              HeartImg.userInteractionEnabled = false
                
                
                
            }
            
            currentItem = rand
            monsterHappy = false
            
            
            
        }
    
    func restartGame() {
        currentPenalties = 0
        monsterHappy = false
        Monster.playIdleAnimation()
        LittleMonster.playIdleAnimation()
        StartTimer()
        FoodImg.alpha = OPAQUE
        FoodImg.userInteractionEnabled = true
        penalty3.alpha = DIM_ALPHA
        penalty2.alpha = DIM_ALPHA
        penalty1.alpha = DIM_ALPHA
        
        
        
        
        
    }
    
      
        
        
    }
    








