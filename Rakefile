# Rakefile to wrap all the test into one simple command
#!/usr/bin/env rake

task default:'run:all_tests'

namespace :show do
  desc 'Showing all the task or rake -T'
  task :all do
    print 'Running '
    system('rake -T')
  end
end

namespace :run do
  desc 'Run all the tests [default]'
  task :all_tests do
    puts 'Run all the tests'
    system("CLIENT_ID=#{ENV['CLIENT_ID']} CLIENT_SECRET=#{ENV['CLIENT_SECRET']} rspec specs/* --format documentation")
  end

  desc 'Run Diablo 3 Community API Test'
  task :diablo3 do
    system("CLIENT_ID=#{ENV['CLIENT_ID']} CLIENT_SECRET=#{ENV['CLIENT_SECRET']} rspec specs/diablo3/* --format documentation")
  end

  desc 'Run HearthStone Game Data API Test'
  task :hearthstone do
    system("CLIENT_ID=#{ENV['CLIENT_ID']} CLIENT_SECRET=#{ENV['CLIENT_SECRET']} rspec specs/hearthstone/* --format documentation")
  end

end
