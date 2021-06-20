//
//  ViewController.swift
//  Flaggy
//
//  Created by Terry Kuo on 2021/6/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    private var score = 0
    private var correctAnswer = 0
    private var questionsNumber = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
        askQuestion()
        updateScoreLabel()
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
        //print("Button Tapped!")
        //var title: String
        
        if sender.tag == correctAnswer {
            //title = "Correct"
            score += 1
            questionsNumber += 1
        } else {
            //title = "Wrong"
            score -= 1
            questionsNumber += 1
        }
        updateScoreLabel()
        askQuestion()
        
        if questionsNumber == 10 {
            let ac = UIAlertController(title: "Congrats!", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartQuestion))
            
            present(ac, animated: true, completion: nil)
        }
        
    }
    
    private func restartQuestion(action: UIAlertAction! = nil) {
        askQuestion()
        score = 0
        questionsNumber = 0
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


