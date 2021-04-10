import Foundation

class Archer: Champion { 
  
  init(name: String) {
    super.init(type: "Archer", life: 60, weapon: Bow.init(), name: name)
  }
}
