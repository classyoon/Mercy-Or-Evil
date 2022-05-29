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
    let idle = ["Whoever you are don't touch the buttons.  It's better for the both of us.", "I can't help but feel I know you. Who are you?", "I keep forgetting. Why am I here?", "I'm having some desha fu. I swear I've seen this place before.", "Who are you?", "Sup", "...", "What's your name?", "Is something happening there?", "I swear I am repeating myself, but I can't help it"]
    let bored = ["Helloooo?", "Is this thing on?  I can't hear you.", "uggh, I'm getting bored. Want to play a game?", "Silent type, I get it.", "Ugh, man this place is cramped", "What the heck am I doing here?"]
    let wary = ["...", "okay", "Well, I guess this is better than other things happening","What are you doing?", "thanks... I guess"]
    let hostile =  ["sus", "I'm watching you", "*intense glare*", "I know you're thinking about it."]
    let suprise = ["Wah!", "Noo-!", "Oh Go-!", "Ga-!", "Oh I swear-!", "Why?!"]
    @State var buttonlabel : String
    @State var imageName = ""
    var body: some View {
        ZStack {
            
            //            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            //            Image("Skull")
            //                .resizable()
            //                .frame(width: CGFloat(10.0) * CGFloat(screamCount), height: CGFloat(10.0) * CGFloat(screamCount))
            //
            //                .clipShape(Circle())
//            HStack{
                VStack{
                    VStack{
                        Image(imageName)
                            .resizable()
        //                    .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .frame(width: 350, height: 350)
                            
                        Spacer()
                    }
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
            
//        }
        
    }
    init(){
        _buttonlabel = State(initialValue: idle[Int.random(in: 0..<idle.count)])
    }
    
}//List, prints splices together longer prhase

extension ContentView {
    func handleEvilButtonPress() {
        imageName = "Hurt"
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
        imageName = "Joy"
        switch screamCount {
        case 0:
            if evil {
                if evilCount<5{
                buttonlabel = wary[Int.random(in: 0..<wary.count)]
                }
                else{
                    buttonlabel = hostile[Int.random(in: 0..<hostile.count)]
                }
            }
            else{
                if mercyCount < 10 {
            buttonlabel = idle[Int.random(in: 0..<idle.count)]
                }
                else {
                    buttonlabel = bored[Int.random(in: 0..<bored.count)]
                }
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

