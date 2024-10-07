//
//  RegisterStudentViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 28/6/2024.
//

import UIKit

class RegisterStudentViewController: UIViewController {

    //Inputs and Outputs
    @IBOutlet weak var txtRegisterStudentInitials: UITextField!
    @IBOutlet weak var txtRegisterStudentPassword: UITextField!
    @IBOutlet weak var lblSystemMessage: UILabel!
    
    
    @IBAction func btnRegister(_ sender: Any) {
        
        if txtRegisterStudentInitials.text != "" && txtRegisterStudentPassword.text != "" { //existance check
                
            if txtRegisterStudentPassword.text != nil { //type check
                
                var initials: String = txtRegisterStudentInitials.text! //Turing input into a variable
                var password: String = txtRegisterStudentPassword.text!
                    //Turing input into a variable
                
                    var newStudent: StudentDetails = StudentDetails(intials: initials, password: cipherText(message: password, shift: 3)) //creating a new account
                    studentDetails.append(newStudent) //add the new account to the array of accounts
                    
                    saveStudentDetails() //save the array of accounts
                    
                    lblSystemMessage.text = "Successfully registered" //display the message to let the user know that all is successfully completed
                
                txtRegisterStudentInitials.text = "" //clear text field
                txtRegisterStudentPassword.text = "" //clear text field
                
            } else {
                lblSystemMessage.text = "Please enter a password"
            }
            
        } else {
            lblSystemMessage.text = "Please enter all fields" //display message if existance check fails
        }
        
    }
    
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.performSegue(withIdentifier: "backToLoginOrRegister", sender: self) //Move to LoginOrRegisterviewContoller
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
