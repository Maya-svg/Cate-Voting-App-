//
//  ContentView.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/13/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI
import GoogleSignIn

// This the first page the user sees after the app loads

struct FirstView: View{
    @ObservedObject var candidateProfiles = AppManager() 
    @State var studentEmail = ""
    @State var name = ""
    
    var body: some View{
        NavigationView {
            VStack{
                
                Text("Cate Sign-In")
                    .font(.system (size: 50))
                HStack{
                    Spacer()
                    Image("google")
                        .resizable()
                        .frame(maxWidth: 40, maxHeight: 40)
                    
                    //This is where the students signin with their cate usernames
                    TextField("Log-In with Email", text: $studentEmail, onCommit: {
                        if self.studentEmail == "" {
                            self.studentEmail = " (Type Something)"
                        }else {
                            self.candidateProfiles.email = self.studentEmail
                            print(self.candidateProfiles.email)
                            
                            // send name to get verified
                            //i dont think this works
                        }
                    })
                        .font(.system (size: 30))
                        .border(Color.black, width: 2)
                        .aspectRatio(30, contentMode: .fit)
                        .frame(maxWidth: 350, maxHeight: 150)
                    Spacer()
                }
                
                NavigationLink(destination: ListPage(candidateProfiles: AppManager())) { Text("Travel to the Next Page") } //end of navigation link
            }
        } // end of navigationView
    }
}
// after successfully logining in - the use will be take to the list page 

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}


