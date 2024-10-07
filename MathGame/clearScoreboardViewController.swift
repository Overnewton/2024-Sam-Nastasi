//
//  clearScoreboardViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 29/7/2024.
//

import UIKit

class clearScoreboardViewController: UIViewController {

   
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnClearScoreboard(_ sender: Any) {
        if txtPassword.text != "" {
            if txtPassword.text != nil {
                
                var password: String = txtPassword.text!
                
                if teacherCorrectPassword == password {
                    alertPopUp(title: "Delete All", message: "Do you want to delete the scoreboard?")
                    txtPassword.text = ""
                } else {
                    wrongPasswordPopUp(title: "Wrong Password", message: "If you want to clear the scoreboard, please enter the correct password")
                }
            }
        }
    }
    
    @IBAction func btnReturn(_ sender: Any) {
        self.performSegue(withIdentifier: "return", sender: self)
    }
    
    func alertPopUp(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default) { [self] action in
            if title == "Delete All" {
                highscore = []
                saveFile()
            }
        }
        let noButton = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func wrongPasswordPopUp(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [self] action in
            if title == "Wrong Password" {
                
            }
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
