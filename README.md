# Backup and Restore Script

This repository contains a Windows Batch script designed to create and restore backups for specific folders related to the LGHUB application.

## Features
- **Backup**: Copies specified folders to a backup directory, preserving all file attributes.
- **Restore**: Restores the folders from the backup directory to their original locations.
- **Error Handling**: Skips missing folders and provides informative messages during operations.

## How It Works
The script offers a simple menu to choose between two actions:
1. **Create a backup**: Saves the contents of specified folders to a `backup` directory located in the same folder as the script.
2. **Restore from backup**: Restores the contents of the folders from the `backup` directory.

## Folders Included in Backup
The script backs up the following directories:
- `C:\Program Files\LGHUB`
- `C:\ProgramData\LGHUB`
- `%LOCALAPPDATA%\LGHUB`
- `%APPDATA%\LGHUB`

## Usage
1. **Download the script** and place it in a directory of your choice.
2. Run the script by double-clicking it or executing it in a Command Prompt.
3. Follow the on-screen instructions to create or restore backups.

## Example Output
```
Select an action:
1. Create a backup
2. Restore from backup
Enter 1 or 2: 1
Creating backup...
Backing up C:\Program Files\LGHUB to backup\C_Program_Files_LGHUB...
Backing up C:\ProgramData\LGHUB to backup\C_ProgramData_LGHUB...
Folder %LOCALAPPDATA%\LGHUB not found, skipping.
Backup completed.
```

## Requirements
- Windows OS
- Administrator privileges (recommended for accessing protected directories)

## Notes
- The backup directory is created in the same folder as the script and is named `backup`.
- If a folder does not exist, it is skipped during the backup and restore processes.
- The script uses `robocopy` for efficient copying and restoring of files.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
