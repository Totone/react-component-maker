#####################################################################
#                        Created by TOTONE                          #
#####################################################################
#                                                                   #
#                  Feel free to use or modify it                    #
#         It is free but you can help me to fill my stomach         #
#                  if you think I deserve it !=D                    #
#                                                                   #
#                                                       From Totone #
#                                                      To everydoby #
#####################################################################

#!/bin/bash

fillIndex() {
  indexList=(
    "import $1 from './$1-view'"
    ""
    "export default $1"
  )

  for indexLine in "${indexList[@]}"
  do
    echo -e $indexLine >> $2
  done
}

fillView() {
  viewList=(
    "import React from 'react'"
    "import './$1.scss'"
    ""
    "const $1 = () => {"
    "\treturn <p>$1 exists</p>"
    "}"
    ""
    "export default $1"
  )

  for viewLine in "${viewList[@]}"
  do
    echo -e $viewLine >> $2
  done
}

fillContainer() {
  containerList=(
    "import React from 'react'"
    "import View from './$1-view'"
    ""
    "const $1 = () => {"
    "\treturn ("
    "\t\t<View />" 
    "\t)"
    "}"
    ""
    "export default $1"
  )

  for containerLine in "${containerList[@]}"
  do
    echo -e $containerLine >> $2
  done
}

pathToComponentsFolder="./src/components"
reactExt="jsx"
styleExt="scss"


if [ -z $1 ]; then
  echo "Choose a name for the component:"
  read compName 
else
  compName=$1
fi

if [ -d "$pathToComponentFolder/$compName" ]; then
  echo "$compName already exists as a component. Abort ..."
else
  indexFilename="index.$reactExt"
  viewFilename="$compName-view.$reactExt"
  containerFilename="$compName-container.$reactExt"
  styleFilename="$compName.$styleExt"

  newCompPath="$pathToComponentsFolder/$compName"
  mkdir "$newCompPath"

  fillIndex $compName "$newCompPath/$indexFilename"
  fillView $compName "$newCompPath/$viewFilename"
  fillContainer $compName "$newCompPath/$containerFilename"
  touch "$newCompPath/$styleFilename"
  
  echo "New component $compName created !"
fi
