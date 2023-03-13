
### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##
greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }

###MINI FUNCTIONS###
home(){
    echo "going back"
    cd
    ./gen.sh
    }
quit(){ 
    echo "bye bye"
    cd
    exit 0 
    }
unknown(){
    echo "unknown option"
    cd
    exit 1
    }

###MAIN FUNCTIONS###
prog(){ #menu to quickly start a new project
    echo "
    ====================   
    $(magentaprint '1) Shell script')
    $(magentaprint '2) Python')
    $(redprint     '3) C/C++')
    $(cyanprint    '4) Java')
    $(cyanprint    '5) Javascript')
    $(greenprint   '6) PHP')
    $(greenprint   '7) SQL')
    9) Go Back
    0) EXIT 
    ===================="
    read -e -n 1 ans
    echo " "
    case $ans in
    1 ) 
        echo "directory/name of the script: "
        read name
        code $name.sh ;;
    2 ) 
        echo "directory/name of the python file: "
        read name
        code $name.py ;;
    3 ) 
        echo "directory/name of the c/c++ file: "
        read name
        code $name.c ;;
    4 ) 
        echo "directory/name of the rust file: "
        read name
        code $name.rs ;;
    9)
        home ;;
    0 ) 
        quit ;;
    * ) 
        echo "unknown option"
        exit 1
        ;;
    esac 
}
ani_menu(){ #menu for ease of use and small additionnal function to ani-cli
    echo "
    ====================
    $(magentaprint '1) Watch Anime') 
    $(magentaprint '2) Show Downloaded Anime')
    $(redprint     '3) Download Anime')
    $(yellowprint  '4) Update Script')
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    #cd ani-cli
    case $ans1 in 
    1 ) 
        ani-cli;;
    2 )
        echo " $(magentaprint 'The following `*.mp4` files were found') "
        # set the prompt used by select, replacing "#?"
        PS3="$(magentaprint 'Use numbers to select a file or 'q' to cancel:') " 
        select filename in *.mp4 # allow the user to choose a file
        do   
            if [[ "$REPLY" == q ]]; then break; fi # leave the loop if the user prompt
            if [[ "$filename" == "" ]] # complain if no file was selected, and loop to ask again
            then
                echo "'$REPLY' is not a valid number"
                continue
            fi
            xdg-open "$filename" # now we can use the selected file
            # it'll ask for another unless we leave the loop
            break
        done ;;
    3 ) 
        ani-cli -d ;;
    4 ) 
        sudo ani-cli -U ;;
    9) 
        home ;;
    0 ) 
        quit ;;
        
    * ) 
        unknown ;;
    esac  
}
manga_menu(){
    echo "
    ====================
    $(magentaprint '1) Watch Manga') 
    $(redprint     '2) Back to W/leftoff')
    $(yellowprint  '3) Update Script')
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    #cd ani-cli
    case $ans1 in 
    1 ) 
        manga-cli;;
    2 )
        manga-cli -l;;
    3 )
        manga-cli -u;;
    9) 
        home ;;
    0 ) 
        quit ;;
    * ) 
        unknown ;;
    esac 
}   
back_menu(){
    echo "
        ================
        $(magentaprint 'v) -5%')
        $(magentaprint 'b) +5%')
        ================"
    while true; do
        read -N 1 ans1
        case $ans1 in 
        v ) 
            sudo brightnessctl -q s 5%- ;;
        b )
            sudo brightnessctl -q s 5%+ ;;
        q) 
            quit ;;
        * )
            unknown ;;
        esac
    done
}
net_menu(){
    nmcli r
    nmcli d
    echo "
    ====================
    $(magentaprint '1) toggle wifi') 
    $(redprint     '2) toggle bluetooth')
    $(yellowprint  '3) toggle airplane mode')
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    echo " "
    case $ans1 in
    1 ) 
        echo "toggling wifi"
        status=$(nmcli r wifi)
        if [ $status == "enabled" ]; then
            nmcli r wifi off
        else
            nmcli r wifi on
        fi ;;   
    2 )
        echo "toggling bluetooth"
        bluetooth toogle ;;
    
    3 ) 
        echo "turning on airplane mode"
        nmcli radio wifi off
        bluetooth off ;;
    9)
        home ;;
    0 )
        quit ;;
    * )
        unknown ;;
    esac
}
read_menu(){
    echo "
    ====================
    $(magentaprint '1) Read Manga') 
    $(magentaprint '2) Read Ao3 fanfics')
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    #cd ani-cli
    case $ans1 in 
    1 ) 
        manga-cli;;
    2 )
        cd Documents/Ao3-S-cli/
        ./Ao3-S-cli.sh ;;
    9) 
        home ;;
    0 ) 
        quit ;;
    * ) 
        unknown ;;
    esac 
}
watch_menu(){
    echo "
    ====================
    $(magentaprint '1) Watch Anime') 
    
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    echo " "
    case $ans1 in
    1 ) 
        ani_menu ;;
    9)
        home ;;
    0 )
        quit ;;
    * )
        unknown ;;
    esac
}
main(){
    echo "what do you want to do?"
    echo "
    ====================
    $(magentaprint '1) Update && Upgrade') 
    $(redprint     '2) Prog')
    $(yellowprint  '3) net_menu')
    $(cyanprint    '4) Reading')
    $(blueprint    '5) Watching')
    0) EXIT 
    ===================="
    read -n 1 ans
    echo " "
    case $ans in
    1 ) 
        sudo apt-get update && sudo apt upgrade 
        rustup update ;;
    2 ) 
        prog ;;
    3 ) 
        net_menu ;;
    4 )
        read_menu;;
    5 ) 
        watch_menu ;;
    b) 
        back_menu ;;
    0 ) 
        quit ;;
    * ) 
        unknown ;;
    esac
}
main