#! /usr/bin/bash 

# set -e # Exit on any error 

# Make sure the data directory exists. This silences an ugly error but isn't
# strictly necessary. 
mkdir -p $DATA_DIR 

# command needed for permissions on $DATA_DIR
chmod o+w $DATA+DIR

if ! python3 manage.py migrate --check; then 
    echo Setting up Django for the first time. 
    python3 manage.py migrate
    python3 manage.py createsuperuser --noinput \
            --username $DJANGO_SUPERUSER_NAME \
            --email $DJANGO_SUPERUSER_EMAIL 
else
    echo "Django has been setup."
fi

python3 manage.py runserver 0.0.0.0:$PORT
