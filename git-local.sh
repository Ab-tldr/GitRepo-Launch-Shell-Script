#!/bin/sh

read -p "Number of files: " num
read -p "Enter Commit name: " commitname
i=0
if git init;
then
        echo "Initialization completed"
        while [ "$i" -lt "$num" ]
        do
            read -p "New file name: " filename
            read -p "New file extension: " extension
            read -p "Enter contents: \n" entr
            echo $entr>>"$filename"."$extension";
            echo "\n\tChanges were made to file "$filename.$extension" in directory "$PWD" \n"
        done     
                if git add .;
                then
                        echo "\n\t File pushed Successfull into the directory "$PWD" \n"
                        if git commit -m "$commitname"
                        then
                                echo "\n\t Commit successfull!!!.... commit name= $commitname \n"
                                git status
                        fi
                fi
        fi
fi
