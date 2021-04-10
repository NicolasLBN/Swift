import Foundation

class Game {
  
  //Vars
  private var Loop = true
  private var battleEnd = false
  private var teamArray = [Team]() // array of the teams

  //Methodes
  // function for start game
  func start() {
    var choiceUser = 0
    repeat {
      welcome()
      repeat {
        if let data = readLine() {
          if let dataToInt = Int(data) {
            choiceUser = dataToInt
          }
        }
      } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4 && choiceUser != 5
      
      switch choiceUser {
      case 1: // New game with reset of variables and creation of the teams
        Loop = true
        battleEnd = false
        let teamManagment = TeamManagment()
        teamManagment.createTeams()
        teamArray = teamManagment.teamArray // import teamArray of class TeamFactory
      case 2: // Show the teams: statistics and equipment for each champion.
        listTeams()
      case 3: // Start the battle
        battle()
        endOfBattle()
      case 4: // Show the teams and the winner to the end of game
        resumeGame()
      case 5: // Exit of game
        exitGame()
      default:
        break
      }
      choiceUser = 0
    } while Loop
  }
  
  // Interface to display the starting menu
  private func welcome() {
    print("")
    print("=======================================================================")
    print("                         Battle of warriors               ")
    print("=======================================================================")
    print("Choose a number between 1 and 5 to do an action :")
    print("-----------------------------------------------------------------------")
    print("1. New Game : Creation of the teams. ")
    print("2. Show the teams created : statistics and equipment for each champion.")
    print("3. Start the fight. ")
    print("4. Show the teams and the winner.")
    print("5. Exit the Game. ")
    print("=======================================================================")
  }

  // display the teams and life points of the champions
  private func listTeams() {
    if teamArray.count == 0 {
      print("Sorry no team has been created !")
    } else {
      for i in 0..<teamArray.count {
        print("====================")
        print("List of the team \(i+1) :")
        print("--------------------")
        let team = teamArray[i]
        team.displayTeam()
      }
    }
  }

  private func battle() {
    if teamArray.count == 0 {
      print(" Sorry no team has been created !")
    } else if battleEnd == true {
      print(" ")
      print("🚩The game is ended ! Please select a new game.")
    } else {
      startBattleDisplay() // display the start menu of the battle
      
      var mychampion: Champion
      repeat {
        for nbTeam in 0..<teamArray.count {
          choiceMychampion(nbTeam: nbTeam) // Choose a champion of the team to attack the enemy of the other team
          mychampion = teamArray[nbTeam].champions[choiceUser() - 1]
          
          if mychampion.life > 0 {
              if let healer = mychampion as? Healer { // check if the champion is a healer
                HealerHeal(healer: healer, nbTeam: nbTeam)
              } else {
                // attack enemy
                if nbTeam == 0 {
                  let myTeamEnemy = teamArray[nbTeam+1]
                  fightAttack(mychampion: mychampion, myTeamEnemy: myTeamEnemy, nbTeam: nbTeam)
                  if myTeamEnemy.isDead() { // check if the enemy is dead
                    return
                  }
                } else {
                  let myTeamEnemy = teamArray[nbTeam-1]
                  fightAttack(mychampion: mychampion, myTeamEnemy: myTeamEnemy, nbTeam: nbTeam)
                  if myTeamEnemy.isDead() {
                    return
                  }
                }
              }
             
  
          } else {
            displaychampionIsDead(mychampion: mychampion) // display that the chosen champion is already dead
          }
        } // END of loop for in
      } while battleEnd == false
    }
  }
  
  // display the start menu of the battle
  private func startBattleDisplay() {
    print("==================================")
    print("   The battle starts !   ")
  }

    
  // Choose a champion of the team to attack the enemy of the other team
  private func choiceMychampion(nbTeam: Int) {
    print("==================================")
    print("Turn of player \(nbTeam+1) - Team \(nbTeam+1):   ")
    print("==================================")
    let team = teamArray[nbTeam]
    team.displayTeam()
    print("====================================================")
    print("Player \(nbTeam+1) : What champions do you choose to fight ?")
    print("----------------------------------------------------")
  }
  
