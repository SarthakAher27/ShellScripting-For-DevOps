# ShellScripting-For-DevOps

This project automates Linux user management and directory backups using a single shell script. It's perfect for DevOps beginners to demonstrate scripting skills and system administration knowledge.

## 🔧 Features

- Add, delete, and modify users
- Create groups and assign users
- Backup directories into `.tar.gz` files
- List all human-created users (UID ≥ 1000)
- User-friendly command-line interface

## 🖥️ Usage

```bash
./user_mgmt_backup.sh add       # Add a user
./user_mgmt_backup.sh delete    # Delete a user
./user_mgmt_backup.sh modify    # Change user password
./user_mgmt_backup.sh group     # Create group and assign user
./user_mgmt_backup.sh backup    # Backup a directory
./user_mgmt_backup.sh list      # List all users with UID >= 1000
