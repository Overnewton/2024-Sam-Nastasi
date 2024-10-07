//
//  StudentLoginViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 28/6/2024.
//

import UIKit

class StudentLoginViewController: UIViewController {

    //inputs and outputs
    @IBOutlet weak var txtStudentLoginInitials: UITextField!
    @IBOutlet weak var txtStudentLoginPassword: UITextField!
    @IBOutlet weak var lblSystemMessage: UILabel!
    
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.performSegue(withIdentifier: "backToLoginOrRegister1", sender: self) //Move to LoginOrRegisterviewContoller
    }
    
    @IBAction func btnStudentLogin(_ sender: Any) {
        if txtStudentLoginInitials.text != "" && txtStudentLoginPassword.text != "" { //existance check
            
            studentInitialsForScoreboard = txtStudentLoginInitials.text! //updating variable with the student's login initials
            
            var initials: String = txtStudentLoginInitials.text! //Turing input into a variable
            var password: String = cipherText(message: txtStudentLoginPassword.text!, shift: 3)
            //Turing input into a variable
            //Password is cipered/encrypted for security purposes
            
            
            
            if studentDetails.count <= 10 { //if the number of inputs in the array is 'equal to' or 'less than' 10, use a linear search
                
                if linearSearchInitials(array: studentDetails, searchFor: initials) == true && linearSearchPassword(array: studentDetails, searchFor: password) == true { //searching to see if the data inputted matches with an existing account
                   
                    self.performSegue(withIdentifier: "mainMenuMove", sender: self) //Move to MainMenuViewController
                    
                } else {
                    
                    lblSystemMessage.text = "Your initials and password do not match. Please try again." //display message if the search is unsuccessful
                }
                
            } else { //if greater than 10 inputs in the array, use a binary search
                
                if binarySearchInitials(array: studentDetails, searchFor: initials) == true && binarySearchPassword(array: studentDetails, searchFor: password) == true { //searching to see if the data inputted matches with an existing account
                   
                    self.performSegue(withIdentifier: "mainMenuMove", sender: self) //Move to MainMenuViewController
                    
                } else {
                    lblSystemMessage.text = "Your initials and password do not match. Please try again." //display message if the search is unsuccessful
                }
                
            }
            
        } else {
            lblSystemMessage.text = "Please enter all fields" //display message if existance check fails
        }
    
    }
    
    func linearSearchInitials(array: [StudentDetails], searchFor: String) -> Bool { //linear search for initals
        for currentValue in array {
            if searchFor == currentValue.intials {
              return true
           }
        }
        return false
     }
    
    func binarySearchInitials(array: [StudentDetails], searchFor: String) -> Bool { //binary search for initals
       var firstIndex = 0
       var lastIndex = array.count - 1
       while firstIndex <= lastIndex {
          let middleIndex = (firstIndex + lastIndex) / 2
           if array[middleIndex].intials == searchFor {
             return true
          }
           if searchFor < array[middleIndex].intials {
             lastIndex = middleIndex - 1
          }
           if searchFor > array[middleIndex].intials {
             firstIndex = middleIndex + 1
          }
       }
       return false
    }
    
    
    
    
    func linearSearchPassword(array: [StudentDetails], searchFor: String) -> Bool { //linear search for password
        for currentValue in array {
            if searchFor == currentValue.password {
              return true
           }
        }
        return false
     }
    
    func binarySearchPassword(array: [StudentDetails], searchFor: String) -> Bool { //binary search for password
       var firstIndex = 0
       var lastIndex = array.count - 1
       while firstIndex <= lastIndex {
          let middleIndex = (firstIndex + lastIndex) / 2
           if array[middleIndex].password == searchFor {
             return true
          }
           if searchFor < array[middleIndex].password {
             lastIndex = middleIndex - 1
          }
           if searchFor > array[middleIndex].password {
             firstIndex = middleIndex + 1
          }
       }
       return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStudentDetails() //load array of student accounts
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
