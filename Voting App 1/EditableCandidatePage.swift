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
    @Environment(\.presentationMode) var tfPresentationMode
    
    @State private var didTap:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                MultiLineTF(txt: self.$txt)
                    .border(Color.black, width: 3)
                    .padding()
                
                VStack(alignment: .leading){
                Button(action: {
                    self.didTap = true
                    self.candidateProfiles.details[0] = self.txt
                    //how can i make it dependant on who it is?
                    print( "self.candidateProfiles.details[0] is \(self.candidateProfiles.details[0])")
                    //how can i  show this data on the regular page?
                }) {
                    Image(systemName: "circle")
                    Text("Change The Bio Text")
                }.foregroundColor(didTap ? Color.green : Color.black)
                
                Button(action: {
                    self.didTap2 = true
                    self.candidateProfiles.details[1] = self.txt
                    //how can i make it dependant on who it is?
                    print( "self.candidateProfiles.details[1] is \(self.candidateProfiles.details[1])")
                    //how can i  show this data on the regular page?
                }) {
                    Image(systemName: "circle")
                    Text("Change The Goals Text")
                }.foregroundColor(didTap2 ? Color.green : Color.black)
                
                Button(action: {
                    self.didTap3 = true
                    self.candidateProfiles.details[2] = self.txt
                    //how can i make it dependant on who it is?
                    print( "self.candidateProfiles.details[2] is \(self.candidateProfiles.details[2])")
                    //how can i  show this data on the regular page?
                }) {
                    Image(systemName: "circle")
                    Text("Change The Promises Text")
                }.foregroundColor(didTap3 ? Color.green : Color.black)
                }
                .padding(.bottom,10)
                Button(action: {
                    print("Added text is stored")
                    self.tfPresentationMode.wrappedValue.dismiss()
                    self.didTap = false
                    self.didTap2 = false
                    self.didTap3 = false
                }) {
                    Text("Publish Text")
                    .font(.system (size: 25))
                        .fontWeight(.heavy)

                }//.onDisappear(){self.candidateProfiles.details[0]}
                //how can i make this stored ariable appear on the candidate page? 
            }
        }
    }
}

struct MultiLineTF : UIViewRepresentable {
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
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
        
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
