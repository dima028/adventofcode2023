# times = %w[7  15   30]
# distances = %w[9  40  200]

times = %w[45 98 83 73]
distances = %w[295 1734 1278 1210]

j = []

times.each.with_index do |time, idx|
  max_distance = distances[idx].to_i
  j[idx] = 0
  for i in 1..(time.to_i-1)
    remTime = time.to_i - i
    act_distance = i*remTime
    if act_distance > max_distance
      j[idx] += 1
    end
  end
end

ans = 1
j.each do |js|
  ans *= js
end

puts ans
# ANS 1413720
