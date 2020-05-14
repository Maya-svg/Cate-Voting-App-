//
//  ListPage.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/27/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI

struct ListPage: View {
    
    @ObservedObject var candidateProfiles:  AppManager
    @State var presidentName = String()
    @State private var presentMe = false
    @State private var presentMeToo = false
    @State var askHere = ""
    @State private var showingSheet = false
    @State var score = 0
    
    var body: some View {
        ZStack{
            Spacer() 
            NavigationView {
                VStack{
                    NavigationLink(destination: CandidatePage(candidateProfiles: candidateProfiles), isActive: $presentMeToo) { EmptyView() }
                    Button(action: {
                        self.presentMeToo = true
                        self.candidateProfiles.presidentName = "Lilly Zanze"
                        self.candidateProfiles.vicePresidentName = "Joshua Gabbay"
                        print("I showed Lilly & Josh")
                        // your page's context details are set here
                        self.candidateProfiles.details[0] = self.candidateProfiles.bio[0]
                        self.candidateProfiles.details[1] = self.candidateProfiles.goals[0]
                        self.candidateProfiles.details[2] = self.candidateProfiles.promises[0]
                    }, label: {
                        Text("Zanze Gabbay")
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: CandidatePage(candidateProfiles: candidateProfiles)){
                        Text("Wilkes Paulino")
                    }.onAppear(){
                        
                        self.candidateProfiles.presidentName = "Rachel Wilkes"
                        self.candidateProfiles.vicePresidentName = "Esteban Paulino"
                        self.candidateProfiles.details[0] = self.candidateProfiles.bio[1]
                        self.candidateProfiles.details[1] = self.candidateProfiles.goals[1]
                        self.candidateProfiles.details[2] = self.candidateProfiles.promises[1]
                        print("I showed Rachel W. & Esteban")
                    }
                    Spacer()
                    
                    NavigationLink(destination: CandidatePage(candidateProfiles: candidateProfiles), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.presentMe = true
                        
                        self.candidateProfiles.presidentName = "Peter Coors"
                        self.candidateProfiles.vicePresidentName = "Asa Sam"
                        // coul i just create an array of the canddates and have ut increase --- kinda like below
                        self.candidateProfiles.details[0] = self.candidateProfiles.bio[2]
                        self.candidateProfiles.details[1] = self.candidateProfiles.goals[2]
                        self.candidateProfiles.details[2] = self.candidateProfiles.promises[2]
                        print("I showed Asa Sam & Coors")
                    }, label: {
                        Text("Coors Sam")
                    })
                    //Spacer()
                    
                    HStack{
                        //add one question box here and one on each page??
                        TextField("   Submit A Debate Question", text: $askHere, onCommit: {
                            if self.askHere == "" {
                                self.askHere = " No Question Submitted "
                            }else {
                                print("good")
                                self.candidateProfiles.questions.append(self.askHere)
                                self.askHere = ""
                                
                            }
                        })
                        Button(action: {
                            self.candidateProfiles.questions.append(self.askHere)
                            print(self.candidateProfiles.questions)
                            self.askHere = "" 
                        }) {
                            Image(systemName: "paperplane")
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40)
                                .padding(8)
                        }
                    }
                    .border(Color.black, width: 2)
                    .frame(maxWidth: 600, maxHeight: 160)
                    .padding(.horizontal, 10) 
                }//end of big v-stack
                    
                    .navigationBarTitle(Text(" Election Candidates"))
                    
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.score += 1
                            if self.score == 1{
                                print("I'm on my way to vote")
                                self.showingSheet.toggle()
                                print("I showed the sheet")
                                
                            }else{
                                print("already voted")
                            }
                        }) {
                            Text("Vote")
                        }
                        .sheet(isPresented: $showingSheet){
                            Vote()
                        }
                )
            } //end of navigation view
        }
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage(candidateProfiles: AppManager())
    }
}
