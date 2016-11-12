//
//  ViewController.swift
//  omikuziApp
//
//  Created by nowall on 2016/11/12.
//  Copyright © 2016年 nakagami. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation


class ViewController: UIViewController {
    
    
    // 加速度センサーを使うためのオブジェクトを格納します。
    let motionManager: CMMotionManager = CMMotionManager()
    
    // iPhoneを振った音を出すための再生オブジェクトを格納します。
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    // ボタンを押した時の音を出すための再生オブジェクトを格納します。
    var startAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    // アプリで使用する音の準備
    func setupSound() {
        // ボタンを押した時の音を設定します。
        if let sound = Bundle.main.path(forResource: "紅だあああ", ofType: ".m4a") {
            startAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            startAudioPlayer.prepareToPlay()
        }
        
        // iPhoneを振った時の音を設定します。
        if let sound = Bundle.main.path(forResource: "紅だあああ", ofType: ".m4a") {
            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            audioPlayer.prepareToPlay()
        }
    }
    
    
    
    
    
    @IBOutlet weak var stickLabel: UILabel!
    @IBOutlet weak var stickView: UIView!
    @IBOutlet weak var stickHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var omikujiHeadLayout: NSLayoutConstraint!
    @IBOutlet weak var overView: UIView!
    
    
    @IBOutlet weak var bigLabel: UILabel!
    /*
     
     @IBOutlet weak var stickView: UIView!
     @IBOutlet weak var stickLabel: UILabel!
     @IBOutlet weak var stickHeight: NSLayoutConstraint!
     @IBOutlet weak var stickBottomMargin: NSLayoutConstraint!
     
     */
    
    let resultTextArray: [String] = [
        "紅だあああ",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // 音の準備
        setupSound()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        startAudioPlayer.play()
        
        UIView.animate(withDuration: 4.0, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: { (finished: Bool) in
            self.bigLabel.text = self.stickLabel.text
            self.overView.isHidden = false
        })
        
        
        
        if motion != UIEventSubtype.motionShake || overView.isHidden {
            return
        }
        
        let resultNum = Int( arc4random_uniform(UInt32(resultTextArray.count)))
        stickLabel.text = resultTextArray[resultNum]
        omikujiHeadLayout.constant = stickHeightLayout.constant * -1
        
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }, completion:{ (finished:Bool)in
        })
        
    }
    
    
    
    @IBAction func tapRetry(_ sender: Any) {
        
        overView.isHidden = true
        omikujiHeadLayout.constant = 0    }
}





