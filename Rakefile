require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << "test"
  test.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc 'Removes trailing whitespace'
task :whitespace do
  sh %{find . -name '*.rb' -exec sed -i '' 's/ *$//g' {} \\;}
end

desc "Push a new version to Rubygems"
task :publish do
  sh "gem build json_builder.gemspec"
  sh "gem push streamio-ffmpeg-#{JSONBuilder::VERSION}.gem"
  sh "git tag v#{JSONBuilder::VERSION}"
  sh "git push origin v#{JSONBuilder::VERSION}"
  sh "git push origin master"
  sh "git clean -fd"
end

