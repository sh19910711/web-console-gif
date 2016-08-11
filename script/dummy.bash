cd web-console/test/dummy
unset RACK_ENV
unset RAILS_ENV
bundle exec rackup -q --host 127.0.0.1 --port 19292 &
