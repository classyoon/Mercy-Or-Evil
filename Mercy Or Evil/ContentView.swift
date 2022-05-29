//
//  ContentView.swift
//  Mercy Or Evil
//
//  Created by Conner Yoon on 5/26/22.
//

import SwiftUI



struct ContentView: View {
    @State var evil = false
    @State var mercy = true;
    @State var color = Color.primary
    @State var fontsize = Font.body
    @State var screamCount = 0
    @State var evilCount = 0
    @State var mercyCount = 0
    let painNoises = [ "Ooof! ", "Reee! ", "Agggh! ", "Grk! ", "Help! ", "Mercy Please!", "OW!", "AHHH THE PAIN!", "STOP IT!", "@!#$@$##@$!", "Who do you think you are?!"]
    let idle = ["Whoever you are don't touch the buttons.  It's better for the both of us.", "I can't help but feel I know you.  Who are you?", "Is this thing on?  I can't hear you.", "I keep forgetting. Why am I here?", "Ugh, man this place is cramped", "I'm having some desha fu.  I swear I've seen this place before.", "Who are you?", "Sup", "Is this thing on?  I can't hear you.", "...", "Well, I guess this is better than other things happening", "What are you doing?", "What's your name?", "Is something happening there?", "I swear I am repeating myself, but I can't help it"]
    let wary = ["...", "okay", "thanks... I guess"]
    let hostile =  ["sus", "I'm watching you", "*intense glare*", "I know you're thinking about it."]
    let suprise = ["Wah!", "Noo-!", "Oh Go-!", "Ga-!", "Oh I swear-!", "Why?!"]
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
        _buttonlabel = State(initialValue: idle[Int.random(in: 0..<idle.count)])
    }
    
}//List, prints splices together longer prhase

extension ContentView {
    func handleEvilButtonPress() {
        evil = true
        color = .red
        fontsize = .title
        screamCount+=1
        evilCount+=1
        buttonlabel=painNoises[Int.random(in: 0..<painNoises.count)]
        if mercy {
            buttonlabel = suprise[Int.random(in: 0..<suprise.count)]
            mercyCount = 0
            mercy = false
        }
       
    }
    
    func handleMercyButtonPress(){
        switch screamCount {
        case 0:
            if evil {
                buttonlabel = wary[Int.random(in: 0..<wary.count)]
            }
            else{
            buttonlabel = idle[Int.random(in: 0..<idle.count)]
            }
        case 1...3:
            buttonlabel = "Phew."
        case 4...8:
            buttonlabel = "What were you doing?"
        case 9...15:
            buttonlabel = "OMG. I thought you'd never stop.  Please now.  Don't touch do whatever you did, again"
        default:
            buttonlabel = "REALLY?"
        }
        mercy = true
        color = .green
        fontsize = .body
        screamCount = 0
        mercyCount+=1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        //.previewInterfaceOrientation(.landscapeRight)
    }
}

