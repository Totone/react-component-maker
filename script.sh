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

#################
# SCRIPT INPUTS #
#################



pathToComponentsFolder="./src/components"
pathToViewsFolder="./src/views"
pathToLayoutComponent="components/GenericLayout"
reactExt="jsx"
styleExt="scss"



####################
# SCRIPT FUNCTIONS #
####################



fillIndex() {
  indexList=(
    "import React from 'react'"
    "import View from './$1-view'"
    "import Container from './$1-container'"
    ""
    "export default React.memo(View)"
  )

  for indexLine in "${indexList[@]}"
  do
    echo -e $indexLine >> $2
  done
}

fillView() {
  viewComponentList=(
    "import React from 'react'"
    "import './$1.scss'"
    ""
    "const $1 = () => {"
    "\treturn ("
    "\t\t<div className=\"${1,}\">"
    "\t\t\t$1 exists"
    "\t\t</div>"
    "\t)"
    "}"
    ""
    "export default React.memo($1)"
  )

  viewLayoutList=(
    "import React from 'react'"
    "import './$1.scss'"
    ""
    "import Layout from '$pathToLayoutComponent'"
    ""
    "const $1 = () => {"
    "\treturn ("
    "\t\t<Layout id=\"${1,}\">"
    "\t\t\t$1 exists"
    "\t\t</Layout>"
    "\t)"
    "}"
    ""
    "export default React.memo($1)"
  )

  if [ $3 = 'c' ]; then
    for viewLine in "${viewComponentList[@]}"
    do
      echo -e $viewLine >> $2
    done
  elif [ $3 = 'v' ]; then
    for viewLine in "${viewLayoutList[@]}"
    do
      echo -e $viewLine >> $2
    done
  else 
    exit 1
  fi
}

fillContainer() {
  containerList=(
    "import React from 'react'"
    "import View from './$1-view'"
    ""
    "const $1 = () => {"
    "\treturn ("
    "\t\t<View" 
    "\t\t\t"
    "\t\t/>" 
    "\t)"
    "}"
    ""
    "export default React.memo($1)"
  )

  for containerLine in "${containerList[@]}"
  do
    echo -e $containerLine >> $2
  done
}

fillStyle() {
  styleList=(
    "// @import 'src/assets/styling/';"
    ""
    ".${1,} {"
    "\t&--inner {"
    "\t\t"
    "\t}"
    "}"
  )

  for styleLine in "${styleList[@]}"
  do
    echo -e $styleLine >> $2
  done
}



##################
# SCRIPT RUNTIME #
##################


# Get component name
if [ -z $1 ]; then
  echo "Choose a name for the component:"
  read compName 
else
  compName=$1
fi

# Get component type
if [ -z $2 ]; then
  echo "Is this a component or a view ?"
  echo "Type 'v' to create a view, 'c' for a component"
  read compType
else
  compType=$2
fi

# Normalize $compName & $compType
compName=${compName^}
compType=${compType,}
compType=${compType::1}

# Get component folder path depending on its type
if [ $compType = "c" ]; then
  pathToContainingFolder=$pathToComponentsFolder
elif [ $compType = "v" ]; then
  pathToContainingFolder=$pathToViewsFolder
else
  echo "Incorrect value"
  exit 1
fi

# Create component data if doesn't exist in its folder
if [ -d "$pathToContainingFolder/$compName" ]; then
  echo "$compName already exists. Abort ..."
else

  ###################
  # Filename values #
  ###################

  # First compute files names
  indexFilename="index.$reactExt"
  viewFilename="$compName-view.$reactExt"
  containerFilename="$compName-container.$reactExt"
  styleFilename="$compName.$styleExt"

  # Create the new folder 
  newCompPath="$pathToContainingFolder/$compName"
  mkdir "$newCompPath"

  # And fill it with the files content
  fillIndex $compName "$newCompPath/$indexFilename" $compType
  fillView $compName "$newCompPath/$viewFilename" $compType
  fillContainer $compName "$newCompPath/$containerFilename" $compType
  fillStyle $compName "$newCompPath/$styleFilename" $compType
  
  # End
  echo "New component $compName created !"
fi
