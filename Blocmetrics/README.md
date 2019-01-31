# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##To Register and Track Your Applications

1  Sign up for Blocmetrics and register your website to track.

2  Add the following javascript code to the application you want to track:
   (Add this to app/assets/application.js:)
```
blocmetrics = {};
blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```
3  Add the following code inside the pages which you desire to keep track of. Place this code on the bottom. This example has the event name "About Page View". Please feel free to choose a name that best describes the page you are placing this code:
ex. js snippet:
```
<script type="text/javascript">
  $(document).on("ready page:load", function () {
    blocmetrics.report("About Page");
  })
</script>
```
4  On Blocmetrics, under your registered application, you should see the events count change as your site gets viewed.
