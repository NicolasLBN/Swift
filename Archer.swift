import Foundation

class Archer: Character { 
  
  init(name: String) {
    super.init(type: "Archer", life: 60, weapon: Axe.init(), name: name, isBlocked: false)
  }
}
