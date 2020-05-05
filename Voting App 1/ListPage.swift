//
//  ListPage.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/27/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI

struct ListPage: View {
    @State var expand = false
    @ObservedObject var candidateProfiles = AppManager()
    @State var presidentName = String()
    let screenDelegate = SceneDelegate()
    var body: some View {
    // This is the screen after the user signs in
        // users can see all the candidates running and click on one of the pages
        NavigationView {
            VStack{
                Text("2020 Cate Election")
                    .font(.system (size: 40))
                    .padding()
                Spacer()
                
                VStack(alignment: HorizontalAlignment .trailing, content: {
                    HStack{
                        //drop down menu with more options
                        // **** gonna add to main screen in order to simplify project.
                        Text("Menu") //align to the trailing side
                            .fontWeight(.heavy)
                        Image(systemName: expand ? "chevron.up": "chevron.down" )
                            .resizable()
                            .frame(width: 13, height: 6)
                    }.onTapGesture{
                        self.expand.toggle()
                    }
                    if expand {
                        Button(action: {
                            print("I work here")
                        }) {
                            Text("Submit a debate Question")
                        }.foregroundColor(.black)
                        Button(action: {
                            print("This works")
                        }) {
                            Text(" Vote ")
                        }.foregroundColor(.black)
                    }
                })
                    // end of code for the menu
                    .padding()
                    .animation(.spring())
            
                VStack {
                    NavigationLink(destination: CandidatePage()) {
                        Text("Newbie")
                    }.onAppear() {
                self.candidateProfiles.presidentName = "Maya fenelon"
                        print (self.candidateProfiles.presidentName)
                        print("This is working up to this point !!!")
// I need to figure out how to store the "candidateProfiles.presidentName" variable so that it is changed on the next page. 
                    }
                    Spacer()
                    Button(action: { //FIx the whole button and navigationView thing
                        print("here?")
                        self.candidateProfiles.presidentName = "Lilly Zanze"
                        self.candidateProfiles.vicePresidentName = "Joshua Gabbay"
                        print(self.candidateProfiles.presidentName)
                        print(self.candidateProfiles.vicePresidentName)
                    }){
                        NavigationLink(destination: CandidatePage()){
                            Text("Zanze Gabbay link")
                        }
                        Text("Zanze nbjbhb Gabbay")
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        self.candidateProfiles.presidentName = "Rachel Wilkes"
                        self.candidateProfiles.vicePresidentName = "Esteban Paulino"
                        print(self.candidateProfiles.presidentName)
                        print(self.candidateProfiles.vicePresidentName)
                    }) {
                        NavigationLink(destination: CandidatePage()) {
                            Text("Wilkes Paulino")
                        }
                        
                    }
                    Spacer()
                    Button(action: {
                        self.candidateProfiles.presidentName = "Peter Coors"
                        self.candidateProfiles.vicePresidentName = "Asa Sam"
                        print(self.candidateProfiles.presidentName)
                        print("I kinda work")
                        print(self.candidateProfiles.vicePresidentName)
                    }) {
                        NavigationLink(destination: CandidatePage()) {
                            Text("Coors Sam")
                        }
                        
                    }
                    Spacer()
                }
            }
            //end of big v-stack
        }
            //end of navigation view
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage()
    }
}
