## Setup

 * Make sure psql is installed
 * ```createuser -s farmivore```
 * ```create db farmapp_development```
 * ```rake db:migrate```
### Ubuntu: error on bundle install

Error when ```bundle install```:

    Installing pg (0.16.0) 
    Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.

    /home/syu/.rbenv/versions/2.0.0-p0/bin/ruby extconf.rb 
    
Solution:
    
    sudo apt-get install postgresql
    sudo apt-get install libpq-dev
    
[more](http://stackoverflow.com/questions/19569031/error-failed-to-build-gem-native-extension-on-mavericks)

### Ubuntu: postgres:FATAL Peer authentication failed

When trying to connect to the db:

    FATAL: Peer authentication failed for user "farmapp"

Explanation: need to make sure that a psql role with the user name exist. If password is left off in database.yml, then
it defaults to peer authentication (asking OS for log in). So make sure the dev db has a password.

    postgres=# create user farmapp with password 'password';
    CREATE ROLE
    postgres=# \q
    
And then ```rake db:create```    


### Ubuntu: PG::InsufficientPrivilege: ERROR:  permission denied to create database

Upgarde the user to a super user. [More][1]

     syu@velleity [ ~/projects/farmivore (master⚡) ]% sudo -u postgres psql                                                                                                                                                                                                       [0] 11:23:56
     psql (9.1.10)
     Type "help" for help.

     postgres=# ALTER USER farmapp WITH SUPERUSER
     postgres-# ;
     ALTER ROLE
     postgres=# \q


[1]: (http://stackoverflow.com/questions/10757431/postgres-upgrade-a-user-to-be-a-superuser)
