import Foundation

class Weapon {
  //Vars
  var damage: Int
  var heal: Int
  let nameWeapon: String
  
  //Init
  init(damage: Int, heal: Int, nameWeapon: String) {
    self.damage = damage
    self.heal = heal
    self.nameWeapon = nameWeapon
  }
}
