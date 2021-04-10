import Foundation

class TeamManagment {
  
  //Vars
  private var checkName = [String]()
  var teamArray = [Team]()
  
  //Methodes
  private func listchampionsMenu() {
    print("")
    print("=======================================================================")
    print(" Create your team - Choose 3 champions between 1 and 5 :  ")
    print("-----------------------------------------------------------------------")
    print("1 - Assassin ------------- Life: 100 --- Damage: 20 "
      + "\n2 - Healer  ------------- Life: 70  --- Heal: 25 "
      + "\n3 - Tank   ------------- Life: 120 --- Damage: 15 "
      + "\n4 - Archer   ------------- Life: 60  --- Damage: 30 "
      + "\n5 - Mage --- Life: 80  --- Damage: 25 "
      + "\n=======================================================================")
  }
  
  // function to choice a champion
  private func createchampion() -> Champion? {
    var userChoice = 0
    listchampionsMenu()
    
    repeat {
      if let data = readLine() {
        if let dataToInt = Int(data) {
          userChoice = dataToInt
        }
      }
    } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 && userChoice != 5
    
    
    switch userChoice {
    case 1: // assassin
      let assassin = Assassin(name: uniquechampionName())
      print("Added an Assassin to the team with the name \"\(assassin.name)\".")
      return assassin
    case 2: // healer
      let healer = Healer(name: uniquechampionName())
      print("Added a Healer to the team with the name \"\(healer.name)\".")
      return healer
    case 3: // giant
      let tank = Tank(name: uniquechampionName())
      print("Added a Tank to the team with the name \"\(tank.name)\".")
      return tank
    case 4: // dwarf
      let archer = Archer(name: uniquechampionName())
      print("Added an Aecher to the team with the name \"\(archer.name)\".")
      return archer
    case 5: // Elementary Of Ice
      let mage = Mage(name: uniquechampionName())
      print("Added a Mage to the team with the name \"\(mage.name)\".")
      return mage
    default:
      return nil
    }
  }
  
  // Create the team with 3 champions
  private func createchampions() -> [Champion]? {
    var champions = [Champion]()
    for _ in 0..<3 {
      guard let champion = createchampion() else { return nil }
      champions.append(champion)
    }
    return champions
  }
  
  // Create a team
  private func createTeam() -> Team? {
    let team = Team()
    guard let champions = createchampions() else { return nil }
    team.champions = champions // import array 'champions' of class Team
    return team
  }
  
  // Create several teams
  func createTeams() {
    var numberOfTeams = 0
    print("")
    print("==============================")
    print("   New Game !!!  ")
    print("------------------------------")
    print("Enter the number of teams : ")
    print("==============================")
    repeat {
      if let data = readLine() {
        if let dataToInt = Int(data) {
          numberOfTeams = dataToInt
        }
      }
    } while numberOfTeams == 0
    
    // Loop for the creation of teams as much as the player has chosen
    for i in 0..<numberOfTeams {
      // Choose the name of player
      var namePlayer = ""
      print("")
      print("=============================")
      print("Enter the name of player \(i+1) : ")
      print("=============================")
      repeat {
        if let data = readLine() {
          namePlayer = data
        }
      } while namePlayer == ""
      
      // Creation of teams
      print("-----------------------------")
      print("Player \(i+1) : \(namePlayer)")
      print("Creation of the team N°\(i+1)")
      print("-----------------------------")
      guard let team = createTeam() else { return }
      teamArray.append(team)
    }
  }
  
  // check if the name of the champion already exists
  private func uniquechampionName() -> String {
    print("Choose the name of your champion :")
    var championName = ""
    repeat {
      if let data = readLine() {
        championName = data
        if checkName.contains(championName) {
          print(" The name: '\(championName)' already exists !")
          print("Please enter a new name.")
          championName = ""
        } else {
          checkName.append(championName)
        }
      }
    } while championName == ""
    return championName
  }
} // END class TeamFactory
