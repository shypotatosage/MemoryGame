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
    @State private var showingAlertWon = false
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
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach(memories) { memory in
                        CardView(card: memory, width: g.size.width/4 - 10, memoriesCount: memories.count, showingAlertWon: $showingAlertWon, matched: $matched, currentFlip: $currentFlip)
                    }
                }
                .padding([.top], 20)
            }
            .padding([.top], 10)
        }
        .padding()
        .alert("Congrats! You won!", isPresented: $showingAlertWon) {
            Button("Back To Menu") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
