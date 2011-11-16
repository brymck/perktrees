perktrees
=========

Heroku
------

To deploy on your own [Heroku](http://www.heroku.com) webapp, use something
like the following, replacing everything in `<brackets>`:

    git clone git://github.com/brymck/perktrees.git
    cd perktrees
    heroku create <app_name> --stack cedar
    heroku config:add PERKTREES_TOKEN=<secret_token>
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:seed
