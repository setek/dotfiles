alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# Directory navigation
alias ..='function navigate() {
    CMD="";
    if [ ! $1 ]
    then
        X=1
    elif [ "$1" = "w" ]
    then
        X=$(($(pwd | grep -o "/" | grep -c "/")-4));
    else
        X=$1
    fi;

    if [ "$1" = "b" ]
    then
        CMD="cd -"
    else
        for ((I = 0; I < $X; I++));
        do
            CMD="$CMD../";
        done;
    fi;

    echo "$CMD";
    eval $CMD;
}; navigate'
alias x='function whereami() {
    DEEP=$(pwd | grep -o "/" | grep -c "/");

    pwd;
    echo "To root:\t$DEEP dirs";
    echo "To home:\t$(($DEEP-2)) dirs";
    echo "To workspace:\t$(($DEEP-4)) dirs";
}; whereami'

# Network bounce 
alias networkbounce='sudo networksetup -setv4off Wi-Fi;sudo  networksetup -setdhcp Wi-Fi'

#
# My aliases
#

# Brew aliases
brewi() {
    OPTIONS=("work" "home" "yezi" "default");
    select OPT in "${OPTIONS[@]}"; do
        if [ "$OPT" = "default" ]
        then
            CMD="brew bundle --file=~/.dotfiles/Brewfile";
            echo "Will install all the default stuffs in ~/.dotfiles/Brewfile"
        else
            CMD="brew bundle --file=~/.dotfiles/Brewfile-$OPT";
            echo "Will install the stuffs in ~/.dotfiles/Brewfile-$OPT"
        fi
        break;
    done;

    echo "$CMD\n";
    eval $CMD;
}

alias la='ls -laFGh'
alias ld='echo "ls -flFGhd --color=always test\n" && ls -flFGhd --color=always'
alias f='echo "grep -IrisHn -C 3 --color=always test ./\n" && grep -IrisHn -C 3 --color=always'

alias get='echo "curl -o \"#1.jpg\" http://www.url.com/images/[001-100].jpg \n" && curl -o'

ytd() {
    if [[ "$1" == https://www.youtube.com/watch* ]]
    then
        echo "Remember to put a \ before the ? when you paste the Youtube URL\n(for Mac, Windows doesn’t need)\n";
        OPTIONS=("Video in original format" "Audio only as mp3" "Recode video to mp4" "Cancel");
        CMD="youtube-dl ";
        select OPT in "${OPTIONS[@]}"; do
            case "$OPT" in
                "Video in original format")
                    break;;
                "Audio only as mp3")
                    CMD+="-x --audio-format mp3"
                    break;;
                "Recode video to mp4")
                    CMD+="--recode-video mp4"
                    break;;
                "Cancel")
                    echo "Exiting ...";
                    return 1;;
            esac
            break;
        done;
        CMD+=" ${1/\?/\\?}";
        echo "Running: $CMD\n";
        eval $CMD;
    else
        echo "Please enter a valid YouTube URL.\n\nExiting ...";
    fi;
}

alias ytda='echo "This alias is deprecated, you can just use ytd now for everything, yay!\n" && ytd'
alias ytdr='echo "This alias is deprecated, you can just use ytd now for everything, yay!\n" && ytd'

alias flushdns='dscacheutil -flushcache'
alias showlib='chflags nohidden ~/Library'
alias maintain='sudo periodic daily weekly monthly'

alias cm='echo "rm -rf node_modules package-lock.json\n" && rm -rf node_modules package-lock.json'
alias ss='http-server .'
alias arti='echo "AD Username: " && read AD_LOGIN && echo "AD Password: " && read -s AD_PASSWORD && curl -u "$AD_LOGIN:$AD_PASSWORD" https://artifactory.foxsports.com.au/api/npm/auth | sed -n "1p" | sed -e "s,_auth = ,,g" | read authstr && printf "{\n  \"auths\" : {\n    \"https://artifactory.foxsports.com.au:5003\" : {\n      \"auth\" : \"" >! ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"artifactory.foxsports.com.au:5001\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"https://artifactory.foxsports.com.au:5001\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    },\n    \"artifactory.foxsports.com.au:5003\" : {\n      \"auth\" : \"" >> ~/.docker/config.json && printf "$authstr" >> ~/.docker/config.json && printf "\"\n    }\n  }\n}" >> ~/.docker/config.json && unset -v authstr && unset -v AD_LOGIN AD_PASSWORD authstr'

