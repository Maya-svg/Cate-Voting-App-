//  CandidatePage.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 4/27/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.

import SwiftUI

struct CandidatePage: View {
    //@Published  var bio = "Please Add Your Information"
//    @Published  var goals = "Please Add Your Information"
  //  @Published var promises = "Please Add Your Information"

    @ObservedObject var candidateProfiles = AppManager()
    let topics = ["Bio", "Goals", "Promises"]
    
    @State private var mainTopic = "Bio"
    
    // where can I put this: let content = ["\(self.candidateProfiles.bio)","\(self.candidateProfiles.goals)","\(self.candidateProfiles.promises)"] ?
 
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
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
                                )
                                Text(self.candidateProfiles.presidentName)
                            }.onAppear(){
                                var presidentName = self.candidateProfiles.presidentName
                                print("I appeared & working")
                                print("here is the name of the president")
                                print(self.candidateProfiles.presidentName)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                    
                    VStack{
                       
                        ForEach(0..<topics.count){
                            Text(self.topics[$0])
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .frame(width: 400)
                                .background(Color.white)
                                //  .padding(.bottom)
                               // .border(Color.black, width: 2)
                            .padding(.bottom)
                            Text(self.candidateProfiles.bio) //self.candidateProfiles[$0]
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
        CandidatePage()
    }
}
