web: bin/rails server -p $PORT -e $RAILS_ENV

worker: bundle exec rake jobs:work

pubsub: bundle exec rackup private_pub.ru -s thin -E production -p 9292
