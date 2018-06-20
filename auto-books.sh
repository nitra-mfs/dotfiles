#! /bin/bash

#exec > /root/books.log 2>&1 

trap 'cd / && umount -v /media/auto-books && echo Unmounted the disk ...' EXIT

warn() {

	echo "$@" 1>&2 

}


mount_disk() {

	local DD_UUID="/dev/disk/by-uuid/2de6660a-036a-447d-912f-eed0882e3f31"
	if [ ! -d "/media/auto-books" ]
	then
		warn "No /media/auto-books found, creating it ..."
		mkdir -p /media/auto-books
	fi

	if ! lsblk | grep auto-books >/dev/null
	then
		if ! [ -b $(readlink $DD_UUID) ]
		then
			mount -v -t ext4  $DD_UUID /media/auto-books
			local res=$?
			return $(( res ))
		else
			echo "The disk is not inserted ..."
			/bin/false
			return $?
		fi
	fi

}
	
check_connection() {

	nc -z yahoo.com 80 >/dev/null 2>&1
	local res=$?
	return $(( res )) 
}

main() {

	local doc_url="http://doc.layout.org/"
	local book_list=(programmation/C/ programmation/C++/ programmation/asm/ programmation/AWK/ security/Cryptographie\\\ .\\\ Algorithmes\\\ .\\\ Steganographie/ operating\\\ system\\\ /linux/ operating\\\ system\\\ /Xen/ Others/cheat-sheets/ Others/Game\\\ Development/Programming/)
	while /bin/true
	do
		while ! check_connection
		do
			echo "Waiting for connection ..."
			sleep 30
		done

		while ! mount_disk
		do
			echo "Waiting for disk to be mounted ..."
			sleep 30
		done

		pushd "/media/auto-books" >/dev/null

		local done=1
		
		for ((i = 0; i < ${#book_list[@]}; i++))
		do
			echo "Downloading ${doc_url}${book_list[$i]} ..."
			echo "${book_list[$i]}"
			wget -r -nc -R "*index.html*"-np 
			http://doc.lagout.org/programmation/C/ 
			https://doc.lagout.org/programmation/C++/
		       	https://doc.lagout.org/programmation/asm/
		       	https://doc.lagout.org/programmation/AWK/ 
			https://doc.lagout.org/security/Cryptographie\ .\ Algorithmes\ .\ Steganographie/ 
			https://doc.lagout.org/operating\ system/linux/ 
			https://doc.lagout.org/operating\ system/Xen/ 
			https://doc.lagout.org/Others/Game\ Development/Programming/ 
			|| echo "Failed to download ${doc_url}${category} ..." && done="0" && break
		done
		if [ $res ]
		then
			popd
			echo "Unmounting disk ..."
			umount /media/auto-books
			echo "All done exiting ..."
			exit 0
		fi
		echo "The command didn't finish starting the look again ..."
		popd >/dev/null
	done

}

main
