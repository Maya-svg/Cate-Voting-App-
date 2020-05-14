//
//  Vote.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 5/11/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI

struct Vote: View {
    init(){
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    //@ObservedObject var candidateProfiles: AppManager // app crashes when I add this - why?
    @State var editingList = false
    @State var rankCandidates = [ "Lilly Zanze", "Rachel Wilkes", "Peter Coors"]
    @State var appear = false 
    @State var submitedVotes = [ ]
    @Environment(\.presentationMode) var presentationMode 
    var body: some View {
        ZStack{
            
            List{
                Section(header:
                Text("           Drag & Drop To Rank Candidates")){
                    ForEach(0..<rankCandidates.count){ i in
                        Text("\(i + 1). \(self.rankCandidates[i])")
                    }.onMove(perform: move)
                        .onLongPressGesture {
                            withAnimation{
                                self.editingList = true
                            }
                    }
                }
            }.environment(\.editMode, editingList ? .constant(.active) : .constant(.inactive))
                .accentColor(.blue)
            
            Button(action: {
                withAnimation {
                    self.appear = true
                }
                print("I voted")
                // self.submitedVotes.append(<#Any#>)
                // i want to ad the raking in here 
            }) {
                Text("Submit My Vote")
            }
            
            if self.appear{
                VStack{
                    Image("download")
                        .resizable()
                        .frame(maxWidth: 260, maxHeight: 300)
                    
                    Button(action: {
                        self.editingList = false
                        print("leaving")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Exit")
                    }
                }
            }
            
        }
    }
    func move(fromOffsets source: IndexSet, toOffsets destination: Int)
    {
        rankCandidates.move(fromOffsets: source, toOffset: destination)
        withAnimation{
            editingList = false
        }
    }
}

struct Vote_Previews: PreviewProvider {
    static var previews: some View {
        Vote()
        //(candidateProfiles: AppManager())
    }
}
