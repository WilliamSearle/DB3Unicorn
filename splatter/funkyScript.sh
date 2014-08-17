#!/usr/bin/ruby
# Create 3 users

curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"Test User 1", "password":"foo1"}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"user": {"email":"unicorn@foo.com", "name":"POOP", "password":"sdgsdsdfgg"}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"User 2", "password":"blahblah2"}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"User 3", "password":"blahblah3"}}'


# Create some splatts

curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"Hai hai", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"Hai hai!!!!", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"HAI HAI", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"Do you like unicorns???", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"OMG YUS I <3 UNICORNS!!", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"splatt": {"body":"ME TOO!!!", "user_id":3}}'

# User 1 follows user 2

curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"id":1, "follows_id":2}'
curl -i -H "Content-type: application/json" -X POST http://searlew.sqrawler.com:3000/users -d '{"id":1, "follows_id":3}'

# Gets first user's splatts
curl -i -H "Content-type: application/json" -X GET http://searlew.sqrawler.com:3000/users/splatts/1

# Gets the users followed by the first user
curl -i -H "Content-type: application/json" -X GET http://searlew.sqrawler.com:3000/users/follows/1

# Gets the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://searlew.sqrawler.com:3000/users/splatts-feed/1

# First user unfollows the third user
curl -i -H "Content-type: application/json" -X DELETE http://searlew.sqrawler.com:3000/users/follows/1/3

# Gets the first user's newsfeed after unfollowing the third
curl -i -H "Content-type: application/json" -X GET http://searlew.sqrawler.com:3000/users/splatts-feed/1
