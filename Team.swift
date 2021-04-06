import Foundation

class Team {

 
  var characters = [Character]()

  func displayTeam() {
    for i in 0..<characters.count {
      let character = characters[i]
      if character.life <= 0 {
        print(" ")
        print("\(i+1) - The \(character.type) \"\(character.name)\" is dead ❌ !")
        print(" ")
      } else {
        character.display(index: i+1)
        if character.isBlocked == true {
          print("@@@@ ⭕️🥶 The \(character.type) \"\(character.name)\" is freezed !!! 🥶⭕️ @@@@")
        }
      }
    }
  }
  
  // function returns true if the character is dead
  func isDead() -> Bool {
    var isDead = false
    for character in characters {
      if character.life <= 0 {
        isDead = true
      } else { //false
        isDead = false
        return isDead
      }
    }
    return isDead
  }  
} // END class Team
