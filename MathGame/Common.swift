//
//  Common.swift
//  MathGame
//
//  Created by Samuel Nastasi on 29/6/2024.
//

import Foundation
/* TeacherLoginViewController */
let teacherCorrectPassword: String = "Elephant" //set password for teachers

//----------------------------------------
/* ScoreboardViewController */
var addButtonCount: Bool = false //Limits players from adding multiple inputs to the array

//----------------------------------------
/* MainMenuViewController & GameViewController & ScoreboardViewController */
var gameType: String = "" //determines whether the game is Addition or Subtraction

var studentInitialsForScoreboard: String = "" //takes the login user's initials and uses it for the scoreboard

var symbol: String = "" //'-' or '+'

var score: Int = 0 //player's score which increases by 1 when a math question is answered correctly

//---------------------------------------
/* RegisterStudentViewController & StudentLoginViewController */

struct StudentDetails: Codable { //structure to store all reading details
    var intials: String
    var password: String
}

var studentDetails: [StudentDetails] = [] //collection of all reading entries

//---------------------------------------

//structure to store all scoreboard details
struct Scoreboard: Codable {
    var initialsScoreboard: String
    var highscoreScoreboard: Int
    var addOrSub: String
    
    func toString() -> String { //array input format
        return "Initials: \(initialsScoreboard) | Score: \(highscoreScoreboard) | Game Type: \(addOrSub)"
    }
}

var highscore: [Scoreboard] = [] //collection of all highscore entries

func saveFile() { //save scoreboard function
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
       let encoder = JSONEncoder()
       encoder.outputFormatting = .prettyPrinted
       let jsonData = try! encoder.encode(highscore)
       let jsonString: String = String(data: jsonData, encoding: .utf8)!
       let jsonURL: URL = URL(fileURLWithPath: "highscore.json", relativeTo: directoryURL)
       try jsonString.write(to: jsonURL, atomically: true, encoding: .utf8)
       print("file was successfully exported")
    } catch {
       print("File could not be exported: \(error.localizedDescription)")
    }
}

func loadFile() { //load scoreboard function
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
       let decoder = JSONDecoder()
       let jsonURL = URL(fileURLWithPath: "highscore.json", relativeTo: directoryURL)
       let jsonData = try Data(contentsOf: jsonURL)
        highscore = try decoder.decode([Scoreboard].self, from: jsonData)
       print("json file was successfully imported")
    } catch {
        print("File could not be imported: \(error.localizedDescription)")
    }
}

//---------------------------------------

func saveStudentDetails() { //save function for all student accounts
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
       let encoder = JSONEncoder()
       encoder.outputFormatting = .prettyPrinted
       let jsonData = try! encoder.encode(studentDetails)
       let jsonString: String = String(data: jsonData, encoding: .utf8)!
       let jsonURL: URL = URL(fileURLWithPath: "studentDetails.json", relativeTo: directoryURL)
       try jsonString.write(to: jsonURL, atomically: true, encoding: .utf8)
       print("file was successfully exported")
    } catch {
       print("file could not be exported")
    }
}

func loadStudentDetails() { //load function for all student accounts
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    print(directoryURL)
    do {
       let decoder = JSONDecoder()
       let jsonURL = URL(fileURLWithPath: "studentDetails.json", relativeTo: directoryURL)
       let jsonData = try Data(contentsOf: jsonURL)
       studentDetails = try decoder.decode([StudentDetails].self, from: jsonData)
       print("json file was successfully imported")
    } catch {
       print("file could not be imported")
    }
}

func cipherText(message: String, shift: Int) -> String { // cipher text/encryption function
    let encrypt = message.unicodeScalars.map {
        //loop through each character in message
        //identify number representation
        //add shift to number
        UnicodeScalar(Int($0.value) + shift)!
    }
    return String(String.UnicodeScalarView(encrypt))
}


