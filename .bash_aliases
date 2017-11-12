# some useful alias
alias	vi='vim'
alias	ss='sudo su -'
alias	s='ssh'
alias	ps='ps auxx'
alias	g='grep -i --color=always'
alias	gr='grep -r'
alias	G='grep --color=always'
alias	p='ping'
alias	m='more'
alias	t='telnet -8'
alias	more='less -R'
alias	less='less -R'
alias	lless='less -L'
alias	svi='sudoedit'
alias	rm='rm -i'
alias	cp='cp -i'
alias	mv='mv -i'
#alias man='PAGER=most man '

# alias for aptitude
alias	di='sudo aptitude install'
alias	ds='aptitude search'
alias	dw='aptitude show'
alias	dcc='sudo aptitude purge'
alias	dr='sudo aptitude remove'
alias	dn='sudo aptitude update'
alias	up='sudo aptitude safe-upgrade'

# alias for sm package
alias	sm='sm XD'

# alias for ntpdate, use sinica server
alias	ntpdate='sudo ntpdate stdtime.sinica.edu.tw'

# misc commands
alias	nmap='sudo nmap -sS -O'
alias	aesc='aespipe -e aes256 -H sha512 -T'
alias	aesd='aespipe -e aes256 -H sha512 -T -d'
alias	fb2u='convmv -f big5 -t utf8'
alias	cb2u='iconv -f big5 -t utf8'
alias	cu2b='iconv -f utf8 -t big5'
alias	mplayer='mplayer -unicode'
alias	noping='sudo iptables -A INPUT -p icmp --icmp-type 8 -j DROP'
alias	swsh='sudo dpkg-reconfigure --terse -f readline dash'
alias	cs='cscope -R -k -b -q'
alias	indent='indent -npro -kr -i4 -sob -l80 -ss -ncs -cp1 -il0 -nut -ts4'
alias	mkdl="find \/home\/socrates\/work1\/resources\/dl -maxdepth 1 -type f| awk '{print \"ln -s \" \$1}'| sh"
alias	updl='find . -maxdepth 1 -type f -exec cp -n {} ~/work1/resources/dl/ \;'
alias	minicom='LC_ALL=C LANG=C minicom -c on'
alias	rmesc='sed -r s/\x1b\[[^@-~]*[@-~]//g'
alias	tmux='TERM=xterm-256color tmux'

# alias for rsync, for backup system
alias	rss='rsync -azvrla --delete /home/socrates/documents/ 140.115.25.26:/home/socrates/documents/'
alias	rsd='rsync -azvrla --exclude-from=/media/exclude_rsync --delete /home/socrates /media/Backup/laptop/'
alias	rs='rsync -azvrla --delete socrates@140.115.25.26:/home/socrates/documents/ /home/socrates/documents/'

# alias for ssh
alias	s2ptt='ssh bbs@ptt.cc'
alias	s2q='ssh 10.235.49.224'
alias	s2s='ssh git@10.2.128.23'
alias	s2mys='ssh socrates@10.2.129.128'

# mount smb
alias	mountoa='sudo mount -t cifs -o 'username=socrates.wei,password=ji3g4go6@@@,domain=delta.corp,uid=1000' //twtp2pc0009/socrates_oa /media/smb'
alias	mount_sshfs='sshfs mynb:/media/socrates/share /mnt/mynb_share/'

# tunnels
alias	tn2ncu='autossh -M 11500 -NfR 2222:localhost:22 socrates@140.115.26.14'
alias	tn2m='autossh -M 8888 -N -f -C -D 8080 socrates@140.115.26.14'

# x clipboard
alias sclip='xclip -selection c'
alias gclip='xclip -selection c -o'
