class CreateFitAnalyzerControllers < ActiveRecord::Migration
  def change
    create_table :fit_analyzer_controllers do |t|

      t.timestamps
    end
  end
end
