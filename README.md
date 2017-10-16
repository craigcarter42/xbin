# xbin
simple package manager for command line applications

# how to use

open

this command will open the xbin folder in the finder.
 example: xbin open

-ls

the list command returns a list of all installed applications in xbin.
 example: xbin -ls

-l

load will moves the desired application into xbin.
 example: xbin -l myprogram

-r

remove will move the named application out of xbin into the home directory.
 example: xbin -r myprogram

-del

permanently deletes an application, this can not be undone.
 example: xbin -del myprogram

-c

converts a selected program into an xbin command line application.
 example: xbin -c myprogram.sh

help

this will print out the help documentation including a list of all possible commands
 example: xbin help

:: all applications to be moved must be placed in the home directory
:: and all applications removed will be placed in same home directory
