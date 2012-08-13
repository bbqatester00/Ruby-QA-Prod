RubyqaProject::Application.routes.draw do
  get "adhoc/adhoc_reports"
  get "home/index"
  get "download/runmyscript"
  get "download2/runmyscript2"
  get "fit_analyzer/analyzer"
  get "fit_analyzer/execute_analyzer"

  root :to => 'home#index'
 # match "/adhoc/adhoc_reports" => "adhoc_reports#home", :via => [:get]
 # match "/fit_analyzer/analyzer" => "analyzer#home", :via => [:get]
end
$end


