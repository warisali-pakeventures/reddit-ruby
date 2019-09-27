FROM ruby:2.6.4

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

# Install gems, nodejs and precompile the assets
RUN bundle install --deployment --without development test \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && apt-get remove cmdtest yarn -y \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn -y \
    && yarn install \
    && bundle exec rails db:migrate

# Start the application server
# ENTRYPOINT ['./entrypoint.sh']
# CMD ["bundle","exec", "rake", "assets:precompile"]
CMD ["bundle","exec", "rails", "server"]
