## Batch-Admin-Removal

**Description:**

BatchAdminRemoval.bat is a batch script designed to remove unauthorized users from the Administrators group on Windows systems. This script is particularly useful in environments with a mix of Windows operating systems, ranging from older versions to the most recent. The script leverages batch scripting for increased compatibility compared to PowerShell.

One of its main purposes is to quickly remove admin access in a Windows environment via an RMM tool on various versions of Windows OS when an MDM solution such as Intune or Group Policy is not an option.

**Features:**
- Creates a temporary directory for processing.
- Creates a temporary admin user `admin01` to ensure admin access isn't accidentally lost due to error.
- Disables the default `Administrator` account.
- Identifies and lists current members of the Administrators group.
- Removes unauthorized users from the Administrators group based on specified exclusions.
- Deletes the temporary files created during execution.
- Ensures compatibility across a wide range of Windows versions.

**Usage:**

**Warning 1:** The names specified for exclusion are case sensitive.  
**Warning 2:** Be cautious if editing the line `findstr /B /V "admin01" | findstr /B /V ".*\Domain Admins"`.
- Ensure the script is executed with administrative privileges.
- Modify the script to include the usernames you wish to exclude from removal (e.g., `Companyadmin`, `itadmin`, `Calvin`).
- Run the script in an environment with an RMM tool for automation.

## Disclaimer
This script is provided as-is and without any warranty. Use this script at your own risk. The author is not responsible for any damage or issues that may arise from its use.

## License
This project is licensed under the terms of the [GNU General Public License v3.0](LICENSE).
