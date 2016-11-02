#!/bin/sh
set -e

# check required dependencies
check_deps() {
	for dep in $@; do
		if [ -z $(which "${dep}") ]; then
			printf '\n\033[1;31mErreur :\033[0m\n'
			printf '%s est introuvable.\n' "${dep}"
			printf 'Installez-le avant de lancer ce script.\n\n'
			exit 1
		fi
	done
}

# fix rights on cache and logs dirs
check_deps 'groups' 'chgrp' 'chmod' 'find'
if [ -n "$(groups|grep 'www-data')" ]; then
	chgrp -Rc www-data ./var
	chmod -Rc g+w ./var
	find ./var -type d -exec chmod -c g+s ./var {} +
elif [ -n "$(which sudo)" ]; then
	sudo chgrp -Rc www-data ./var
	sudo chmod -Rc g+w ./var
	find ./var -type d -exec sudo chmod -c g+s ./var {} +
else
	printf '\n\033[1;33mAvertissement :\033[0m\n'
	printf 'Vous devez donner les droits d’écriture au groupe www-data sur le'
	printf 'répertoire ./var avant de lancer cette application.\n'
fi

# install app dependencies
check_deps 'composer' 'npm'
composer update
npm update

exit 0
