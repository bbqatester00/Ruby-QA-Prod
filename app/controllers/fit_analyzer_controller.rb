class FitAnalyzerController < ApplicationController
  def execute_analyzer
    load '/Users/kwaun-jonglin/Desktop/Ruby-QA-Prod/ruby_scripts/fit_analyzer/FitAnalyzer.rb'
    send_file '/Users/kwaun-jonglin/Desktop/Ruby-QA-Prod/ruby_scripts/fit_analyzer/logs/fitanalyser.log', :type => 'text/csv', :disposition => 'inline'
    flash[:notice] = "Executing FitNesse analyzer..."
  end
end

