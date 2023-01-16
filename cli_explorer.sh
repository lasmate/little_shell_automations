 # none of this really works its more of a practice than anything #
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

###main function###
UpADir(){ #goes up in the directory tree
    cd ../
    main    
    }
DownADir(){ #displays the current directory folders and lets the user choose one to go to
    ls -d
    echo "enter the number of the directory you want to go to"
    select dir in *; do
    if [ -n "$dir" ]; then
        cd $dir
        main
    else
        echo "invalid selection"
        DownADir
    fi
    done
    
    }
main(){
    echo " $(magentaprint 'The following `*.$1` files were found') "
        # set the prompt used by select, replacing "#?"
    
    PS3="$(magentaprint 'Use numbers to select a file
        'q' to cancel
        'up' to climb up in the arborescence
        'do' to climb down in the arborescence':) " 
        select filename in *.$1 # allow the user to choose a file
        do   
            if [[ "$REPLY" == q ]]; then break; fi # leave the loop
            
            if [[ "$REPLY" == up ]] #go up a level in the directory
            then 
                echo "going up"
                pwd
                UpADir
                break
            fi 
            
            if [[ "$REPLY" == do ]] #go down a level in the directory
            then 
                
                echo "going down"
                pwd
                DownADir
                break
            fi

            if [[ "$filename" == "" ]] # complain if no file was selected, and loop to ask again
            then
                echo "'$REPLY' is not a valid number"
                continue
            fi

            xdg-open $filename # now we can use the selected file
            # it'll ask for another unless we leave the loop
            break
        done
}


main
