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
    var body: some View {
        ZStack{
            VStack{
                
                Text("change the")
                Text("change the promises")
                MultiLineTF(txt: self.$txt)
                    .border(Color.black, width: 3)
                    .padding()
                Button(action: {
                    self.candidateProfiles.details[0] = self.txt
                    //how can i make it dependant on who it is?
                    print( "self.candidateProfiles.details[0] is \(self.candidateProfiles.details[0])")
                    //how can i  show this data on the regular page?
                }) {
                    Text("change the bio")
                }
                Button(action: {
                    print("Added text is stored")
                    self.tfPresentationMode.wrappedValue.dismiss()
                    print( "self.candidateProfiles.details[0] is \(self.candidateProfiles.details[0])")
                }) {
                    Text("Publish Text")
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
        print("This is where I am")
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
