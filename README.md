# **Oh-My-PowerShell**
**Oh-My-PowerShell** is a customizable PowerShell configuration framework inspired by **Oh-My-Bash**. It allows users to easily manage their PowerShell environment, load plugins, aliases, themes, and more, through a simple configuration.

## Features

- **Modular Configuration**: Customize your PowerShell environment by loading various plugins, themes, and settings.
- **Easy Installation**: Install and manage Oh-My-PowerShell easily with a batch script or manually.
- **Customizable Themes**: Choose from different themes (like **default**, **minimal**, **bling**).
- **Plugin Support**: Load plugins like **Git**, **Docker**, etc.
- **Easy-to-Use Functions**: Create reusable functions for your PowerShell environment.
  
---

## Installation Guide

You can install **Oh-My-PowerShell** either by using the **installation batch script** or manually.

### **Installation via Batch Script**

1. **Download the repository**: First, make sure you have [Git](https://git-scm.com/downloads) installed. If you don’t have Git, you can follow the instructions in the **Git Installation Guide** section below.
   
2. **Run the installation batch script**:
   - Download the `install.bat` file from the repository or create it by copying the content below.

       @echo off
       :: Check if Git is installed
       echo Checking for Git installation...
       where git >nul 2>nul
       IF %ERRORLEVEL% NEQ 0 (
           echo Git is not installed. Please install Git first from https://git-scm.com/downloads
           pause
           exit /b
       )
    
       SET POWER_SHELL_PROFILE=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
    
       :: Clone the repository into the user's home directory
       echo Cloning Oh-My-PowerShell repository...
       git clone https://github.com/nixsy9/Oh-My-PowerShell.git "%USERPROFILE%\.oh-my-powershell"
    
       :: Add the line to the PowerShell profile if it's not already there
       echo Adding initialization script to PowerShell profile...
       findstr /C:"`".%USERPROFILE%\.oh-my-powershell\init.ps1`"" "%POWER_SHELL_PROFILE%" >nul || echo . "%USERPROFILE%\.oh-my-powershell\init.ps1" >> "%POWER_SHELL_PROFILE%"
    
       :: Display completion message
       echo Oh-My-PowerShell has been successfully installed.
       echo Restart your PowerShell session to apply the changes.
       pause

   

## Running the install.bat script will:

Clone the Oh-My-PowerShell repository into the `%USERPROFILE%\.oh-my-powershell` directory.
Add the necessary initialization script to the PowerShell profile file (Microsoft.PowerShell_profile.ps1).
Ensure Git is installed. If not, it will prompt you to install it first.
Restart PowerShell: After running the script, restart PowerShell to apply the changes.



# *If you prefer to install manually*



 **Clone the repository:**

First, ensure Git is installed. If it isn’t, follow the Git Installation Guide.

Clone the repository into the `%USERPROFILE% directory`:

    git clone https://github.com/nixsy9/Oh-My-PowerShell.git %USERPROFILE%\.oh-my-powershell

Edit the PowerShell profile:

Add the following line to the Microsoft.PowerShell_profile.ps1 file:

    "%USERPROFILE%\.oh-my-powershell\init.ps1"

If the profile file doesn’t exist, create it in the directory:

    Windows PowerShell: %USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

Restart PowerShell: Restart your PowerShell session to load the configuration.

**

 **If you receive a git error or do not have git installed**

**

If you do not have Git installed on your machine, follow these steps to install it:

**Download Git:**

Visit [Git's official website](https://git-scm.com) and [download](https://git-scm.com/downloads) the version for your system.
Run the installer:

Follow the installation wizard, using the default settings for most cases.
Verify Installation:

After installation, open a new PowerShell window and run the following command to verify Git is installed:

    git --version

If Git is installed correctly, you should see the installed version printed on the console.
**

## Additional Scripts

**
Open PowerShell Profile Directory
You can create a batch script to open the PowerShell profile directory of you just wish to copy the included Microsoft.PowerShell_profile.ps1 to your profile directory:

open-profile.bat:

    @echo off
    
    :: Open PowerShell profile directory
    explorer %USERPROFILE%\Documents\PowerShell

**Troubleshooting**
"Git is not installed": Make sure Git is installed correctly by running git --version in PowerShell. If not, follow the Git installation instructions above.
PowerShell profile not loading: Ensure the Microsoft.PowerShell_profile.ps1 file contains the correct line to load the init.ps1 script.

If you see the message “No settings file found,” ensure that you have a valid settings file at 

    %USERPROFILE%\.oh-my-powershell\settings\settings.psm1.

Profile not updating:

Ensure that the correct line is added to your PowerShell profile file:

    "%USERPROFILE%\.oh-my-powershell\init.ps1"

Modules not loading:

If modules like Git or Docker are not loading, make sure the appropriate .psm1 files exist in the plugins folder and that the EnablePlugins setting is enabled in the settings.psm1 file.

## License

This project is licensed under the **MIT License**

