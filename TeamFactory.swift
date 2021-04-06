import Foundation

class TeamFactory {
  
  //Vars
  private var checkName = [String]()
  var arrayTeams = [Team]()
  
  //Methodes
  private func listCharactersMenu() {
    print("")
    print("=======================================================================")
    print("🛡 Create your team - Choose 3 characters between 1 and 4 : 🛡")
    print("-----------------------------------------------------------------------")
    print("1 - Assassin ------------- Life: 100 --- Damage: 20 "
      + "\n2 - Healer  ------------- Life: 70  --- Heal: 20 + Dispel 🔮"
      + "\n3 - Tank   ------------- Life: 120 --- Damage: 10 "
      + "\n4 - Archer   ------------- Life: 60  --- Damage: 30 "
      + "\n5 - Elementary Of Ice --- Life: 80  --- Damage: 15 + Power to freeze 🥶"
      + "\n=======================================================================")
  }
  
  // function to choice a character
  private func createCharacter() -> Character? {
    var userChoice = 0
    listCharactersMenu()
    
    repeat {
      if let data = readLine() {
        if let dataToInt = Int(data) {
          userChoice = dataToInt
        }
      }
    } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 && userChoice != 5
    
    
    switch userChoice {
    case 1: // assassin
      let assassin = Assassin(name: uniqueCharacterName())
      print("Added an Assasin to the team with the name \"\(assassin.name)\".")
      return assassin
    case 2: // healer
      let healer = Healer(name: uniqueCharacterName())
      print("Added a Healer to the team with the name \"\(healer.name)\".")
      return healer
    case 3: // giant
      let tank = Tank(name: uniqueCharacterName())
      print("Added a Tank to the team with the name \"\(tank.name)\".")
      return tank
    case 4: // dwarf
      let archer = Archer(name: uniqueCharacterName())
      print("Added an Aecher to the team with the name \"\(archer.name)\".")
      return archer
    case 5: // Elementary Of Ice
      let mage = Mage(name: uniqueCharacterName())
      print("Added a Mage to the team with the name \"\(mage.name)\".")
      return mage
    default:
      return nil
    }
  }
  
  // Create the team with 3 characters
  private func createCharacters() -> [Character]? {
    var characters = [Character]()
    for _ in 0..<3 {
      guard let character = createCharacter() else { return nil }
      characters.append(character)
    }
    return characters
  }
  
  // Create a team
  private func createTeam() -> Team? {
    let team = Team()
    guard let characters = createCharacters() else { return nil }
    team.characters = characters // import array 'characters' of class Team
    return team
  }
  
  // Create several teams
  func createTeams() {
    var numberOfTeams = 0
    print("")
    print("==============================")
    print("@@@@  🆕 New Game !!! 🆕  @@@@")
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
      arrayTeams.append(team)
    }
  }
  
  // check if the name of the character already exists
  private func uniqueCharacterName() -> String {
    print("Choose the name of your character :")
    var characterName = ""
    repeat {
      if let data = readLine() {
        characterName = data
        if checkName.contains(characterName) {
          print("⚠️ The name: '\(characterName)' already exists !")
          print("Please enter a new name.")
          characterName = ""
        } else {
          checkName.append(characterName)
        }
      }
    } while characterName == ""
    return characterName
  }
} // END class TeamFactory
