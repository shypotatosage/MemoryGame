//
//  CardView.swift
//  MemoryGame
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Object
    let width: CGFloat
    
    var memoriesCount: Int
    @Binding var chances: Int
    @Binding var turns: Int
    @Binding var showingAlert: Bool
    @Binding var matched: [Object]
    @Binding var currentFlip: [Object]
    
    var body: some View {
        if currentFlip.contains(where: {$0.id == card.id}) || matched.contains(where: {$0.id == card.id}) {
            Text(card.icon)
                .font(.system(size: 40))
                .padding()
                .frame(width: width, height: width)
                .cornerRadius(50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray)
                }
                .onTapGesture {
                    if !matched.contains(where: {$0.id == card.id}) && currentFlip.count != 0 {
                        withAnimation(Animation.linear.delay(0.25)) {
                            card.flip()
                            currentFlip.remove(at: currentFlip.firstIndex(where: {$0.id == card.id})!)
                        }
                    }
                }
        } else {
            Text("?")
                .font(.system(size: 40))
                .padding()
                .frame(width: width, height: width)
                .cornerRadius(50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.gray)
                .onTapGesture {
                    withAnimation(Animation.linear.delay(0.1)) {
                        card.flip()
                        currentFlip.append(card)
                    }
                    
                    if currentFlip.count == 2 {
                        turns += 1
                        
                        if !isMatched(object1: currentFlip[0], object2: currentFlip[1]) {
                            
                            withAnimation(Animation.linear.delay(1)) {
                                currentFlip[0].flip()
                                currentFlip[1].flip()
                                
                                currentFlip.remove(at: 0)
                                currentFlip.remove(at: 0)
                            }
                        }
                    }
                    
                    if (matched.count == memoriesCount || turns == chances) {
                        showingAlert.toggle()
                        matched.removeAll()
                    }
                }
        }
    }
    
    func isMatched(object1: Object, object2: Object) -> Bool {
        if object1.icon == object2.icon {
            matched.append(object1)
            matched.append(object2)
            
            currentFlip.remove(at: 0)
            currentFlip.remove(at: 0)
        }
        
        return object1.icon == object2.icon
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: Object(icon: "👻"))
//    }
//}
