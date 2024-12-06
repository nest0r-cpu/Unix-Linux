#!/bin/bash

#Display host information
display_host() {
    echo "You are logged into: $(hostname)"
}

# Display last login time
display_last_login() {
    LAST_LOGIN=$(last -2 $LOGNAME | head -n 2 | tail -n 1)
    if [ -z "$LAST_LOGIN" ]; then
        echo "No previous login was found. This might be your first login."
    else
        echo "Your last login was on: $LAST_LOGIN"
    fi
}

# Display the number of local and environment variables
display_variable_count() {
    LOCAL_VARS=$(set | grep -v "^declare" | wc -l)
    ENV_VARS=$(env | wc -l)
    TOTAL_VARS=$((LOCAL_VARS + ENV_VARS))
    echo "Total variables (local + environment): $TOTAL_VARS"
    echo "Local variables: $LOCAL_VARS"
    echo "Environment variables: $ENV_VARS"
}

# Display directories in the search path
display_path() {
    echo "Directories in your search path:"
    echo $PATH | tr ':' '\n'
}

# Main menu
while true; do
    clear
    echo "Choose an option to continue:"
    echo "1) Host you are logged in as"
    echo "2) Date and time of your last login"
    echo "3) Count of local and environment variables"
    echo "4) Directories in your search path"
    echo "5) Quit"
    echo -n "Enter your choice (1-5): "
    read choice

    # Case statements
    case $choice in
        1)
            display_host
            ;;
        2)
            display_last_login
            ;;
        3)
            display_variable_count
            ;;
        4)
            display_path
            ;;
        5)
            echo "Exiting the program."
            exit 0
            ;;
        *)
            echo "Invalid option(s). Please choose a single valid number (1-5)."
            ;;
    esac
    echo -n "Press Enter to continue..."
    read
done
