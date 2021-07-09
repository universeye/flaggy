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
    
    private let animatedLabel = AnimatedLabel()
    private let logic = Logic()
    
    private var score = 0
    private var correctAnswer = 0
    private var questionsNumber = 1
    
    private let bgImage = UIImageView()
    //MARK: - App lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBGImage()
        configureButton()
        askQuestion()
        updateScoreLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(animatedLabel)
    }
    
    
    
    //MARK: - function
    private func updateScoreLabel() {
        scoreLabel.text = "Your score: \(score)  (\(questionsNumber)/10)"
        
    }
    
    
    
    private func askQuestion(action: UIAlertAction! = nil) {
        
        logic.countries.shuffle()
        button1.setImage(UIImage(named: logic.countries[0]), for: .normal)
        button2.setImage(UIImage(named: logic.countries[1]), for: .normal)
        button3.setImage(UIImage(named: logic.countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = logic.countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            score += 1
            logic.showAnimateLabel(when: .correct, label: animatedLabel)
            askQuestion()
        } else {
            score -= 1
            logic.showAnimateLabel(when: .wrong, label: animatedLabel)
            let ac = UIAlertController(title: "Wrong!", message: "That's \(logic.countries[sender.tag].uppercased())", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: askQuestion(action:)))
            
            present(ac, animated: true, completion: nil)
        }
        
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
    
    private func restartQuestion(action: UIAlertAction! = nil) {
        askQuestion()
        score = 0
        questionsNumber = 1
        updateScoreLabel()
    }
    
    private func configureButton() {
        button1.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderColor = UIColor.white.cgColor
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }
    
    
    private func configureBGImage() {
        view.addSubview(bgImage)
        view.sendSubviewToBack(bgImage)
        bgImage.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        bgImage.contentMode = .scaleToFill
        bgImage.image = UIImage(named: "BG1")
        bgImage.center = view.center
    }
    
}


