# MNTN  Assessment
created by: Budi Sugianto

Github Action: [![CI Status](https://github.com/mcbuddy/mntn_assessment/blob/main/.github/workflows/ci-api-tests.yaml/badge.svg)](https://github.com/mcbuddy/mntn_assessment/blob/main/.github/workflows/ci-api-tests.yaml)

For this assessment, I decided to do something fun by using battle.net public API. The test simply to validate 2 of the games data: Diablo 3 and HearthStone.
This testing framework build using Ruby and RSpec as the test runner and validator.


#### Project Structure

    mntn-assesment
    ├─> .github/
    │   └─> workflows/              # Github Actions workflows 
    ├─> specs/
    │   ├─> diablo3/                # Diablo 3 tests
    │   ├─> hearthstone/            # HearthStone tests    
    ├── spec_helper.rb
    ├── Gemfile
    ├── Gemfile.lock
    ├── README.md
    └── Rakefile

#### Setup
#### Install programs to Unix-based Machine
Prerequisite:
- [rvm](https://rvm.io/rvm/install) - Ruby Version Manager
- ruby equal or higher than version: 2.7.4

Install RVM and Ruby 2.7.4
```
\curl -sSL https://get.rvm.io | bash
rvm install ruby-2.7.4
rvm use ruby-2.7.4
```

Install all dependencies 
```
gem install bundler
bundle install
```

To run all the test suites just type `rake` in the command-line/terminal
Here is the list of the commands that available on this project:
```
$> rake -T
rake run:all_tests    # Run all the tests [default]
rake run:diablo3      # Run Diablo 3 Community API Test
rake run:hearthstone  # Run HearthStone Game Data API Test
rake show:all         # Showing all the task or rake -T
```
