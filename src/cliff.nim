import os, osproc, parseopt

import rainbow

const
  version = "0.2.0"

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

proc createFolder*(siteName: string) =
  let
    dir = getCurrentDir()
    projectDir = joinPath(dir, "Folder")
    textFile = joinPath(projectDir, "info.txt")
    
 

  block createProjectDir:
    if not existsDir(projectDir):
      createDir(projectDir)
    echo "Folder -->".rfMagenta5

  
  block createTextTxt:
    var
      file: File = open(textFile, FileMode.fmWrite)
      infoTxt: string = "This Works!!!"
    defer:
      close(file)
      echo "\t|-- info.txt".rfGold3
    file.writeLine(infoTxt)

proc startFolder() =
  var dir = getCurrentDir()
  createFolder("Folder")
  echo "Folder has created!!".rfSeaGreen2



proc main() =
  for kind, key, val in getopt():
    case kind:
    of cmdEnd: doAssert(false)
    of cmdShortOption, cmdLongOption:
      case key
      of "v", "version": 
        echo version.rfCyan1
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
      of "create": startFolder()
      of "run": 
        discard 
      else: 
        echo "Not exist command".rfRed2

when isMainModule:
  main()



