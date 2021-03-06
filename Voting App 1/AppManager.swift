//
//  AppManager.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/20/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.

import Foundation
import  GoogleSignIn

class AppManager: ObservableObject {
    
    var details = ["Bio Details", "Goals Details", "Promises Details"]
    
    @Published  var bio = ["Candidate1 bio ", "Candidate2 bio", "Candidate 3"]
    @Published  var goals = ["Candidate1 goals", "Candidate2 goals", "Candidate 3"]
    @Published var promises = ["Candidate1 promises", "Candidate2 promises", "Candidate 3"] 
    
    @Published var presidentName = "First Name, Last Name"
    @Published  var vicePresidentName = "First Name, Last Name"
    
    @Published var questions = [ ]
    // store questions on the server
    
    @Published var email = ""
    
    @Published var specialAcess = [
        "Lilly_Zanze@cate.org",
         "Joshua_Gabbay@cate.org",
         "Rachel_Wilkes@cate.org",
         "Estaban_Paulino@cate.org",
         "Peter_Coors@cate.org",
         "Asa_Sam@cate.org"
    ] //should i move this to the server?? -- or it could be added to the google sign in code 
}
