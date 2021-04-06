import Foundation

class Archer: Character { 
  
  init(name: String) {
    super.init(type: "Archer", life: 60, weapon: Bow.init(), name: name, isBlocked: false)
  }
}
