//
//  ContentView.swift
//  Mercy Or Evil
//
//  Created by Conner Yoon on 5/26/22.
//

import SwiftUI

struct ContentView: View {
    //Hidden
    @State var evil = false; @State var mercy = true
    @State var painCount = 0//Memory
    @State var evilCount = 0; @State var mercyCount = 0 //Specific Memory
    @State var waryCount = 0; @State var hostileCount = 0 //Grudge
    
    //Visual
    @State var mood = ""
    @State var color = Color.primary; @State var fontsize = Font.body
    @State var speechlabel : String
    @State var imageName = ""
    
    //Speech Lines
    let painNoises = [ "Ooof! ", "Reee! ", "Agggh! ", "Grk! ", "Help! ", "Mercy Please!", "OW!", "AHHH THE PAIN!", "STOP IT!", "@!#$@$##@$!", "Who do you think you are?!"]
    let idle = ["Whoever you are don't touch the buttons.  It's better for the both of us.", "I can't help but feel I know you. Who are you?", "I keep forgetting. Why am I here?", "I'm having some desha fu. I swear I've seen this place before.", "Who are you?", "Sup", "...", "What's your name?", "Is something happening there?", "I swear I am repeating myself, but I can't help it"]; let bored = ["Helloooo?", "Helloooo?", "Helloooo?", "Is this thing on?  I can't hear you.", "I keep forgetting. Why am I here?", "uggh, I'm getting bored. Want to play a game?", "Silent type, I get it.", "Ugh, man this place is cramped", "What the heck am I doing here?", "I'm having some desha fu. I swear I've seen this place before.", "Wanna talk?"]
    let wary = ["...", "okay", "Well, I guess this is better than other things happening","What are you doing?", "thanks for stopping... I guess", "*cowers in fear*", "At least it stopped"]; let hostile =  ["sus", "I'm watching you", "*intense glare*", "I know you're thinking about it.", "I know you're thinking about it.", "thanks... I guess", "*cowers in fear*", "*cowers in fear*", "Imma get you", "You know not what you do", "You seem untrustworthy"]
    let suprise = ["Wah!", "Noo-!", "Oh Go-!", "Ga-!", "Why?!"]; let resigned = ["Wah!", "Noo-!", "Oh Go-!", "Ga-!", "Oh I swear-!", "Why?!", "Not again!", "Not again!", "Don't"]
    let relief = ["Phew", "No more. okay?", "Why did you do that?", "Never again"]; let fear = ["Why did you do that?", "Thank goodness you stopped", "*gasp* I can breath again", "*cowers in fear*",  "*cowers in fear*"]
    
    var body: some View {
        ZStack {
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
                    Text("Mood : \(mood), Grudge : \(hostileCount), Wariness : \(waryCount), Idle : \(mercyCount)")
                    Text("\(speechlabel)").font(fontsize).foregroundColor(color).bold().padding(.bottom, 80)
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
    
    init(){_speechlabel = State(initialValue: idle[Int.random(in: 0..<idle.count)])}

}//End of Struct

extension ContentView {
    func handleEvilButtonPress() {
        //Visual
        color = .red; fontsize = .title
        speechlabel=painNoises[Int.random(in: 0..<painNoises.count)]
        mood = "in pain"
        imageName = "Hurt"
        //Hidden
        evil = true
        waryCount+=5; hostileCount+=2
        painCount+=1
        evilCount+=1
        
        // If you were nice before then suddenly evil
        if mercy {

            if (evilCount>2){//If you were evil in the past then merciful
                speechlabel = resigned[Int.random(in: 0..<resigned.count)]
                mood = "exasperated"
                hostileCount+=10
                waryCount+=20
            }
            else{
                speechlabel = suprise[Int.random(in: 0..<suprise.count)]
                mood = "suprised"
                hostileCount+=5
                waryCount+=10
            }
            //lose trust
            mercyCount = 0
            mercy = false
        }
        
    }//End of Evil Button
    
    func handleMercyButtonPress(){
        //hidden
        mercy = true; painCount = 0; mercyCount+=1
        //visual
        imageName = "Joy"; color = .green; fontsize = .body
        switch painCount {
        case 0:
            if waryCount == 0 {evil = false}
            if evil { //If you have been mean
                if evilCount<15||hostileCount==0{
                    speechlabel = wary[Int.random(in: 0..<wary.count)]
                    mood = "wary"; waryCount-=1
                    mercyCount-=1 //prevent mercy from going down whilst forgiving

                }//at first wary
                else{//then hostile
                    speechlabel = hostile[Int.random(in: 0..<hostile.count)]
                    mood = "hostile"; hostileCount-=1
                    mercyCount-=1 //prevents mercy from going down whilst forgiving
                }
            }
            else{//if you haven't been mean
                if mercyCount < 20 {//once it reaches a threshold it will switch to bored
                    speechlabel = idle[Int.random(in: 0..<idle.count)]//at first idle
                    mood = "idle"
                }
                else {
                    speechlabel = bored[Int.random(in: 0..<bored.count)]//then bored
                    mood = "bored"
                }
            }
        case 1...8:
            if evilCount < 5 {speechlabel = relief[Int.random(in: 0..<relief.count)]
                mood = "relief"
            }
            else {speechlabel = fear[Int.random(in: 0..<fear.count)]; mood = "fear"}
        
        case 9...25:
            speechlabel = "OMG. I thought you'd never stop.  Please now.  Don't touch do whatever you did, again"; mood = "big relief"
        default:
            speechlabel = "REALLY?"; mood = "exasperated (this seemed excessive)"
        }
    }//End of Mercy Button
    
} //End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        //.previewInterfaceOrientation(.landscapeRight)
    }
}
