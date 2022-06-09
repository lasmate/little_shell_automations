
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
prog(){ #menu to quickly start a new coding file based on the most comman languages 
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
        ./java.sh ;;
    5 ) 
        echo "directory/name of the JS file: "
        read name
        code $name.js ;;
    6 ) 
        echo "directory/name of the PHP file: "
        read name
        code $name.php ;;
    7 ) 
        echo "directory/name of the SQL file: "
        read name
        code $name.sql ;;
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
            xdg-open $filename # now we can use the selected file
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
main(){
    echo "what do you want to do?"
    echo "
    ====================
    $(magentaprint '1) Update && Upgrade') 
    $(redprint     '2) Prog')
    $(yellowprint  '3) Chrome')
    $(cyanprint    '4) Discord')
    $(blueprint    '5) Anime')
    0) EXIT 
    ===================="
    read -n 1 ans
    echo " "
    case $ans in
    1 ) 
        sudo apt-get update && sudo apt upgrade ;;
    2 ) 
        prog ;;
    3 ) 
        chrome ;;
    4 )
        discord ;;
    5 ) 
        ani_menu ;;
    0 ) 
        quit ;;
    * ) 
        echo "unknown option"
        exit 1 ;;
    esac
}
main