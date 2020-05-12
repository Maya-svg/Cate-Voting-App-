//
//  EditableCandidatePage.swift
//  Voting App 1
//
//  Created by Maya Fenelon on 5/4/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI

struct EditableCandidatePage: View {
    @State var txt = ""
    @ObservedObject var candidateProfiles: AppManager 
    var body: some View {
        ZStack{
            VStack{
        MultiLineTF(txt: self.$txt)
        .border(Color.black, width: 3)
        .padding()
       Button(action: {
        self.candidateProfiles.bio[0] = self.txt
        print("Added text is stored")
       }) {
                    Text("Publish")
                }
    }
    }
    }
}
 /*
    @ObservedObject var candidateProfiles = AppManager()
    let topics = ["Bio", "Goals", "Promises"]
    @State private var mainTopic = "Bio"
    @State var txt = ""
    
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
                    
                    VStack{
                        ForEach(0..<topics.count){
                            
                            Text(self.topics[$0])
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .frame(width: 400)
                                .background(Color.white)
                                //  .padding(.bottom)
                                .border(Color.black, width: 2)
                           
                            MultiLineTF(txt: self.$txt) //won't show up for some reason
                                .border(Color.black, width: 3)
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Save Text")
                            }
                            Spacer()
                            /*TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .padding(.bottom)
                                .frame(width: 400)
                                .border(Color.black, width: 3)*/
                            
                        }
                    }
                }
            }
        }
    }
}
*/

struct MultiLineTF : UIViewRepresentable {
//add varbody some: view{}
@Binding var txt : String

func makeCoordinator() -> MultiLineTF.Coordinator {
return MultiLineTF.Coordinator(parent1: self)
}

func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView {
let tview = UITextView()
tview.isEditable = true
tview.isUserInteractionEnabled = true
tview.isScrollEnabled = true
tview.text = "Type your information"
tview.textColor = .gray

tview.delegate = context.coordinator
   print("This is where I am")
return tview
}

func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
//missing code in here
    //thisis the function i would be looking
    
}
class Coordinator : NSObject, UITextViewDelegate{

var parent : MultiLineTF

init(parent1: MultiLineTF){
parent = parent1
}

func textViewDidChange(_ textView: UITextView){
self.parent.txt = textView.text
}
func textViewDidBeginEditing(_ textView: UITextView) {
textView.text = ""
textView.textColor = .label
}
}
}

struct EditableCandidatePage_Previews: PreviewProvider {
    static var previews: some View {
        EditableCandidatePage(candidateProfiles: AppManager())
    }
}