# FUCKING DOCKER
alias fuckdock='echo "You’ve come to the right place.\n\ndocker login https://artifactory.foxsports.com.au:5001\n" && docker login https://artifactory.foxsports.com.au:5001'
alias dockfuck='echo "You haven’t come to the right place, but fuck it let’s dock fuck anyway.\n" && fuckdock'

alias sydtime='sudo systemsetup -settimezone Australia/Sydney'
alias pertime='sudo systemsetup -settimezone Australia/Perth'

alias nw='npm-why'

alias porto='echo "sudo lsof -PiTCP -sTCP:LISTEN\n" && sudo lsof -PiTCP -sTCP:LISTEN'
alias porti='echo "sudo lsof -i :8080\n" && sudo lsof -i'
alias portk='echo "kill PID, kill -2/-1/-9 PID\n" && kill'

alias nrw='echo "deprecated, use nr\n" && nr w'
alias niw='echo "deprecated, use nr\n" && nr ciw'

nr() {
    CMD="npm ";
    echo "npm some shit\n";
    if [ ! $1 ]
    then
        OPTIONS=("watch" "build:viz" "build:font-matrix" "lint");
        select OPT in "${OPTIONS[@]}"; do
            CMD+="$OPT";
            break;
        done;
    elif [ "$1" = "w" ]
    then
        CMD+="run watch";
    elif [ "$1" = "ciw" ]
    then
        CMD+="ci && npm run watch";
    elif [ "$1" = "bv" ]
    then
        CMD+="run build:viz";
    elif [ "$1" = "bf" ]
    then
        CMD+="run build:font-matrix";
    elif [ "$1" = "l" ]
    then
        CMD+="run lint";
    else
        CMD+="$1";
    fi;
    echo "Running: $CMD\n";
    eval $CMD;
}

y() {
    CMD="yarn ";
    echo "yarn some shit\n";
    if [ "$1" = "p" ]
    then
        CMD+="prod";
    elif [ "$1" = "t" ]
    then
        CMD+="test";
    elif [ "$1" = "tu" ]
    then
        CMD+="test -u";
    elif [ "$1" = "l" ]
    then
        CMD+="lint";
    else
        CMD+="dev";
    fi;
    echo "Running: $CMD\n";
    eval $CMD;
}

alias addmui='echo "deprecated, use addrepo\n" && addrepo'
alias addrepo='function addrepo() {
    echo "Add a bitbucket repo (default is ionic)\nUsage: addrepo (mui) (save|save-dev) (mar)\n\nCommit hash: ";
    read COMMIT;

    if [ ! $COMMIT ]
    then
        echo "Please enter a valid commit hash";
    else
        REPO=${1:-ionic};
        PROJECT=${3:-mar};
        PACKAGE="@kayo/$REPO@git+ssh://git@bitbucket.foxsports.com.au:7999/$PROJECT/$REPO.git#$COMMIT";

        if [ ! $2 ]
        then
            SAVE_TYPE="save";
        else
            SAVE_TYPE="save-dev"
        fi;

        echo "npm i --$SAVE_TYPE \"$PACKAGE\"\n";
        npm i --$SAVE_TYPE \"$PACKAGE\";
    fi;
}; addrepo'

# delete them goldens
alias rg='echo "rm -rf test/visual/screenshots/golden/\n" && rm -rf test/visual/screenshots/golden/'

alias viz='function viz() {
    echo "delete goldens && npm run viz:golden OR npm run viz:specified TEST_NAME\n";
    if [ ! $1 ]
    then
        rg && npm run viz:golden
    else
        npm run viz:specified $1
    fi;
}; viz'

