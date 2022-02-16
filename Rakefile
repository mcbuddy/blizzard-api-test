# Rakefile to wrap all the test into one simple command

task default:'run:all_tests'

namespace :show do
  desc 'Showing all the task or rake -T'
  task :all do
    print 'Running '
    sh 'rake -T'
  end
end

namespace :run do
  desc 'Run all the tests [default]'
  task :all_tests do
    puts 'Run all the tests'
    sh 'rspec specs/* --format documentation'
  end

  desc 'Run Diablo 3 Community API Test'
  task :diablo3 do
    sh 'rspec specs/diablo3/* --format documentation'
  end

  desc 'Run HearthStone Game Data API Test'
  task :hearthstone do
    sh 'rspec specs/hearthstone/* --format documentation'
  end

end
