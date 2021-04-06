
import Foundation

class Assassin: Character { 
  
  init(name: String) {
    super.init(type: "Assassin", life: 100, weapon: Sword.init(), name: name, isBlocked: false)
  }
}

