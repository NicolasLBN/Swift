import Foundation

class Tank: Champion { 
  
  init(name: String) {
    super.init(type: "Tank", life: 120, weapon: Club.init(), name: name)
  }
}
