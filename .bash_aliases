## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

#Shows history of commands
alias h='history'

#Shows ports being used
alias ports='netstat -tulanp'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Open bashrc file in VSCode and once editing is completed, refresh the terminal
alias bashrc='code ~/.bashrc ~/.bash_aliases ; source ~/.bashrc'

#Recently updated files last
alias lst='ls -ltr'

# Only show hidden files
alias la='ls -l -d .[!.]?*' 

# show files only
alias lf="ls -l | egrep -v '^d'" 

# show directories only
alias ldir="ls -l | egrep '^d'" 

# reloads the prompt, usefull to take new modifications into account
alias reload="source ~/.bash_profile"

# only show dot/hidden files/Second Method
#alias lsh="ls -ld .??*"


#change to a directory and list all its contents
cdl() { cd "$@"; ls; }

# make a directory and cd to it
mcd()
{
    test -d "$1" || mkdir "$1" && cd "$1"
}

# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Returns the last 2 fields of the working directory

pwdtail ()
{
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}


function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
	read -p "'$x' is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

# Find a file from the current directory
alias ff='find . -name '



# perform 'ls' after 'rm' if successful.
rmls() {
  rm -frdv "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}


# create a copy of vanilla babel
function vanilla { cp -R /home/jax/AltCampus/vanilla_babel "$@" && cd "$1"; }

#create react project and CD into it.
function crapp { cp -R /home/jax/AltCampus/crapp_raw "$@" && cd "$1" && rmls .git; }



# Webshare python
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
