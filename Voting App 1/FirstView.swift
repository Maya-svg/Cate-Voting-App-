//
//  ContentView.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/13/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI
import GoogleSignIn


struct FirstView: View{
    // let appManager = AppManager()
    @State var studentEmail = "" 
    var body: some View{
        VStack{
            Text("Cate Sign-In")
                .font(.system (size: 50))
            HStack{
                Spacer()
                Image("google")
                    .resizable()
                    .frame(maxWidth: 40, maxHeight: 40)
                TextField("Log-In with Email", text: $studentEmail, onCommit: {
                    if self.studentEmail == "" { //if nothing is typed then user is told to type something
                        self.studentEmail = " (Type Something)"
                    }else {
                        print("good")
                        // send name to get verified 
                    }
                })
                    .font(.system (size: 30))
                    .border(Color.black, width: 2)
                    .aspectRatio(30, contentMode: .fit)
                    .frame(maxWidth: 350, maxHeight: 150)
                Spacer()
            }
        }
    }
}
// after successfully logining in - the use will be take to the list page 

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}


