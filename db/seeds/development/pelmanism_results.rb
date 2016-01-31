pelmanism_results = []

12.times do |i|
  pelmanism_results.push cpu_level: 1, cpu_score: 0, user_score: 8, log_id: i+1
end
pelmanism_results.each do |pelmanism_result|
  PelmanismResult.create(
    cpu_level: pelmanism_result[:cpu_level],
    cpu_score: pelmanism_result[:cpu_score],
    user_score: pelmanism_result[:user_score],
    log_id: pelmanism_result[:log_id]
  )
end

