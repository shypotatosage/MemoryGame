import Foundation
import SwiftUI

class Object: Identifiable, ObservableObject {
    @Published var flipped: Bool = false
    var icon: String
    var id = UUID()
    
    init(icon: String) {
        self.icon = icon
    }
    
    func flip() {
        flipped.toggle()
    }
}

let memories: [[String]] = [["🤡", "👻", "😈", "🎃", "😍", "😇"], ["🤡", "👻", "😈", "🎃", "😍", "🤩", "🐼", "🤓"], ["🧠", "🫁", "👨‍🦳", "🧑‍🦳", "🧑‍🏭", "👮", "🙂", "🙃", "🧐", "🤓", "😜", "🤪"], ["🦞", "🦀", "🦛", "🦏", "🐡", "🐭", "🐰", "🐨", "👨‍👨‍👧", "👨‍👨‍👦", "🌘", "🌒", "🌞", "🌼", "🌹", "☘️"]]

func cardList(_ difficulty: Int) -> [Object] {
    var list: [Object] = []
    
    for memory in memories[difficulty] {
        list.append(Object(icon: memory))
        list.append(Object(icon: memory))
    }
    
    return list.shuffled()
}
