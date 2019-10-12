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
  play              Just Play something nice!
  run               Let's say run starts a server.
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
        echo doc
        quit()
      else:
        echo "Not exist option".rfRed2
        quit()
    of cmdArgument:
      case key
      of "play": 
        echo "This is just to play!".rfTan
      of "create": 
        discard 
      of "run": 
        discard 
      else: 
        echo "Not exist command".rfRed2

when isMainModule:
  main()