# cli giphy selector!
giphy() {
    LIMIT=${2:-6};
    RESULTS=( $(curl --silent --fail -k "https://api.giphy.com/v1/gifs/search?api_key=SZbMIW8u9baDt2joBi5qGI9ef96QGxFK&limit=$LIMIT&offset=0&rating=&lang=en&q=$1" | jq -r '.data[] .images .downsized_large .url') );
    for ((i = 1; i <= $#RESULTS; i++)); do
        echo "giphy $i:";
        imgcat --url $RESULTS[$i];
        echo "------------------";
    done;
    select OPT in "${RESULTS[@]}"; do
        echo "$OPT" | pbcopy | open -a Slack;
        break;
    done;
}

# for versioning repos
alias v='function version_foxy_kayo() {
    if [ -f package.json ]; then
        echo "This repo: $(basename $(git rev-parse --show-toplevel)) is currently at $(git describe --tags --abbrev=0)";
    else
        print "No package.json detected in this directory"
        return 1;
    fi;

    if [ $1 ]
    then
        OPT="$1";
    else
        echo "Please choose how you’d like to version this repo:"
        OPTIONS=("major" "minor" "patch" "Abort, please");
        select OPT in "${OPTIONS[@]}"; do
            if [ "$OPT" = "Abort, please" ]
            then
                echo "Aborting...";
                return 1;
            fi;
            break;
        done
    fi;

    echo "Updating version with: $OPT"
    echo "Going to run the following commands:"
    echo "    git fetch"
    echo "    git checkout develop && git reset --hard origin/develop"
    echo "    npm version $OPT"
    echo "    git checkout master && git reset --hard origin/master"
    echo "    git merge develop"

    echo "I’ll ask again before pushing anything to remote. Go ahead and do it? (y/n)"
    while true; do
        read doit
        case $doit in
            [Yy]* )
                git fetch && git checkout develop && git reset --hard origin/develop && npm version $OPT && git checkout master && git reset --hard origin/master && git merge develop
                break;;
            [Nn]* )
                echo "Aborting...";
                return 1;;
            * )
                echo "Please choose y or n";;
        esac
    done

    echo "New version: $(git describe --tags --abbrev=0) tagged. Push develop & master to remote? (y/n)"
    while true; do
        read yn
        case $yn in
            [Yy]* )
                git push --tags && git push && git checkout develop && git push
                break;;
            [Nn]* )
                echo "Try to reset changes on local master/develop using:";
                echo "git co develop && git tag -l | xargs git tag -d && git fetch --tags"; # reset tags on develop
                echo "git co master && git reset --hard origin/master && git tag -l | xargs git tag -d && git fetch --tags"; # reset master to origin and reset tags
                return 1;;
            * )
                echo "Please choose y or n";;
        esac
    done
}; version_foxy_kayo'

alias et='function e2etest() {
    if [ ! $1 ]
    then
        echo "Package version [$1]:";
        read READ_PACKAGE_VER;
    fi;
    PACKAGE_VER=${READ_PACKAGE_VER:-$1};

    if [ ! $2 ]
    then
        echo "QA build number [$2]:"
        read READ_QA_BUILD_NUM;
    fi;
    QA_BUILD_NUM=${READ_QA_BUILD_NUM:-$2};

    if [ ! $3 ]
    then
        echo "Local [y]:"
        read READ_IS_LOCAL;
    fi;
    IS_LOCAL=${READ_IS_LOCAL:-y};
    TEST_TYPE="local";

    if [ "$IS_LOCAL" != "y" ]
    then
        TEST_TYPE="docker";
    fi;

    CMD="FISO_ENV=staging MARTIAN_CTV_WIDGETS_VERSION=$PACKAGE_VER-qa$QA_BUILD_NUM npm run e2e:$TEST_TYPE";

    echo "$CMD\n";
    eval $CMD;
}; e2etest'

# get chmod value of a thing
alias getperms='echo "stat -f \"%OLp\"\n" && stat -f "%OLp"'

# kill symantec endpoint protection
alias killsym='~/bin/sep stop'

# unused
alias runtests='echo "grunt build-tests && testem ci -f test/testem-ci.json -R tap"; grunt build-tests && testem ci -f test/testem-ci.json -R tap'
alias grw='echo "grunt watcher\n" && grunt watcher'
alias grd='echo "grunt default\n" && grunt default'
alias grdw='echo "grunt default && grunt watcher\n" && grunt default && echo "\n\n\n\n\n\n\n\n\n\n----- RUNNING WATCHER NOW ------\n\n\n\n\n\n\n\n\n\n" && grunt watcher'
