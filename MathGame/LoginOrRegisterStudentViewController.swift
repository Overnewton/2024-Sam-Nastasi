//
//  LoginOrRegisterStudentViewController.swift
//  MathGame
//
//  Created by Samuel Nastasi on 28/6/2024.
//

import UIKit

class LoginOrRegisterStudentViewController: UIViewController {


    @IBAction func btnLoginStudentMove(_ sender: UIButton) {
        self.performSegue(withIdentifier: "loginStudent", sender: self) //Move to StudentLoginViewController
    }
    
    
    @IBAction func btnDeleteScoreboard(_ sender: Any) {
        self.performSegue(withIdentifier: "deleteAll", sender: self)
    }
    
    
    @IBAction func btnRegisterNewStudent(_ sender: Any) {
        self.performSegue(withIdentifier: "registerStudent", sender: self)
        //Move to RegisterStudentViewController
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
