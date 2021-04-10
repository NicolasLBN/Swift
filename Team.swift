import Foundation

class Team {

 
  var champions = [Champion]()

  func displayTeam() {
    for i in 0..<champions.count {
      let champion = champions[i]
      if champion.life <= 0 {
        print(" ")
        print("\(i+1) - The \(champion.type) \"\(champion.name)\" is dead!")
        print(" ")
      } else {
        champion.display(index: i+1)
      }
    }
  }
  
  // function returns true if the champion is dead
  func isDead() -> Bool {
    var isDead = false
    for champion in champions {
      if champion.life <= 0 {
        isDead = true
      } else { //false
        isDead = false
        return isDead
      }
    }
    return isDead
  }  
} // END class Team
