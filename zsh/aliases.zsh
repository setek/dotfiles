alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Directory navigation
alias ..2='../../'
alias ..3='../../../'
alias ..4='../../../../'
alias ..5= '../../../../../'
alias ..6= '../../../../../../'
alias ..a= 'cd -'

# Network bounce 
alias networkbounce='sudo networksetup -setv4off Wi-Fi;sudo  networksetup -setdhcp Wi-Fi'

#
# My aliases
#

alias la='ls -laFGh'
alias ld='echo "ls -flFGhd --color=always test\n" && ls -flFGhd --color=always'
alias f='echo "grep -IrisHn -C 3 --color=always test ./\n" && grep -IrisHn -C 3 --color=always'

alias get='echo "curl -o \"#1.jpg\" http://www.url.com/images/[001-100].jpg \n" && curl -o'
alias ytd='echo "youtube-dl https://www.youtube.com/watch\?v=VIDEO_ID\nRemember to put a \ before the ? when you paste the Youtube URL\n(for Mac, Windows doesn’t need)\n" && youtube-dl'
alias ytda='echo "youtube-dl -x --audio-format mp3 https://www.youtube.com/watch\?v=VIDEO_ID\nRemember to put a \ before the ? when you paste the Youtube URL\n(for Mac, Windows doesn’t need)\n" && youtube-dl -x --audio-format mp3'

alias flushdns='dscacheutil -flushcache'
alias showlib='chflags nohidden ~/Library'
alias maintain='sudo periodic daily weekly monthly'

alias cm='echo "rm -rf node_modules package-lock.json\n" && rm -rf node_modules package-lock.json'
alias ss='http-server .'
alias arti='echo "AD Username: " && read AD_LOGIN && echo "AD Password: " && read -s AD_PASSWORD && curl -u "$AD_LOGIN:$AD_PASSWORD" https://artifactory.foxsports.com.au/api/npm/auth | sed -n "1p" | sed -e "s,_auth = ,,g" | read authstr && printf "{\n  \"auths\" : {\n    \"https://artifactory.foxsports.com.au:5003\" : {\n      \"auth\" : \"" >! ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"artifactory.foxsports.com.au:5001\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"https://artifactory.foxsports.com.au:5001\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"artifactory.foxsports.com.au:5003\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    }\n  }\n}" >> ~/.docker/config.json && unset -v authstr && unset -v AD_LOGIN AD_PASSWORD authstr'

alias runtests='echo "grunt build-tests && testem ci -f test/testem-ci.json -R tap"; grunt build-tests && testem ci -f test/testem-ci.json -R tap'

alias sydtime='sudo systemsetup -settimezone Australia/Sydney'
alias pertime='sudo systemsetup -settimezone Australia/Perth'

alias nw='npm-why'

alias porto='echo "sudo lsof -PiTCP -sTCP:LISTEN\n" && sudo lsof -PiTCP -sTCP:LISTEN'
alias porti='echo "sudo lsof -i :8080\n" && sudo lsof -i'
alias portk='echo "kill PID, kill -2/-1/-9 PID\n" && kill'

alias nrb='echo "npm run build\n" && npm run build'
alias nrbw='echo "npm run build && npm run watch\n" && npm run build && echo "\n\n\n\n\n\n\n\n\n\n----- RUNNING WATCH NOW ------\n\n\n\n\n\n\n\n\n\n" && npm run watch'
alias nrw='echo "npm run watch\n" && npm run watch'

alias addmui='echo "npm i --save \"@kayo/mui@git+ssh://git@bitbucket.foxsports.com.au:7999/mar/mui.git#COMMIT_HASH\"\n" && npm i --save "@kayo/mui@git+ssh://git@bitbucket.foxsports.com.au:7999/mar/mui.git#$1"'

alias viza='echo "npm run viz:golden\n" && npm run viz:golden'
alias viz='echo "npm run viz:specified TEST_NAME\n" && npm run viz:specified'

alias getperms='echo "stat -f \"%OLp\"\n" && stat -f "%OLp"'

alias grw='echo "grunt watcher\n" && grunt watcher'
alias grd='echo "grunt default\n" && grunt default'
alias grdw='echo "grunt default && grunt watcher\n" && grunt default && echo "\n\n\n\n\n\n\n\n\n\n----- RUNNING WATCHER NOW ------\n\n\n\n\n\n\n\n\n\n" && grunt watcher'
