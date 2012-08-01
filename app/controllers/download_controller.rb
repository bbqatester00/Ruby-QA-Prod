class DownloadController < ApplicationController
def runmyscript
  system('/usr/local/rvm/tmp/test.sh')
  system('ruby /usr/local/rvm/my_app/ruby_scripts/reports/FailedTestsLast30days.rb')
  send_file '/usr/local/rvm/tmp/failed_tests_last_30days.csv', :type => 'text/csv', :disposition => 'inline'
  flash[:notice] = "Reports are being processed..."
end
end
