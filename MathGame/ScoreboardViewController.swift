//
//  ScoreboardViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 29/6/2024.
//

import UIKit

class ScoreboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //inputs and outputs
    @IBOutlet weak var tblScoreboard: UITableView!
    @IBOutlet weak var lblSystemMessage: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblGameType: UILabel!
    @IBOutlet weak var lblInitials: UILabel!
    
    @IBAction func btnAdd(_ sender: Any) {
        if addButtonCount == false && score != 0 { //required parameters to enable an entry to the array
            
            lblSystemMessage.text = "" //clear lblSystemMessage
            
            if gameType == "Addition" {
                var newScore: Scoreboard = Scoreboard(initialsScoreboard: lblInitials.text!, highscoreScoreboard: Int(lblScore.text!)!, addOrSub: "Addition") //addition version of new entry to the array
                highscore.append(newScore) //add to the array
            } else {
                var newScore: Scoreboard = Scoreboard(initialsScoreboard: lblInitials.text!, highscoreScoreboard: Int(lblScore.text!)!, addOrSub: "Subtraction") //subtraction version of new entry to the array
                highscore.append(newScore) //add to the array
            }
            
            tblScoreboard.reloadData() //refresh tblScoreboard
            
            if highscore.count <= 10{ //parameters for each sort function
                highscore = selectionSort(array: highscore) //if under 10 entries in the array, use selection sort
                tblScoreboard.reloadData() //refresh tblScoreboard
            } else {
                highscore = quickSort(array: highscore) //if over 10 entries in the array, use quick sort
                tblScoreboard.reloadData() //refresh tblScoreboard
            }
            
            addButtonCount = true //turn addButtonCount true
            
            saveFile() //save the array
            
            lblGameType.text = "" //reset lblGameType
            
            score = 0 //reset 'score' variable
            lblScore.text = "" //reset lblScore
            
            
            
        } else {
            lblSystemMessage.text = "Please play again to get a new score" //display is parameters are not met
        }
        
    }
    
    
    
    
    
    @IBAction func btnBackToMenu(_ sender: Any) {
        
        addButtonCount = false // reset 'addButtonCount'
        
        lblGameType.text = "" //reset lblGameType
        lblScore.text = "" //reset lblScore
        lblInitials.text = "" //reset lblInitials
        
        self.performSegue(withIdentifier: "backToMainMenu", sender: self) //move to MainMenuViewController
    }
    
    
   
    
    
    
    
  
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { //swipe to delete function
        
        if highscore.count <= 10 {
            if linearSearch(array: highscore, searchFor: lblInitials.text!) == true && lblInitials.text! == studentInitialsForScoreboard {
                if editingStyle == .delete {
                    highscore.remove(at: indexPath.row)
                    self.tblScoreboard.reloadData()
                    saveFile()
                }
            } else {
                alertPopUp(title: "Unable to Delete Highscore", message: "Unable to delete highscore as it is not your own :)")
            }
        } else {
            if binarySearch(array: highscore, searchFor: lblInitials.text!) == true && lblInitials.text! == studentInitialsForScoreboard {
                if editingStyle == .delete {
                    highscore.remove(at: indexPath.row)
                    self.tblScoreboard.reloadData()
                    saveFile()
                }
            } else {
                alertPopUp(title: "Unable to Delete Highscore", message: "Unable to delete highscore as it is not your own :)")
            }
        }
    }
    
    
    
    
    
    
    
    func quickSort(array: [Scoreboard]) -> [Scoreboard] { //quick sort funtion of highscores
        var less: [Scoreboard] = []
        var equal: [Scoreboard] = []
        var greater: [Scoreboard] = []
        if array.count > 1 {
            let pivot = array[array.count - 1]
            for x in array {
                if x.highscoreScoreboard > pivot.highscoreScoreboard {
                    greater.append(x)
                }
                if x.highscoreScoreboard == pivot.highscoreScoreboard {
                    equal.append(x)
                }
                if x.highscoreScoreboard < pivot.highscoreScoreboard {
                    less.append(x)
                }
            }
            return (quickSort(array: greater) + equal + quickSort(array: less))
        } else {
            return array
        }
    }
    
    func selectionSort(array: [Scoreboard]) -> [Scoreboard] { //selection sort of highscores
        if array.count > 1 {
            var arr = array
            for x in 0 ..< arr.count - 1 {
                var highest = x
                for y in x + 1 ..< arr.count {
                    if arr[y].highscoreScoreboard > arr[highest].highscoreScoreboard {
                        highest = y
                    }
                }
                if x != highest {
                    arr.swapAt(x, highest)
                }
            }
            return arr
        } else {
            return array
        }
    }
   
    
    
    
    
    
    
    func linearSearch(array: [Scoreboard], searchFor: String) -> Bool {
        for currentValue in array {
            if searchFor == currentValue.initialsScoreboard {
                return true
            }
        }
        return false
    }
    
    func binarySearch(array: [Scoreboard], searchFor: String) -> Bool {
        var firstIndex = 0
        var lastIndex = array.count - 1
        while firstIndex <= lastIndex {
            let middleIndex = ((firstIndex + lastIndex) / 2)
            if array[middleIndex].initialsScoreboard == searchFor {
                return true
            }
            if searchFor < array[middleIndex].initialsScoreboard {
                lastIndex = middleIndex - 1
            }
            if searchFor > array[middleIndex].initialsScoreboard {
                firstIndex = middleIndex + 1
            }
        }
        return false
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //determines the number of rows required in tableview
        return highscore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //populates values within tableview
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(highscore[indexPath.row].toString())
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        return cell
    }

   
    
    
    func alertPopUp(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [self] action in
            
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblScoreboard.dataSource = self
        tblScoreboard.delegate = self
        lblScore.text = "\(score)".self //fill lblScore with the score awarded to the student after their questions answered
        lblGameType.text = "\(gameType)".self //fill lblGameType with the gameType chosen
        lblInitials.text = "\(studentInitialsForScoreboard)".self //fill lblInitials with logged in students' initials
        loadFile() //load array
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
