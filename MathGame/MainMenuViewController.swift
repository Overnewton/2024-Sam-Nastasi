//
//  MainMenuViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 28/6/2024.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    //inputs and outputs
    @IBOutlet weak var segGameType: UISegmentedControl!
   
    let font: [AnyHashable : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]
   
    
    @IBAction func btnStartGame(_ sender: Any) {
        
        score = 0 //set score at 0
        
        if segGameType.selectedSegmentIndex == 0 { //first segment
            gameType = "Addition" //set gameType to addition
            symbol = "+" //display the '+' symbol in the GameViewController
        } else if segGameType.selectedSegmentIndex == 1 { //second segment
            gameType = "Subtraction" //set gameType to subtraction
            symbol = "-" //display the '-' symbol in the GameViewController
        }
        
        self.performSegue(withIdentifier: "startGameMove", sender: self) //move to GameViewScreen
    }
    
    @IBAction func btnViewScoreboard(_ sender: Any) {
        self.performSegue(withIdentifier: "viewScoreboardMove", sender: self) //move to ScoreboardViewScreen
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
       
        gameType = "" //reset gameType
        score = 0 //reset score
        
        self.performSegue(withIdentifier: "logOutMove", sender: self) //move to LoginOrRegisterViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .title2)], for: .normal)
        segGameType.frame.size.height = 50.0
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
