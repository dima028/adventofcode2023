# time = 71530
# distance = 940200

time = 45988373
distance = 295173412781210

j = 0

for i in 1..(time.to_i-1)
  remTime = time.to_i - i
  act_distance = i*remTime
  if act_distance > distance
    j += 1
  end
end

puts j
# ANS 30565288
