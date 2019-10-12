import os, osproc, parseopt

import rainbow

const
  version = "0.0.1"

let doc = """
Cliff. Toy cli App.

Usage:
  cliff play
  cliff create
  cliff run
  

Options:
  -h --help         Show this screen.
  -v --version      Show the version.

Available commands:
  create            Generate a folder and files
  emoji             An emoji Bear(so sweet!🍬🐻)
  play              Just Play something nice!⛰️💓
  run               Let's say run starts a server.
"""

let play = """
          _               _               _              _               _      
        /\ \             _\ \            /\ \           /\ \            /\ \    
       /  \ \           /\__ \           \ \ \         /  \ \          /  \ \   
      / /\ \ \         / /_ \_\          /\ \_\       / /\ \ \        / /\ \ \  
     / / /\ \ \       / / /\/_/         / /\/_/      / / /\ \_\      / / /\ \_\ 
    / / /  \ \_\     / / /             / / /        / /_/_ \/_/     / /_/_ \/_/ 
   / / /    \/_/    / / /             / / /        / /____/\       / /____/\    
  / / /            / / / ____        / / /        / /\____\/      / /\____\/    
 / / /________    / /_/_/ ___/\  ___/ / /__      / / /           / / /          
/ / /_________\  /_______/\__\/ /\__\/_/___\    / / /           / / /           
\/____________/  \_______\/     \/_________/    \/_/            \/_/        

"""

let emoji = """
⁣🐻🐻🐻🐻🐻          🐻🐻🐻🐻🐻
🐻🌸🌸🌸🐻          🐻🌸🌸🌸🐻
🐻🌸🌸🌸🐻          🐻🌸🌸🌸🐻
  🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻
  🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻
🐻🐻🐻🐻🐻🐻🐻🐻⁣🐻🐻🐻🐻🐻🐻🐻
🐻🐻🐻🐻🐻🎱🐻🐻🐻🎱🐻🐻🐻🐻🐻
🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻🐻
🐻🐻🐻🐻🐻🍞🍞🍞🍞🍞🐻🐻🐻🐻🐻
🐻🐻🐻🐻🍞🍞🌑🌑🌑🍞🍞🐻🐻🐻🐻
🐻🐻🐻🐻🐻🍞🍞🌑🍞🍞🐻🐻🐻🐻🐻
  🐻🐻🐻🐻🐻🍞🍞🍞🐻🐻🐻🐻🐻
"""


proc main() =
  for kind, key, val in getopt():
    case kind:
    of cmdEnd: doAssert(false)
    of cmdShortOption, cmdLongOption:
      case key
      of "v", "version": 
        echo version
        quit()
      of "h", "help": 
        echo doc.rfGold1
        quit()
      else:
        echo "Not exist option".rfRed2
        quit()
    of cmdArgument:
      case key
      of "play": 
        echo play.rfLightGreen1
      of "emoji":
        echo emoji
      of "create": 
        discard 
      of "run": 
        discard 
      else: 
        echo "Not exist command".rfRed2

when isMainModule:
  main()

