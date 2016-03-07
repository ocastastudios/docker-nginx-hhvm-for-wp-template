# docker-nginx-hhvm-for-wp-template

Template to start a new Wordpress project, using the [docker-nginx-hhvm-for-wp](https://github.com/ocastastudios/docker-nginx-hhvm-for-wp) Docker image.

Based on [Bedrock](https://github.com/roots/bedrock).

## Starting a new project

1. [Download this repository as a zip](https://github.com/ocastastudios/docker-nginx-hhvm-for-wp-template/archive/master.zip)

2. In this README.md file, replace `yourprojectfoldername` in the "Start the app" section, step 2 with the name of you project folder / repository name (they should match). Remove all non alphanumeric characters from the name.

3. Add your theme and or custom plugins in folders in the root of this project

4. To add your themes and/or plugins uncomment and modify the relevant lines in the `docker-compose.yml` and `Dockerfile` files. Don't change anything else unless you are aware of what you're doing.

5. Add any composer repos you want into the `composer/composer.json.local` file, and any dependencies - This is the best way to install Wordpress plugins. The [default Bedrock composer.json](https://github.com/roots/bedrock/blob/master/composer.json) file might bring inspiration, or you might want to add your own private internal composer repo...

6. Delete everything in the README.md file up to this point and add your own title and description!

## Getting your development environment setup for the first time

### Install Docker

[Docker Instructions](https://gist.github.com/jsonfry/2b9a930905d8b7b83613)

### Start the app

The following commands presume you are running from a Docker Quickstart window, or a configured terminal window, and that you are in the project root

1. Start the docker containers for the site:

    `docker-compose up`

2. Install the dependencies - you'll need to do this each time `composer/composer.json.local` changes. Do this in a new (configured or Quickstart) terminal tab/window.

    `docker exec -it yourprojectfoldername_wp_1 bash -c 'cd /var/composer; composer update'`

You can now visit [docker.local](http://docker.local) and see the site!

### Debugging

- HHVM Output appears on stdout if the container is not running in daemon mode.
- The hhvm/php.ini override sets debug level to Verbose to view all compiler error and warning messages
- The hhvm/server.ini override enables xdebug. If you want to use xdebug you
will have to set xdebug.remote_host to your machines IP address.

## Customizing development / staging / production environment

The `docker-compose.yml` and `Dockerfile` files include commented out lines to add your own config. You should copy the relevant [files from Bedrock](https://github.com/roots/bedrock/tree/master/config/environments) and add your own options.

## Pre-populating the development database

Add you sql dump file to `data/sql` and uncomment out the line in `docker-compose.yml`.
