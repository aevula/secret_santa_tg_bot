FROM ruby:3.3.4-alpine3.20 AS development

RUN apk add --no-cache build-base tzdata postgresql-dev

WORKDIR /opt/app/

COPY Gemfile* ./

RUN bundle install -j 4

EXPOSE 3000

# CMD ["bundle", "exec", "puma"]


FROM development AS production

RUN apk add --no-cache tzdata postgresql-libs

WORKDIR /opt/app

COPY ./ ./

RUN addgroup -g 1001 -S non-root && adduser -u 1001 -S non-root -G non-root
RUN chown -R 1001:1001 log tmp
USER non-root

ENV RAILS_ENV=production

EXPOSE 3000

# CMD ["bundle", "exec", "puma"]
