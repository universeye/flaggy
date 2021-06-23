//
//  ViewController.swift
//  Flaggy
//
//  Created by Terry Kuo on 2021/6/16.
//

import UIKit

enum plusOrMinus {
    case correct
    case wrong
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private let animatedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    private var score = 0
    private var correctAnswer = 0
    private var questionsNumber = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
        askQuestion()
        updateScoreLabel()
        
        view.addSubview(animatedLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animatedLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animatedLabel.center = CGPoint(x: 230, y: 130)
        animatedLabel.alpha = 0
        animatedLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "Your score: \(score)  (\(questionsNumber)/10)"
        
    }
    
    private func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            score += 1
            showAnimateLabel(when: .correct)
        } else {
            score -= 1
            showAnimateLabel(when: .wrong)
        }
        
        askQuestion()
        
        if questionsNumber <= 9 {
            questionsNumber += 1
            updateScoreLabel()
        } else {
            updateScoreLabel()
            let ac = UIAlertController(title: "Congrats!", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartQuestion))
            
            present(ac, animated: true, completion: nil)
        }
        
    }
    
    private func showAnimateLabel(when: plusOrMinus) {
        
        switch when {
        
        case .correct:
            animatedLabel.text = "+1"
            
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.animatedLabel.alpha = 1
                self.animatedLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                self.animatedLabel.center = CGPoint(x: 240, y: 110)
            }, completion: nil)
        case .wrong:
            animatedLabel.text = "-1"
            
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.animatedLabel.alpha = 1
                self.animatedLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                self.animatedLabel.center = CGPoint(x: 240, y: 150)
            }, completion: nil)
        }
        print("animation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.animatedLabel.alpha = 0
                self.animatedLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
                self.animatedLabel.center = CGPoint(x: 230, y: 130)
                //self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    private func restartQuestion(action: UIAlertAction! = nil) {
        askQuestion()
        score = 0
        questionsNumber = 1
        updateScoreLabel()
    }
    
    private func configureButton() {
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }
    
    
}


