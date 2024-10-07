//
//  GameViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 29/6/2024.
//

import UIKit

class GameViewController: UIViewController {

    //inpus and outputs
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblLives: UILabel!
    @IBOutlet weak var lblRandomNumber1: UILabel!
    @IBOutlet weak var lblRandomNumber2: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    
    var lives: Int = 3 //number of lives
    var randomNumber1: Int = 0 //first randomly generated number
    var randomNumber2: Int = 0 //second randomly generated number
    
    
    @IBAction func btnSubmitAnswer(_ sender: Any) {
        if txtAnswer.text != "" { //existance check
            
            if Int(txtAnswer.text!) != nil { //type check
                
                
                var guess: Int = Int(txtAnswer.text!)! //Turing input into a variable
                var answer: Int = 0 //answer variable later used to compare the guess inputted and the actual answer, in order to receive a point or lose a life
                
                if gameType == "Addition" {
                    answer = randomNumber1 + randomNumber2 //formula
                    
                    if guess == answer {
                        score = score + 1 //gaining a point
                    } else if guess != answer {
                        lives = lives - 1 //losing a life
                    }
                }
                
                if gameType == "Subtraction" {
                        
                        answer = randomNumber1 - randomNumber2 //formula
                        
                        if guess == answer {
                            score = score + 1 //gaining a point
                        } else if guess != answer {
                            lives = lives - 1 //losing a life
                        }
                        
                    }
                
                
                lblErrorMessage.text = "" //clear lblErrorMessage
                lblScore.text = "\(score)" //display updated 'score' variable
                lblLives.text = "\(lives)" //display updated 'lives' variable
                
                /* Increase in difficulty depending on the players' score*/
                if score >= 0 && score < 10 {
                    randomNumber1 = Int.random(in: 1...10)
                    randomNumber2 = Int.random(in: 1...randomNumber1)
                } else if score >= 10 && score < 20 { //If score is within the range of 15 to 30, create randomly generated numbers between 10 and 100
                    randomNumber1 = Int.random(in: 10...100)
                    randomNumber2 = Int.random(in: 10...randomNumber1)
                } else if score >= 20 && score < 30 {
                    randomNumber1 = Int.random(in: 100...1000)
                    randomNumber2 = Int.random(in: 100...1000)
                } else {
                    randomNumber1 = Int.random(in: 1000...10000)
                    randomNumber2 = Int.random(in: 1000...10000)
                }
                
                
                lblRandomNumber1.text = "\(randomNumber1)" //display 'randomNumber1' on-screen
                lblRandomNumber2.text = "\(randomNumber2)" //display 'randomNumber1' on-screen
                
                var randomNumber1: Int = Int.random(in: 1...10) //starting number generator
                var randomNumber2: Int = Int.random(in: 1...10) //starting number generator
                
                txtAnswer.text = "" //clear text field
                
                if lives == 0 { //if lives are depleted then 'Move to ScoreboardViewController'
                    self.performSegue(withIdentifier: "gameToScoreboard", sender: self)
                }
                
            } else {
                lblErrorMessage.text = "Please enter an number" //display if type check is failed
            }
        } else {
            lblErrorMessage.text = "Please enter an answer" //display if existance check is failed
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSymbol.text = symbol.self //display symbol
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
