# xbin
Simple command line applications manager. Helps you install and manage applications so they can be directly accessed through the terminal application. 

# Command Line Arguments:

1. open: this command will open the xbin folder in the finder, example: xbin open
2. -ls: the list command returns a list of all installed applications in xbin, example: xbin -ls
3. -l: load will moves the desired application into xbin, example: xbin -l myprogram
4. -r: remove will move the named application out of xbin into the home directory, example: xbin -r myprogram
5. -del: permanently deletes an application, this can not be undone, example: xbin -del myprogram
6. -c: converts a selected program into an xbin command line application, example: xbin -c myprogram.sh
7. help: this will print out the help documentation including a list of all possible commands, example: xbin help

:: all applications to be moved must be placed in the home directory
:: and all applications removed will be placed in same home directory

# Compatibility:
xbin has only been truly tested on macOS, in the near future it will be beta tested on Linux and Unix
- macOS 10.12, stable
- Linux, beta
- Unix, beta

# Upcoming Features:
- User settings
- Load applications from any directory
- API support and Install mode for other CLI applications
- Greater control over installed applications
