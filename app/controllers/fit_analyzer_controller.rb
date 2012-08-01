class FitAnalyzerController < ApplicationController
  def analyzer
  end

  def execute_analyzer
    @execute_command = system('ruby /Users/gsypolt/rubyqa_project/ruby_scripts/fit_analyzer/FitAnalyzer.rb')
    flash[:notice] = "Executing FitNesse Analyzer"
    send_file '/usr/local/rvm/my_app/ruby_scripts/fit_analyzer/logs/fitanalyser.log', :type => 'text/csv', :disposition => 'inline'
  end
end

