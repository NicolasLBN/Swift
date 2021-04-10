import Foundation

class Mage: Champion { 
  
  init(name: String) {
    super.init(type: "Mage", life: 80, weapon: MagicWand.init(), name: name)
  }
  
 
} // END class Mage

