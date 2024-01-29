COLOR=0x000000
while [ 1 ];
do
	echo $COLOR
	ratbagctl "Logitech G102 LIGHTSYNC Gaming Mouse" led 0 set color $COLOR
	((COLOR+=100))
done
