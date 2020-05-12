//  CandidatePage.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/27/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.

import SwiftUI

struct CandidatePage: View {
    @ObservedObject var candidateProfiles: AppManager
    let topics = ["Bio", "Goals", "Promises"]
    var email = ""
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    VStack//(alignment: HorizontalAlignment.leading)
                        { //align it to the "trailing" side
                            Button(action: {
                                print("I matched")
                                //ERROR HERE
                                /*if self.email == self.candidateProfiles.specialAcess{
                                 print("I matched")
                                 }*/
                            }) {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 40.0, height: 40.0)
                                        .foregroundColor(.white)
                                        .border(Color.black, width: 2)
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 30.0, height: 30.0)
                                    
                                }
                                
                            }
                            
                    }
                    HStack{
                        ForEach(0..<2) {_ in
                            VStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100.0, height: 150.0)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle() .stroke(Color.white, lineWidth: 5)
                                        
                                ).padding(.horizontal, 30)
                            }
                        }
                    }
                    HStack{
                        VStack(alignment: HorizontalAlignment .center){
                            Text(self.candidateProfiles.presidentName)
                            
                        }.padding(.horizontal)
                        
                        VStack(alignment: HorizontalAlignment .center){                            Text(self.candidateProfiles.vicePresidentName)
                        }.padding(.horizontal)
                    }.onAppear(){
                        var presidentName = self.candidateProfiles.presidentName
                        print(self.candidateProfiles.presidentName)
                        var vicePresidentName = self.candidateProfiles.vicePresidentName
                        print(self.candidateProfiles.vicePresidentName)
                        print("I appeared & working")
                        
                    }
                    .padding()
                    Spacer()
                    
                    //start of code for editing info 
                    VStack{
                        ForEach(0..<topics.count){
                            Text(self.topics[$0])
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .frame(width: 400)
                                .background(Color.white)
                                .padding(.bottom)
                            Text(self.candidateProfiles.details[$0])//something is wrong here (acts up when i do $0 (says its out of range which doesnt make sense)but i need it to change like the topics above ")
                                //the text will change like the names
                                .frame(width: 370)
                                .padding()
                                .border(Color.black, width: 3)
                                .padding(.bottom)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct CandidatePage_Previews: PreviewProvider {
    static var previews: some View {
        CandidatePage(candidateProfiles: AppManager()) 
    }
}
