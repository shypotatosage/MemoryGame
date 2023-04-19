//
//  ContentView.swift
//  MemoryGame
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    var fourColumnGrid = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var level: Int
    @State private var showingAlert = false
    @State var turns: Int = 0
    @State var chances: Int
    @State var memories: [Object]
    @State var matched: [Object] = []
    @State var currentFlip: [Object] = []
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Text("🧠 Memory Game ✨")
                    .fontWeight(Font.Weight.bold)
                    .font(.system(size: 30))
                Text("Level \(level)")
                Text("Turns \(turns) Out Of \(chances) Chances")
                    .padding()
                    .font(.system(size: 18, weight: Font.Weight.medium))
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach(memories) { memory in
                        CardView(card: memory, width: g.size.width/4 - 10, memoriesCount: memories.count, chances: $chances, turns: $turns, showingAlert: $showingAlert, matched: $matched, currentFlip: $currentFlip)
                    }
                }
                .padding([.top], 20)
            }
            .padding([.top], 10)
        }
        .padding()
        .alert( wonOrLost(), isPresented: $showingAlert) {
            Button("Back To Menu") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func wonOrLost() -> String {
        if turns <= chances {
            return "Congrats! You won!"
        } else {
            return "Too bad! You lost."
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
