import Foundation

class Healer: Champion { 
  
  //Inits
  init(name: String) {
    super.init(type: "Healer", life: 70, weapon: Scepter.init(), name: name)    
  }
  
  //Methodes
  func heal(champion: Champion) {
    if life > 0 {
      if champion.life > 0 {
          
        champion.life += weapon.heal
        
        print("⚡️ Your \(champion.type) \"\(champion.name)\" has recovered \(weapon.heal) points of life by the \(weapon.nameWeapon) of your \(type) \"\(name)\" !⚡️")
        if champion.life >= champion.lifeMaxLimit { // after a healing the champion can't have more points of life than to the start
          champion.life = champion.lifeMaxLimit
          print("He has recovered the totality of his life points.")
        }
      } else {
        print("Your \(champion.type), \"\(champion.name)\" is already dead and cannot be resurrected !")
      }
    } else {
      print("Sorry your \(type) \"\(name)\" is already dead and you cannot heal !")
    }
  }
  
  // unlocked a champion who has been blocked by the "Power Of Ice"
  
  override func attack(champion: Champion) {
    print("The \(type) \"\(name)\" can't attack but only to heal !")
  }
  
}

