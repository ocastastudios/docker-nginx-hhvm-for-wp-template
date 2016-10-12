FROM ocasta/nginx-hhvm-for-wp:4.6

# Map any themes or plugins
#ADD my-theme /var/www/public_html/web/app/themes/my-theme
#ADD my-plugin /var/www/public_html/web/app/plugins/my-plugin

# Map any customized config. Only do this if you have set it up.
#ADD environments/development.php /var/www/public_html/config/environments/development.php
#ADD environments/staging.php /var/www/public_html/config/environments/staging.php
#ADD environments/production.php /var/www/public_html/config/environments/production.php

# Update composer
ADD ./composer /var/composer
RUN cd /var/composer; composer update;

# Set supervisord to launch upon the start of the container
ENTRYPOINT ["supervisord"]
CMD ["--configuration=/etc/supervisor.conf"]
