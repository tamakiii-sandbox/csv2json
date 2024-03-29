FROM php:7.4.7

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --filename=composer --install-dir=/usr/local/sbin && \
    php -r "unlink('composer-setup.php');"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      make \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
