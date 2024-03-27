back_file=("/home/evoprime/.bashrc" "/home/evoprime/.tmux.conf")
back_dirs=("sioyek" "scripts" "rofi" "ranger" "polybar" "picom" "nvim" "mpv" "kitty" "icc" "i3status" "i3" "dunst" "cava")

dconf dump / > dconf-settings

for files in ${back_file[@]};do 
	cp $files .
done

for dirs in ${back_dirs[@]};do 
	cp -r "/home/evoprime/.config/$dirs" .
done

git commit -am "$(date +"%m.%d")"
git push
echo "VScode profiles not backuped"
