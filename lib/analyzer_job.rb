class AnalyzerJob < Struct.new(:executing_id)
  def perform
    executing = Executing.find(executing_id)
    executing.deliver
    raise "analyzer job failed!"
  end
end