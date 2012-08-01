RubyqaProject::Application.routes.draw do
  get "adhoc/adhoc_reports"
  get "home/index"
  get "download/runmyscript"
  get "fit_analyzer/analyzer"

  root :to => 'home#index'
  match "/adhoc/adhoc_reports" => "adhoc_reports#home", :via => :get
  match "/fit_analyzer/analyzer" => "fit_analyzer#execute_analyzer", :via => :get
end
$end


