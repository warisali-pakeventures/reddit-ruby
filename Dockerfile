FROM ruby:2.6.4-stretch

#FROM heroku/heroku:18

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_MASTER_KEY 25b91bfb9b75203d83efc7ec6bf72eb9
# Install gems, nodejs and precompile the assets
RUN bundle install --deployment --without development test \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && apt-get remove cmdtest yarn -y \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn sqlite3 -y \
    && yarn install \
    && bundle exec rails db:migrate

# Start the application server
# ENTRYPOINT ['./entrypoint.sh']
CMD ["bundle","exec", "rake", "assets:precompile"]
CMD ["bundle","exec", "rails", "server"]
