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
    
    var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
        askQuestion()
    }
    
    func askQuestion() {
        let number = Int.random(in: 0..<countries.count)
        button1.setImage(UIImage(named: countries[number]), for: .normal)
        
        button2.setImage(UIImage(named: countries[number]), for: .normal)
        button3.setImage(UIImage(named: countries[number]), for: .normal)
    }
    
    func configureButton() {
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }

}


