//
//  Logic.swift
//  Flaggy
//
//  Created by Terry Kuo on 2021/6/23.
//

import UIKit
import AVFoundation


enum plusOrMinus {
    case correct
    case wrong
}


class Logic {
    
    var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var player: AVAudioPlayer?
    
    func showAnimateLabel(when correctOrNot: plusOrMinus, label: UILabel) {
        
        switch correctOrNot {
        case .correct:
            label.text = "+1"
            
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                label.alpha = 1
                label.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                label.center = CGPoint(x: 240, y: 110)
            }, completion: nil)
        case .wrong:
            playSound()
            label.text = "-1"
            
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                label.alpha = 1
                label.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                label.center = CGPoint(x: 240, y: 150)
            }, completion: nil)
        }
        print("animation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.8, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                label.alpha = 0
                label.transform = CGAffineTransform(scaleX: 0, y: 0)
                label.center = CGPoint(x: 230, y: 130)
                //self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "erro", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
