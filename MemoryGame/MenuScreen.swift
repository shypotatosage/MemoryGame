//
//  MenuScreen.swift
//  MemoryGame
//
//  Created by MacBook Pro on 19/04/23.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        GeometryReader { g in
            NavigationStack {
                VStack(spacing: 0) {
                    Text("🧠")
                        .font(.system(size: 100))
                    Text("Memory Game")
                        .font(.system(size: 40, weight: Font.Weight.semibold))
                    Text("Pick Your Level")
                        .padding()
                        .font(.system(size: 30, weight: Font.Weight.medium))
                    NavigationLink {
                        ContentView(level: 1, memories: cardList(0))
                    } label: {
                        Text("Easy ")
                            .font(.system(size: 25))
                            .padding()
                            .frame(width: g.size.width/2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray)
                                    .foregroundColor(.gray)
                            }
                    }
                    NavigationLink {
                        ContentView(level: 2, memories: cardList(1))
                    } label: {
                        Text("Medium")
                            .font(.system(size: 25))
                            .padding()
                            .frame(width: g.size.width/2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray)
                                    .foregroundColor(.gray)
                            }
                    }
                    .padding()
                    NavigationLink {
                        ContentView(level: 3, memories: cardList(2))
                    } label: {
                        Text("Hard")
                            .font(.system(size: 25))
                            .padding()
                            .frame(width: g.size.width/2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray)
                                    .foregroundColor(.gray)
                            }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
