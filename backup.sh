location="$HOME/.dotfiles/"
back_file=("/home/evoprime/.bashrc" "/home/evoprime/.blerc" "/home/evoprime/.tmux.conf")
back_dirs=("sioyek" "scripts" "rofi" "ranger" "polybar" "picom" "nvim" "mpv" "kitty" "icc" "i3status" "i3" "dunst" "cava")

dconf dump / > dconf-settings

cd $location
for files in ${back_file[@]};do 
	rsync -a $files .
done

for dirs in ${back_dirs[@]};do 
	rsync -a --delete "/home/evoprime/.config/$dirs" .
done

git add .
git commit -am "v$(date +"%m.%d")"
git push
echo "VScode profiles not backuped"
cd -
