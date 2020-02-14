# LinkLives CMS infrastructure [![Build Status](https://travis-ci.org/CopenhagenCityArchives/linklives-wordpress-infrastructure.svg?branch=master)](https://travis-ci.org/CopenhagenCityArchives/linklives-wordpress-infrastructure)
This project is used to configure and deploy a consistent and scalable environtment for LinkLives' Wordpress site.

# The basics
* This project runs on AWS Elastic Beanstalk using a single container Docker environment
* The main functionality is provided by the Wordpress Docker image, which in this setup has two external dependencies:
* The folder used for content such as uploads, themes and language files (/wp-content) is mounted on a EFS-drive to ensure consistent if the environment is shut down. This functionality is implemented in the file efs-wp-content-mount.config
* The folder containing the LinkLives theme are downloaded and extracted from github.com/CopenhagenCityArchives/LinkLivesWordpressTheme when the Dockerfile are built (which happens when this project is deployed to Elastic Beanstalk)
* The Wordpress website depends on several credentials (mainly for database connections). Those credentials are setup in the Elastic Beanstalk environment settings, and are written to the Dockerfile before the file is used for building and running the website. The variables are written into the file using sed commands (see set-env.config for details) 
* The LinkLivesWordpressTheme project is hooked up with Travis-CI. On every push in the master branch, Travis-CI instantiates a new deployment on Elastic Beanstalk of this project, thus creating a new Wordpress website, with the newest version of the theme downloaded.

# Deployment
This project is deployed using ``eb deploy`` with the LinkLivesCMS environment selected.

An automatic deployment of this project are instantiated whenever a new push is made on the master branch of LinkLivesWordpressTheme (see above).

# Further reading
The setup is partly inspired by this AWS tutorial: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/php-hawordpress-tutorial.html
The enforcement of https connections are based on this question on Stackoverflow (AND subsequent comments!): https://stackoverflow.com/questions/24297375/how-to-get-elastic-beanstalk-nginx-backed-proxy-server-to-auto-redirect-from-htt
