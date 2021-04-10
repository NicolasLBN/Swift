import Foundation

class Champion {
  
  let type: String
  var life: Int
  var weapon: Weapon
  let name: String
  let lifeMaxLimit: Int
  

  init(type: String, life: Int, weapon: Weapon, name: String) {
    self.type = type
    self.life = life
    self.weapon = weapon
    self.name = name
    self.lifeMaxLimit = life
  }
  
  private func receive(damage: Int) {
    self.life -= damage
    // If life is negative, the life of the champion is set to 0
    if self.life <= 0 {
      self.life = 0
    }
  }
  
  // attack enemy
  func attack(champion: Champion) {
    if life > 0 {
      if champion.life > 0 {
        champion.receive(damage: weapon.damage)
        print("-----------------------------------------------------------------------------------------------------")
        print("The \(champion.type) \"\(champion.name)\" received \(weapon.damage) points of damage by the \(weapon.nameWeapon) of your \(type) \"\(name)\" !")
        print("-----------------------------------------------------------------------------------------------------")
        if champion.life <= 0 {
          print("The \(champion.type) \"\(champion.name)\" is dead !!! ")
        }
      } else {
        print("--------------------------------------------------------")
        print("The \(champion.type) \"\(champion.name)\" is already dead !")
        print("--------------------------------------------------------")
      }
    } else {
      print("---------------------------------------------------------------------------------------")
      print("Sorry the \(type) \"\(name)\" is already dead and cannot attack the \(champion.type) \"\(champion.name)\" !")
      print("---------------------------------------------------------------------------------------")
    }
  }
  
  // Display the description of our champion on the screen
  func display(index: Int) {
    print(" ")
    print("\(index) - \(type) \"\(name)\" - Points of life : \(life) - Weapon : \(weapon.nameWeapon) - Points of damage : \(weapon.damage) - Points for healing : \(weapon.heal)")
  }
} 


