# TODO

## Todo :o:

### Template-project

- [ ] Get rid off `ostruct`
- [ ] Benchmark and search for application environment startup solutions independent of framework
- [ ] Add CI/CD with Github Actions
  - [ ] lint: Rubocop
  - [ ] sast:
    - [ ] bundler-audit
    - [ ] brakeman
    - [ ] semgrep
  - [ ] build: Docker
  - [ ] test:
    - [ ] Gemfile.lock checker
    - [ ] RSpec
    - [ ] Coverage

### SecretSantaTgBot

- [ ] Refactor
- [ ] Add logging
- [ ] Add message uuid (like request-uuid)
- [ ] Make wishes "admin-protected"
  - [ ] All users will have password set or generated (and returned to user)
  - [ ] Password stored as some hash (look at Devise implementation)
  - [ ] Wish is stored encrypted with password

## Done :white_check_mark:

### Template-project

- [x] Init template project
- [x] Configure commonly used (by me) features
  - [x] Rake tasks
  - [x] IRB sugar
  - [x] Dockerise
  - [x] Rubocop and commonly used plugins
- [x] Develop application environment startup (initialization) independent of framework
- [x] Add and fill TODO.md

### SecretSantaTgBot

- [x] Working prototype
