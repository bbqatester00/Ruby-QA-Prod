require 'rubygems'
require 'pg'

#connects to axman2_release database
#@conn = PGconn.connect("crack.pd.local", 5432,"","","axman2_release" ,"postgres", "bl@ckb0ard")
@conn = PGconn.connect("addict.pd.local", 5432,"","","axman2_prod" ,"postgres", "bl@ckb0ard")

#executes sql query to obtain new Fitnesse tests available on Perforce that have not been assigned to an execution plan in AXMAN  
results = @conn.exec("select * from fitnesse_tasks as ft where id not in(select ft.id  from fitnesse_tasks as ft, task_execution_plans as tep where tep.fitnesse_task = ft.id) and active='t';")

#prints and formats results into .csv file
File.open('/usr/local/rvm/tmp/unassigned_tests_report.csv', 'w+') do |f|
	recordresults = []
	results[1].each_key {|key| recordresults.push(key.to_s)}
	f.puts recordresults.join(",");
	results.each do |row|
		recordresults = []
		row.each_value {|value| recordresults.push(value.to_s)}
		f.puts recordresults.join(",");
	end 
end


