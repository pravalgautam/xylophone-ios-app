//
//  ViewController.swift
//  xylophone
//
//  Created by Praval Gautam on 26/12/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var  player: AVAudioPlayer?
//    let gradientLayer = CAGradientLayer()
//   gradientLayer.frame = view.bounds
//    gradientLayer.colors = [UIColor.systemGreen.cgColor
//    ,UIColor.systemPink.cgColor]
//    view.layer.addSublayer(gradientLayer)
//
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
//
     
       
    }
    @IBAction func keypressed(_ sender: UIButton) {
      
      //
      //  print ("keypressed")
       
         playSound(keyName: sender.currentTitle)
     
        
      
    }
    
    
    
    
    
    
    
    
    func playSound(keyName: String?) {
        guard let url = Bundle.main.url(forResource: keyName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}


