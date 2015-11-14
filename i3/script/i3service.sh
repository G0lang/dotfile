#!/bin/sh

case "$1" in
    apache_start)
        sudo service apache2 start
        ;;
    apache_stop)
        sudo service apache2 stop
        ;;
    mysql_start)
        sudo service mysql start
        ;;
    mysql_stop)
        sudo service mysql stop
        ;;
    mongo_start)
        sudo service mongod start
        ;;
    mongo_stop)
        sudo service mongod stop
        ;;
    vpn_start)
        sudo service kerio-kvc start
        ;;
    vpn_stop)
        sudo service kerio-kvc stop
        ;;
    *)
        echo "Usage: $0 {apache_start|apache_stop|mysql_start|mysql_stop|mongo_start|mysql_stop|vpn_start|vpn_stop}"
        exit 2
esac

exit 0