  // Choose a champion of the team to heal him
  private func HealerHeal(healer: Healer, nbTeam: Int) {
    teamArray[nbTeam].displayTeam()
    print("===============================================")
    print("   Choose a champion of your team you want to heal:  ")
    print("-----------------------------------------------")
    let mychampion = teamArray[nbTeam].champions[choiceUser() - 1]
    healer.heal(champion: mychampion)
  }
  
  // Choose a champion enemy of the other team to attack
  private func fightAttack(mychampion: Champion, myTeamEnemy: Team, nbTeam: Int) {
    print("========================================================")
    print("   Choose a champion from the opposing team to attack:  ")
    print("--------------------------------------------------------")
    
    switch nbTeam {
    case 0:
      teamArray[nbTeam+1].displayTeam()
      let myEnemy = myTeamEnemy.champions[choiceUser() - 1]
      mychampion.attack(champion: myEnemy)
    case 1:
      teamArray[nbTeam-1].displayTeam()
      let myEnemy = myTeamEnemy.champions[choiceUser() - 1]
      mychampion.attack(champion: myEnemy)
    default:
      break
    }
  }

  // display that the chosen champion is already dead and can no longer attack
  private func displaychampionIsDead(mychampion: Champion) {
    print("-------------------------------------------------------------------------------------")
    print("   Sorry the \(mychampion.type) \"\(mychampion.name)\" is already dead and cannot attack !!!   ")
    print("-------------------------------------------------------------------------------------")
  }
  
  // allows the user to choose a champion of the team between 1 and 3
  private func choiceUser() -> Int {
    var championChoice = 0
    repeat {
      if let data = readLine() {
        if let dataToInt = Int(data) {
          championChoice = dataToInt
        }
      }
    } while championChoice != 1 && championChoice != 2 && championChoice != 3
    return championChoice
  }
  
    // Confirm the end of the battle with isbattleEnd = true
  private func endOfBattle() {
    for i in 0..<teamArray.count {
      let team = teamArray[i]
      if team.isDead() == true && teamArray.count != 0 {
        battleEnd = true
      }
    }
    resumeGame() // display the teams and the winner at the end of the game
  }

    // check and display the winner
  private func displayWinner() {
    for i in 0..<teamArray.count {
      let team = teamArray[i]
      if team.isDead() == false {
        print("-------------------------------------------------------")
        print("   Player \(i+1) - Team \(i+1) : You win !!!   ")
        print("-------------------------------------------------------")
      }
    }
  }
  
  // display the teams and the winner at the end of the game
  private func resumeGame() {
    if teamArray.count == 0 {
      print("Thanks select \"New Game\" ")
    } else if teamArray.count != 0 && battleEnd == false {
      print("No winner because the game has not started - Thanks to select \"Start the battle\" ")
    } else {
      print("================================================")
      print("         END OF GAME         ")
      print("------------------------------------------------")
      listTeams() // display teams at the end of the game
      displayWinner()
    }
  }
  
  
  // check if the team have been created and the user can choose to continue or no
  private func exitGame() {
    var userExit = 0
    if teamArray.count == 0 || battleEnd == true {
      print(" ➡︎ Exit of game")
      Loop = false
    } else {
      print("Do you really want to quit the game ?")
      print("1 - Yes")
      print("2 - No")
      repeat {
        if let data = readLine() {
          if let dataToInt = Int(data) {
            userExit = dataToInt
          }
        }
      } while userExit != 1 && userExit != 2
    
      switch userExit {
      case 1:
        print(" Exit of game")
        Loop = false
      case 2:
        print(" Continue the game")
        Loop = true
      default:
        break
      }
      userExit = 0
    }
  }
} // END class Game
