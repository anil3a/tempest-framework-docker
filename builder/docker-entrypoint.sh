#!/bin/bash

# Check if the application code directory is empty
if [ -z "$(ls -A /var/www)" ]; then
    # Clone the project or create it using Composer
    composer create-project --no-interaction --prefer-dist tempest/app /var/www
    # composer create-project tempest/app /var/www
    cd /var/www
    npm run build
    chown -R www-data:www-data /var/www
fi

# Proceed with the default command
exec "$@"
