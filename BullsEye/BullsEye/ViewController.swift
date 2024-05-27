//
//  ViewController.swift
//  BullsEye
//
//  Created by Nicole Groeger on 2024-05-21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
                
        let title: String
        if difference == 0 { // if the user gets to the exact target
            title = "Perfect!"
            points += 100
        }
        else if difference < 5 { // if the difference is less than 5 away from the target
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10 { // if the difference is less than 10 away from the target
            title = "Pretty Good!"
        }
        else {
            title = "Not even close..." // if the user is too far from the target
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK", // action button text
            style: .default) { _ in
                self.startNewRound() // syntastic sugar added 
            }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

