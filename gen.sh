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
home() {
    echo "
    going back"
    cd
    ./gen.sh
}
quit(){ 
    echo "
    bye..."
    cd
    exit 0
}
unknown(){
    echo "
    unknown option"
    cd
    exit 1
}
###MAIN FUNCTION###

prog(){
    echo "
    ====================   
    $(magentaprint '1) Shell script') 
    $(redprint     '2) C/C++')
    $(yellowprint  '3) Python')
    $(cyanprint    '4) Java')
    $(blueprint    '5) Javascript')
    $(greenprint   '6) PHP')
    9) Go Back
    0) EXIT
    ====================
    Choose an option:  "
    read -n 1 ans
    echo " "
    case $ans in
    1 ) 
        read name
        
        code $name.sh
        ;;
    2 ) 
        read name
        code $name.c
        ;;
    3 ) 
        read name
        code $name.py
        ;;
    4 )
        ./java.sh 
        ;;
    5 ) 
        ;;
    6 ) 
        read name
        code $name.php
        ;;
    9)
        home
        ;;
    0 ) 
        quit
        ;;
    * ) 
        echo "unknown option"
        exit 1
        ;;
    esac 

}
ani_menu(){ 
    echo "
    ====================
    $(magentaprint '1) Watch Anime') 
    $(redprint     '2) Download Anime')
    $(yellowprint  '3) Update Script')
    9) Go Back
    0) EXIT
    ====================
    "
    read -n 1 ans1
    cd ani-cli
    case $ans1 in 
    1 ) 
        ani-cli
        ;;
    2 ) 
        ani-cli -d 
        ;;
    3 ) 
        sudo ani-cli -U
        ;;
    9) 
        home
        ;;
    0 ) 
        quit
        ;;
    * ) 
        unknown
        ;;
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
    ====================
    Choose an option:  "
    read -n 1 ans
    echo " "
    case $ans in
    1 ) 
        sudo apt-get update 
        sudo apt upgrade 
        ;;
    2 ) 
        prog
        ;;
    3 ) 
        chrome
        ;;
    4 )
        discord 
        ;;
    5 ) 
        ani_menu
        ;;
    0 ) 
        quit
        ;;
    * ) 
        echo "unknown option"
        exit 1
        ;;
    esac
}

main