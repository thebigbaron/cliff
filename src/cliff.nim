import os, osproc, parseopt

import rainbow

const
  version = "0.2.1"

let doc = """
Cliff. Toy cli App.

Usage:
  cliff [-n:folderName] or [--new:folderName] 
  

Options:
  -h --help         Show this screen.
  -v --version      Show the version.
  -n --new          Creates a Project

Available commands:
  emoji             An emoji Bear(so sweet!🍬🐻)
  play              Just Play something nice!💓 ⛰️
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

proc createFolder*(folderName: string) =
  let
    dir = getCurrentDir()
    projectDir = joinPath(dir, folderName)
    textFile = joinPath(projectDir, "info.txt")
    
 

  block createProjectDir:
    if not existsDir(projectDir):
      createDir(projectDir)
    echo folderName.rfMagenta5 & " -->".rfMagenta5

  
  block createTextTxt:
    var
      file: File = open(textFile, FileMode.fmWrite)
      infoTxt: string = "This Works!!!"
    defer:
      close(file)
      echo "\t|-- info.txt".rfGold3
    file.writeLine(infoTxt)

proc startFolder(folderName: string) =
  var dir = getCurrentDir()
  createFolder(folderName)
  echo folderName.rfSeaGreen2 & " has created!!".rfSeaGreen2



proc main() =
  for kind, key, val in getopt():
    case kind:
    of cmdEnd: doAssert(false)
    of cmdShortOption, cmdLongOption:
      case key
      of "v", "version": 
        echo version.rfCyan1
        quit()
      of "n", "new":
        startFolder(val.string)
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
      of "run": 
        discard 
      else: 
        echo "Not exist command".rfRed2

when isMainModule:
  main()



