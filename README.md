# Blizzard Public API Test
created by: Budi Sugianto

Github Action: [![ci-api-tests](https://github.com/mcbuddy/blizzard-api-test/actions/workflows/ci-api-tests.yaml/badge.svg)](https://github.com/mcbuddy/blizzard-api-test/actions/workflows/ci-api-tests.yaml)

The test simply to validate 2 of the games data: Diablo 3 and HearthStone. This testing framework build using Ruby and RSpec as the test runner and validator.


#### Project Structure

    blizzard-api-test
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

#### Setup and Install programs to Unix-based Machine
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

Here is the list of the commands that available on this project:
```
$> rake -T
rake run:all_tests    # Run all the tests [default]
rake run:diablo3      # Run Diablo 3 Community API Test
rake run:hearthstone  # Run HearthStone Game Data API Test
rake show:all         # Showing all the task or rake -T
```

#### Caveat 
In the ideal world, to run all the test suites just type `rake` in the command-line/terminal, 
Unfortunately this will be failed due to `$CLIENT_ID` and `$CLIENT_SECRET` are required to run this test. 

For security reason I will not push these keys into public github repo, but I will send it along aside with the assessment submission via email

So after those keys acquired, to run the tests will be looks like this: 
```
CLIENT_ID=$CLIENT_ID CLIENT_SECRET=$CLIENT_SECRET rake                  # Run all the tests
CLIENT_ID=$CLIENT_ID CLIENT_SECRET=$CLIENT_SECRET rake run:diablo3      # Run Diablo 3 Community API Test
CLIENT_ID=$CLIENT_ID CLIENT_SECRET=$CLIENT_SECRET rake run:hearthstone  # Run HearthStone Game Data API Test
```

#### Github Action CI Build
The CI Build included and basically it will run all the test for each push and pull-request. 
Feel free to acess and check that out, Click the Github Action badge on this README file or this [link](https://github.com/mcbuddy/blizzard-api-test//actions/workflows/ci-api-tests.yaml) 


 > *Feel free to ask/send me any questions or concerns to my email: budisugianto777@gmail.com*
