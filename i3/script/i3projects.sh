#!/bin/sh

case "$1" in
    file_start)
        sudo service mongod start
        ;;
    file_stop)
        sudo service mongod stop
        ;;
    drupal_start)
        sudo service apache2 start
        sudo service mysql start
        ;;
    drupal_stop)
        sudo service apache2 stop
        sudo service mysql stop
        ;;
    ks_start)
        sudo service mysql start
        ;;
    ks_stop)
        sudo service mysql stop
        ;;
    *)
        echo "Usage: $0 {drupal_start|drupal_stop|file_start|file_stop|ks_start|ks_stop}"
        exit 2
esac

exit 0
