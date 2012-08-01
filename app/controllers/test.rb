class DownloadController < ApplicationController
def runmyscript
  system ('ruby /usr/local/rvm/my_app/ruby_scripts/reports/FailedTestsLast30days.rb')
end
end