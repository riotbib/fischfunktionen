function flac2mp3
    	echo "Converting all flac files to mp3 in the following folder: "
    	pwd
    	echo "Enter new folder name and press [ENTER]: "
    	read -p "" foldername
    	set foldername (echo "$foldername" | sed 's/ /\\ /g')
    	mkdir ../$foldername
    	for a in (find . -type f -iname "*.flac");
    		set int (string trim -l -c=./ $a)
    		set name (string trim -r -c=.flac $int)
    		set name (echo "$name" | sed 's/ /\\ /g')
    		echo "Converting" $name
    		ffmpeg -hide_banner -loglevel panic -i "$a" -b:a 320000 ../$foldername/$name.mp3
    	end
	echo "Finished"
end
