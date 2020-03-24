source "https://rubygems.org"

# Ensure github repositories are fetched using HTTPS
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  puts(repo_name)
  "https://github.com/#{repo_name}.git"
end if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('2')

gem 'cocoapods', "1.7.3"
gem 'cocoapods-trunk', '1.3.1'