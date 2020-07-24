require 'csv'
require 'pry'
require 'json'

result = {}

CSV.foreach('./benchmarked_app.csv', headers: true) do |row|
  result[row['uri']] ||= {}
  result[row['uri']]['time_total'] ||= 0
  result[row['uri']]['times'] ||= 0
  result[row['uri']]['time_total'] += row['time'].to_f
  result[row['uri']]['times'] += 1
end

result.each {|r| result[r[0]]['avarage'] = r[1]['time_total'] / r[1]['times']}

result = result.sort_by {_2['avarage']}

puts JSON.pretty_generate(result)
