#!/bin/bash

# Help / Usage menu
show_help() {
    echo "Usage: $0 {add|delete|modify|group|backup|list}"
    echo "Commands:"
    echo "  add       Add a user"
    echo "  delete    Delete a user"
    echo "  modify    Change user password"
    echo "  group     Create a group and add user"
    echo "  backup    Backup a directory"
    echo "  list      Show all normal users (UID >= 1000)"
}

# Add a new user
add_user() {
    read -p "Enter username to add: " username
    sudo useradd "$username" && echo "User '$username' added successfully." || echo "Failed to add user."
}

# Delete a user
delete_user() {
    read -p "Enter username to delete: " username
    sudo userdel "$username" && echo "User '$username' deleted." || echo "Failed to delete user."
}

# Modify a user's password
modify_user() {
    read -p "Enter username to modify: " username
    sudo passwd "$username"
}

# Create a group and add a user to it
create_group() {
    read -p "Enter group name: " group
    sudo groupadd "$group"
    read -p "Enter username to add to group: " username
    sudo usermod -aG "$group" "$username"
    echo "User '$username' added to group '$group'."
}

# Backup a directory into tar.gz
backup_directory() {
    read -p "Enter full path of directory to backup: " dir
    read -p "Enter name for backup file (without extension): " archive
    tar -czvf "${archive}_$(date +%F).tar.gz" "$dir" && echo "Backup created: ${archive}_$(date +%F).tar.gz"
}

# List users with UID >= 1000 (normal users)
list_users() {
    echo "List of normal users:"
    awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd
}

# Handle script options
case "$1" in
    add) add_user ;;
    delete) delete_user ;;
    modify) modify_user ;;
    group) create_group ;;
    backup) backup_directory ;;
    list) list_users ;;
    *) show_help ;;
esac

