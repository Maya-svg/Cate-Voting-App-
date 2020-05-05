//
//  AppManager.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/20/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import Foundation
import  GoogleSignIn

class AppManager: ObservableObject {
    @Published  var bio = "Please Add Your Information"
    @Published  var goals = "Please Add Your Information"
    @Published var promises = "Please Add Your Information"
    @Published var presidentName = "First Name, Last Name"
    @Published  var vicePresidentName = "First Name, Last Name"
}
