#!/bin/bash
# xbin: version 1.3
# by craig carter, 2017
echo ":: xbin_install: checking version"
cd ~/

# check if the currnet version is installed
if [ -e ~/.xbin/xbin ]; then
	version_check=`sed -n 2p ~/.xbin/xbin`
	echo ":: xbin_install: current version: $version_check"
	if [ $version_check = "#v1.3" ]; then
		echo ":: xbin_install: xbin version 1.3 already installed"
		exit
	else
		echo ":: xbin_install: installation started"
	fi
fi
#### - create .xbin directory - ####
if [ -e ~/.xbin ]; then
  echo ":: xbin_install: xbin folder exists"
  exit
else
  mkdir ~/.xbin
  echo ":: xbin_install: xbin folder created"
  mkdir ~/.xbin/resources
  echo ":: xbin_install: resources folder created"
fi

#### - create help file - ####
touch ~/.xbin/resources/help.txt
cat <<'EOF' >> ~/.xbin/resources/help.txt
:: version: 1.3 by craig carter, 2017
:: ALERT:   all apps to be transferred must be located in the home directory
> 1. open    this will open the .xbin folder in finder
> 2. -ls    gives a list of all files in .xbin
> 3. -l      moves file from current directory into .xbin
> 4. -r      removes file from .xbin and places it in the home directory
> 5. man     prints out a list of all possible comannds
:: all files to be moved must be placed in the home directory
:: and all files removed will be placed in same location
EOF

#### - create xbin program - ####
if [ -e ~/.xbin/xbin ]; then
  echo ":: xbin_install: xbin exists"
  exit
else
	touch ~/.xbin/xbin
	cat <<'EOF' >> ~/.xbin/xbin
#!/bin/bash
#v1.3
#open function:
	if [ "$1" = "open" ]; then
		open ~/.xbin
#list function:
	elif [ "$1" = "-ls" ]; then
		echo ":: xbin: list:"
		ls ~/.xbin
#load function:
	elif [ "$1" = "-l" ]; then
		if [ -e ~/.xbin/$2 ]; then
			echo ":: xbin: error"
		else
			sudo mv $2 ~/.xbin/$2
			echo ":: xbin: $2 loaded"
		fi
#remove function:
	elif [ "$1" = "-r" ]; then
		if [ -e ~/.xbin/$2 ]; then
			sudo mv ~/.xbin/$2 ~/$2
			echo ":: xbin: $2 removed"
		else
			echo ":: xbin: error"
		fi
#delete function:
	elif [ "$1" = "-del" ]; then
		if [ -e ~/.xbin/$2 ]; then
			sudo rm ~/.xbin/$2
			echo ":: xbin: $2 deleted"
		else
			echo ":: xbin: error"
		fi
#convert function:
	elif [ "$1" = "-c" ]; then
		file_name=$(echo $2 | cut -f 1 -d '.')
		sudo cp ~/$2 ~/$file_name
		sudo chmod +x ~/$file_name
		echo ":: xbin: $file_name converted"
#help function:
	elif [ "$1" = "help" ]; then
		echo ":: xbin: help:"
		cat ~/.xbin/resources/help.txt
		echo
	else
		echo ":: xbin: unknown input, please see help"
	fi
EOF
chmod +x ~/.xbin/xbin 
echo ":: xbin_install: xbin installed"
fi

if grep -q 'export PATH=$PATH":$HOME/.xbin"' ~/.bash_profile; then
	echo ":: xbin_install: bash profile up to date"
	exit
else
	echo "#### - xbin: package manager - ####" >> ~/.bash_profile
	echo 'export PATH=$PATH":$HOME/.xbin"' >> ~/.bash_profile
	echo "#### - xbin: package manager - ####" >> ~/.bash_profile
	echo ":: xbin_install: bash profile updated"
fi
echo ":: xbin_install: complete"
