import UIKit
//
//  ViewController.swift
//  Harry Potter
//
//  Created by ASDiMac5 on 14/03/22.
//

import UIKit

class MainBoardViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundCountingLabel: UILabel!
   
    
    
// guessNumber responds for guessing right number
    var guessNumber : Int = Int.random(in: 1...100)
    var score : Int = 0
    var round : Int = 1
    
    override func viewDidLoad() {
        let normalThumbImage = UIImage(named:"SliderThumb-Normal")
        let highlightedThumbImage = UIImage (named: "SliderThumb-Highlighter")
      
        slider.setThumbImage(normalThumbImage, for : .normal)
        slider.setThumbImage(highlightedThumbImage, for : .highlighted)
        
       setUp ()
        
    
    }

    @IBAction func didTapSelectButton(_ sender: Any) {
//        showResults()
      
        
        
        
        // 1. Read the number from slider
        let sliderValue : Float = slider.value

        // 2.Translate this number in Int = (sliderValueInt), in order to compare two whole numbers
        let sliderValueInt : Int = Int(sliderValue)

        // 3. Compare these numbers and if they resemble then they must be output in console the info about it
        let isValueEquals : Bool = sliderValueInt == guessNumber
        if isValueEquals {
            print ("The number is guessed")
            score = score + 1
            scoreLabel.text = String("score:\(score)")
        } else {
            print("The number is chosen\(sliderValueInt)")
        }
        round += 1
        roundCountingLabel.text = "Round : " + String(round)
        if round == 10 {
            showResults()
            setUp()
        }
         setUpGuessingNumber()
    }
    
    @IBAction func didTapRestartButton(_ sender: Any) {
        print("This restarButton is tapped")
        setUp()
    }
    
    func setUp() {
        // settings of game
        // 1. Setting the purpose of slider equals 50
        slider.value = 50
        
        
        // 2. Setting the number which will be guessed
        setUpGuessingNumber()
        taskLabel.textColor = .white
        
        // 3. Nullify the scores
        score = 0
        scoreLabel.text = "Score : " + String(score)
        scoreLabel.textColor = .white
        
        // Nulligy the round
        round = 0
        roundCountingLabel.text = "Round : " + String(round)
        
        
    }
    
    func setUpGuessingNumber() {
        guessNumber = Int.random(in: 1...100)
        taskLabel.text = "Try to guess number : \(guessNumber)"
    }
    
    
    func showResults() {
        // Creating Alert.
        
        let alert : UIAlertController = UIAlertController(title: " Results of game", message: "You earned \(score) scores", preferredStyle: .alert)
        
        // Creating button
        let okButton = UIAlertAction(title: "Start again", style: .default, handler: { _ in
            // Action of button
            print("New game")
            self.setUp()
        })
        
        // Added button
        alert.addAction(okButton)
          
        // Add button in alert
        present(alert,animated:true)
        
    }
}







 
