import Foundation

class Tank: Character { 
  
  init(name: String) {
    super.init(type: "Tank", life: 120, weapon: Mace.init(), name: name, isBlocked: false)
  }
}
