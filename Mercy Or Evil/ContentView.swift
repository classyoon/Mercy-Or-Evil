//
//  ContentView.swift
//  Mercy Or Evil
//
//  Created by Conner Yoon on 5/26/22.
//

import SwiftUI



struct ContentView: View {
    @State var evil = false
    @State var color = Color.primary
    @State var fontsize = Font.body
    @State var screamCount = 0
    @State var mercyCount = 0
    let painNoises = [ "Ooof! ", "Reee! ", "Agggh! ", "Grk! ", "Help! ", "Mercy Please!", "OW!", "AHHH THE PAIN!", "STOP IT!", "@!#$@$##@$!"]
    let causalNoises = ["Whoever you are don't touch the buttons.  It's better for the both of us.", "I can't help but feel I know you.  Who are you?", "Is this thing on?  I can't hear you.", "I keep forgetting. Why am I here?", "Ugh, man this place is cramped", "I'm having some desha fu.  I swear I've seen this place before."]
    let idleMercy = ["Who are you?", "Sup", "Is this thing on?  I can't hear you.", "...", "Well, I guess this is better than other things happening", "What are you doing?", "What's your name?", "Is something happening there?", "I swear I am repeating myself, but I can't help it"]
    let suprise = ["Wah!", "Noo-!", "Noo not again!", "Oh Go-!", "Ga-!", "Oh I swear-!", "Again? A-!"]
//    let activeMercy = []
    @State var buttonlabel : String

    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
//            Image("Skull")
//                .resizable()
//                .frame(width: CGFloat(10.0) * CGFloat(screamCount), height: CGFloat(10.0) * CGFloat(screamCount))
//
//                .clipShape(Circle())
            HStack{
                VStack{
                    VStack{
            //                    Text("Screams \(screamCount)")
                        Text("\(buttonlabel)").font(fontsize).foregroundColor(color).bold().padding(.bottom, 80)
                    }
                    HStack{
                        
                        Button {
                            handleEvilButtonPress()
    
                        } label: {
                            
                            Text("EVIL")
                                
                                .foregroundColor(.black).fontWeight(.bold)
                                .frame(width: 100.0)
                                .padding(4)
//                                .background(.thickMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.primary.opacity(0.35), lineWidth: 4))
                                .shadow(color: .primary.opacity(0.75), radius: 10, x: 4, y: 4)
                            
                        }.frame(maxWidth: .infinity)
                        Button {
                            handleMercyButtonPress()
                        } label: {
                            Text("Mercy")
                                .foregroundColor(.white).fontWeight(.bold)
                            //                            .background(.thinMaterial)
                                .frame(width: 100.0)
                                .padding()
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.5), lineWidth: 4))
                                
                                .shadow(color: .primary.opacity(0.75), radius: 10, x: 4, y: 4)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }.padding()
            }

        }

    }
    init(){
        _buttonlabel = State(initialValue: causalNoises[Int.random(in: 0..<causalNoises.count)])
    }
    
}//List, prints splices together longer prhase

extension ContentView {
    func handleEvilButtonPress() {
        color = .red
        fontsize = .title
        screamCount+=1
        
        buttonlabel=painNoises[Int.random(in: 0..<painNoises.count)]
        if screamCount>1 {
            buttonlabel=painNoises[Int.random(in: 0..<painNoises.count)]
            mercyCount = 0
        }
        
        if mercyCount>=1 {
            buttonlabel = suprise[Int.random(in: 0..<suprise.count)]
            mercyCount = 0
        }
    }
    
    func handleMercyButtonPress(){
        if screamCount == 0 {
            buttonlabel = idleMercy[Int.random(in: 0..<idleMercy.count)]
        }
        else if screamCount >= 50 {
            buttonlabel = "REALLY?"
        }
        else if screamCount >= 10 {
            buttonlabel = "OMG. I thought you'd never stop.  Please now.  Don't touch do whatever you did, again"
        }
        else if screamCount >= 5 {
            buttonlabel = "What were you doing?"
        }
        else if screamCount > 3 {
            buttonlabel = "Phew.  Now don't do it again."
        }
        else if screamCount > 0 {
            buttonlabel = "Yay no evil"
        }
      

      
               
//        if (mercyCount >= 5 && screamCount == 0) {
//            buttonlabel = "Wow you're real swell.  I'm at a loss of words."
//        }
        color = .green
        fontsize = .body
        mercyCount+=1
        screamCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
//.previewInterfaceOrientation(.landscapeRight)
    }
}

