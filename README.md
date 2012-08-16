##About##
ThePostBin is a simple HTML5 web app running on the following technologies:

* Server running on sinatra  
* Persistence powered by MongoDB under MongoMapper
* UI styled with Twitter Boostrap and driven with jQuery and [Angular.js](http://angularjs.org)


##Setup##

[Setup mongodb](http://www.mongodb.org/display/DOCS/Quickstart/) and start mongod.


```
git clone git://github.com/libryder/thepostbin.git
rvm use 1.9.3@thepostbin --create
bundle install
rackup
```

App will be running on http://localhost:9292.

##Motivation##

I originally wrote a very (overly) complex app in PHP that ran with jQuery/UI that was a feature-rich post management system that was 100% ajax-y. I neglected it and let the domain expire.  I miss it.

I want to bring that app back but using technologies I've never used. This is the start of that app. It is a pet project meant to introduce me to all these cool technologies. And maybe something good will come out of it. :)

##Live Demo##

[http://thepostbin.herokuapp.com](Check it out.)