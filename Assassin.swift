
import Foundation

class Assassin: Champion { 
  
  init(name: String) {
    super.init(type: "Assassin", life: 100, weapon: Sword.init(), name: name)
  }
}

