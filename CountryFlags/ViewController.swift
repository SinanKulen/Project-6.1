//
//  ViewController.swift
//  CountryFlags
//
//  Created by Sinan Kulen on 2.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var timeAlert = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
    askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(scoreTapped))
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Country : \(countries[correctAnswer].uppercased()) Score : \(score)"
    }
   
    @IBAction func buttonTapped(_ sender: UIButton) {
       var title : String
        
        if timeAlert < 10 {
            if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            } else {
            title = "Wrong, Correct Answer is \(countries[correctAnswer].uppercased())"
            score -= 1
            }
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true, completion: nil)
            timeAlert += 1
            print(timeAlert)
        } else {
            let acc = UIAlertController(title: "Time is Finished", message: "Your score is \(score)", preferredStyle: .alert)
            acc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(acc, animated: true, completion: nil)
        }
        
        }
    
    @objc func scoreTapped(){
        let scoreAlert = UIAlertController(title: String(score), message: "Let continue", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: askQuestion(action:))
        scoreAlert.addAction(okButton)
        present(scoreAlert, animated: true, completion: nil)
        
        
    }
}

