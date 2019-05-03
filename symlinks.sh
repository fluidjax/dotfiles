

CONFIGS=~/dotfiles/configs                    # dotfiles directory
BACKUPDIR=~/dotfiles_old             # old dotfiles backup directory
mkdir -p $BACKUPDIR

cd $CONFIGS

for FILE in $CONFIGS/.*; do
      SHORTNAME="$(basename "$FILE")"
    if [ $SHORTNAME == "." ]; then
      # do nothing
      :
    elif [ $SHORTNAME == ".." ]; then
      # do nothing
      :
    else
      if [ -L ~/$SHORTNAME ]; then
         #its a symlink, so delete it
         rm ~/$SHORTNAME
      else
         #its a file back it up
         mv ~/$SHORTNAME $BACKUPDIR 
      fi
      echo "Installing $SHORTNAME"
      ln -s $FILE ~/$SHORTNAME 
    fi
done

