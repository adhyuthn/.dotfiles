location="/home/.dotfiles/"
back_file=("/home/evoprime/.bashrc" "/home/evoprime/.blerc" "/home/evoprime/.tmux.conf")
back_dirs=("sioyek" "scripts" "rofi" "ranger" "polybar" "picom" "nvim" "mpv" "kitty" "icc" "i3status" "i3" "dunst" "cava")

dconf dump / > dconf-settings

for files in ${back_file[@]};do 
	cp $files .
done

for dirs in ${back_dirs[@]};do 
	cp -r "/home/evoprime/.config/$dirs" .
done

cd $location
git pull
git commit -am "v$(date +"%m.%d")"
git push
echo "VScode profiles not backuped"
cd -
