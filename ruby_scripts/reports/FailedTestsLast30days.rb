require 'rubygems'
require '/usr/local/rvm/gems/ruby-1.9.3-p194@railsTest/gems/pg-0.14.0/lib/pg'

#connects to axman2_prod (production) database
@conn = PGconn.connect("addict.pd.local", 5432,"","","axman2_prod" ,"postgres", "bl@ckb0ard")

#executes sql query to obtain a list of tests which has failed Axman execution the using a hard date 
#results = @conn.exec("select sr.test_suite, count(sr.result = 'Passed') AS SuccessCount from suite_results sr WHERE sr.start_time >'2012-03-04' GROUP BY test_suite ORDER BY successcount ASC;")

#executes sql query to obtain a list of tests which has failed Axman execution the past 30 days 
results = @conn.exec("select ft.file_path,
sum(case sr.test_result when 'Passed' then 1 else 0 end) AS SuccessCount,
count(*) as TotalCount
from job_result sr, job, fitnesse_tasks ft
where sr.job_id = job.id and job.fitnesse_task_id = ft.id and
sr.start_time > now() - '30 days'::interval
group by ft.file_path
order by TotalCount;")

#prints and formats results into .csv file
File.open('/usr/local/rvm/tmp/failed_tests_last_30days.csv', 'w+') do |f|
  recordresults = []
  results[1].each_key {|key| recordresults.push(key.to_s)}
  f.puts recordresults.join(",");
  results.each do |row|
    recordresults = []
    row.each_value {|value| recordresults.push(value.to_s)}
    f.puts recordresults.join(",");
  end 
end
