#!/bin/sh

pgreen='\033[92m'
pred='\033[91m'
preset='\033[39m'

chatId=CHANGEME
botToken=CHANGEME

for arg in "$@"; do
    if [ -f $PWD/$arg ]; then
        sleep 1
        echo "◆ [$arg] => file"
        sleep 1

        if ! curl -F chat_id=$chatId -F document=@$PWD/$arg https://api.telegram.org/bot$botToken/sendDocument -# -o /dev/null; then
            sleep 1
            echo "   ${pred}ERROR TRANCENDFILE $preset"
            sleep 1
        else 
            sleep 1
            echo "   ${pgreen}GOOD! file $arg transfer$preset"
            sleep 1
        fi

        echo "   the work is finished"
        sleep 1

    elif [ -d $PWD/$arg ]; then
        sleep 1
        echo "◆ [$arg] => directory"
        sleep 1

        tmpnamefile=$(date +"%H%M%S%3N%d%m%Y")
        echo "   1. create archive $tmpnamefile.tar.gz"
        sleep 1
        tar czf $tmpnamefile.tar.gz $PWD/$arg 2>/dev/null && echo "   ${pgreen}good! archive create$preset"
        sleep 1
        echo "   2. tranfer file $tmpnamefile.tar.gz for server"
        if ! curl -F chat_id=$chatId -F document=@$PWD/$tmpnamefile.tar.gz https://api.telegram.org/bot$botToken/sendDocument -# -o /dev/null; then
            sleep 1
            echo "   ${pred}ERROR TRANCENDFILE $preset"
            sleep 1
        else 
            sleep 1
            echo "   ${pgreen}GOOD! directory $arg transfer$preset"
            sleep 1
        fi

        echo "   3. remove archive $tmpnamefile.tar.gz"
        rm $tmpnamefile.tar.gz && sleep 1 && echo "   ${pgreen}GOOD! $tmpnamefile.tar.gz remove$preset"
        sleep 1

        echo "   the work is finished"
        sleep 1

    else 
        sleep 1
        echo "${pred}◆ [$arg] => file or directory not found$preset"
        sleep 1

        echo "   the work is finished"
        sleep 1
    fi
done

echo ""
echo "   script ended"
sleep 1