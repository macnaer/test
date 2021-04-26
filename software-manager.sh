#! /bin/bash
clear


function Menu(){
  echo -e "1. Search\n2. Install\n3. Delete\n0. Exit "
  read choice

  case "$choice" in
     0) exit=1; echo "Bye" ;;	  
     1) Search; ;;
     2) Install; ;;
     3) Delete; ;;
     *) echo "Wrong choice." ;;
  esac
}

function Delete(){
  clear
  echo "Enter packet name: "
  read name
  sudo apt -y remove $name
}

function Install(){
  clear
  echo "Enter packet name: "
  read name
  sudo apt -y install $name
}

function Search(){
  clear
  echo "Enter packet name: "
  read packetName

  sudo apt search $packetName
}

exit=0

while [[ $exit == 0  ]]
do
  Menu;
done
