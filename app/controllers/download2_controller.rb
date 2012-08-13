class Download2Controller < ApplicationController
def runmyscript2
  load '/Users/kwaun-jonglin/Desktop/Ruby-QA-Prod/ruby_scripts/reports/AxmanUnassignedTests.rb'
  send_file '/usr/local/rvm/tmp/unassigned_tests_report.csv', :type => 'text/csv', :disposition => 'inline'
  flash[:notice] = "Reports are being processed..."
end
end