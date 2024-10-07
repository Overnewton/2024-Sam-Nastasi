//
//  TeacherLoginViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 28/6/2024.
//

import UIKit

class TeacherLoginViewController: UIViewController {
    
    //inputs and outputs
    @IBOutlet weak var txtTeacherUsername: UITextField!
    @IBOutlet weak var txtTeacherPassword: UITextField!
    @IBOutlet weak var lblSystemMessage: UILabel!
    
    @IBAction func btnTeacherLogin(_ sender: Any) { //Login button on TeacherLoginViewController screen
        
        lblSystemMessage.text = "" //reset lblSystemMessage
        
        if txtTeacherUsername.text != "" && txtTeacherPassword.text != "" { //existance check
            if teacherCorrectPassword == txtTeacherPassword.text { //if the set password equals the inputted password
                self.performSegue(withIdentifier: "studentSelect", sender: self) //move to LoginOrRegisterViewController screen
            } else {
                lblSystemMessage.text = "Please enter the correct password" //display this message with lblSystemMessage
            }
        } else {
            lblSystemMessage.text = "Please enter all fields above" //display this message with lblSystemMessage
        }
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
