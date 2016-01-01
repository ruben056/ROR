## To run
```shell
bin/rake db:migrate 
bin/rails server
```
## Good to now : default security
Deleting/editing requires basic http authentication:
* The login pass is *dhh/secret*

For implemention on this authentication see:

* *app/controllers/articles_controller.rb*
* *app/controllers/comments_controller.rb*
