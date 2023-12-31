stars = "....................#........#...............................#............................................................#................#
............#...................................#........................................#........#..................#...........#..........
.#.......................#..................................................................................................................
..........................................................#.................................................#...............................
...................................#..........................................#.............................................................
...........................................#......................#.........................................................................
......................#.....................................................................................................................
..................................................#.........#.........#.......................#............................#.......#......#.
......#.........#............#.............................................#................................................................
.#................................#.....................#.......................#........................#..................................
..........................................#.................................................................................................
.......................................................................................#......................#.............................
.....................................................................#..............................................#.....#.................
........#.................#.................................................................................................................
....................................#.................#........................................................................#............
.............#...........................#.......................#................#..................#.................................#....
#...........................................................................#...............................................................
......................#......#..............................................................................................................
.................................................#........................................................#.................................
.....................................#...................................................#........................#.........................
........#................#................................#.................................................................................
...................#................................................................#........#...............#..............#...............
.......................................................................................................#..........................#.........
..................................#.......#.........................................................................#...................#...
.............#.................................#........................#...................................................................
.....................#..................................#......................................#................#...........................
...............................................................#.....................#..................................#...................
#.........#...................#................................................#........................#...................................
...................................#..................................#............................................................#........
............................................#.........#...........................................#.........................................
...#.............................................#........................................................................#.................
........#..........#........#.................................................................................#.................#......#....
..............................................................#..................#..........................................................
.....................................................................#......................................................................
.................................................................................................................#..........................
...............#...............................#....................................................#.......................................
...........................#................................................................#........................................#......
...........#.....................#..................#............#...........#.......#.....................#................................
............................................................................................................................................
...............................................................................................................................#.........#..
.......................................................................................................................#....................
........#................#.....#.....#.................#.........................................#..........................................
..................................................#...................................#.....................................................
....#...........#.............................................................#..............#...............#...................#..........
............................................#...............#.........................................................................#.....
....................#.......................................................................................................................
#......#..........................#..................#...............#.....#................................................................
...........................................................................................#......................#........................#
...........#................................................................................................................................
...............................................................................#...................#........................................
.......................#..............#......#..............#...........................#..................................#................
............................................................................................................................................
...................#...........#.................................................................................................#..........
.......................................................................................................#.....#..............................
........................................................#...........................#................................#......................
...............#...................................................#..........#...........#.................................................
...........................................#......................................................#.........................................
.........#.......................................#..........................................................................................
..........................#...............................................................................#........#......................#.
...........................................................#...............#...........#......#..........................#..................
.................#......................#.............................#........................................................#............
.............................................................................................................#..............................
...............................#...............................................#............................................................
............................................#.........#.....................................................................#...............
...#......................#........#.............................................................#..................#.....................#.
................................................#..............#.......................#..............#.....................................
............................................................................................................................................
#...........................................................................................................................................
......#..............#....................................#........#................................................................#.......
..............#.............#.........#..........................................#..........................................................
..................................................................................................#............................#..........#.
...........................................#...................#.......................................#.....#..............................
.................................#....................#................................#....................................................
............................................................................................................................................
........................................................................#...................................................#...............
..#..............................................#...........................................#...................#.....#.............#......
......................#.....................................................................................................................
...............................#......#..........................................................#.......#.....................#............
..........#.....#.................................................#.............#...........................................................
............................................................................................................................................
............................#.................................#.........#...................................................................
.......................................................#................................#...........................#.......................
...........................................................................................................................#.........#......
...................#..............................#..............................#...............#.........#................................
..........#..............#.....................................................................................................#............
............................................................................................................................................
................#.........................................................#...............................................................#.
.................................#.....................................................................#....................................
.....#................................................#.....................................#...............................................
.............................#...............................#................#..............................#..............................
......................................................................................#...............................#........#............
............................................................................................................................................
...........#..........#..............................................#..............................................................#.......
................................................#..............#...................................................#........................
......#...........#.........................................................#...............#...............................................
...............................#.....................................................#...............#...................................#..
..............#.......................#.....................#...............................................................................
.........................#........................#...........................................................................#......#......
.........................................................................................................#..................................
............................................................................................................................................
...#......................................................#.................................................................................
........................................#.................................................#........#..............#.....#...................
....................#................................#..........................#...........................................................
#.................................#..................................................#.........#.......#.............................#......
...........#.........................................................#.......................................................#..............
......#......................#.................#.............................#..............................................................
........................................................#.........................................#............#.................#..........
..................#....................#.....................................................#..............................................
..........................#......................................................#......#................................#..................
................................#............#.........................................................#.................................#..
............................................................................................................................................
...#........................................................#...............................................................................
..............#.....................................#................................................................................#......
....................................................................................................................#...........#...........
...................#.........................................................................#..............................................
.............................#........#.....................................................................................................
................................................................#................................................#..........................
..#..........#...................................#..............................#........#................#.................................
..................................#........................................................................................#................
.....................#....................................#....................................#.....#......................................
........#.......#..............................................................................................#...................#........
...........................#..............#..........#............#......................................................................#..
.#..........................................................................................................................................
............#....................................#.....................................................................#....................
.............................................................#.............#.........#.....#........#.......................................
......#...........................#.......................................................................#.................................
........................................................#..................................................................#................
#..........................#.............#.........................#..........#...................................#.........................
....................#....................................................................#.............#..........................#.....#...
............................................................................................................................................
.....................................................#..................#................................................#..................
...#....................#......#............................#.....................#.................#.......................................
............#...................................#...........................................................................................
............................................................................................#...............................................
...................#...................................................................#..................#.................#.........#.....
#.................................#........#..........#..........................................#..........................................
.....#......................................................................................................................................
.......................#................................................#........................................#..........................
.................................................................#...........#............#..........#...................................#..
..............#......................#.......#.........................................................................#...................."

# stars = "...#......
# .......#..
# #.........
# ..........
# ......#...
# .#........
# .........#
# ..........
# .......#..
# #...#....."

def transpose(s)
  lines = s.split("\n")
  longest = lines.map(&:length).max

  (0..longest).map do |index|
    lines.map { |l| l[index] || ' ' }.join
  end * "\n"
end

def expand(stars)
  new_stars = ""
  stars.each_line do |line|
    unless line.include?("#")
      new_stars << "*" * (line.length - 1) + "\n"
    end
    new_stars << line
  end
  new_stars
end

new_stars = expand(stars)
transposed_stars = transpose(new_stars)
new_transposed_stars = expand(transposed_stars)
new_transposed_stars = transpose(new_transposed_stars) # correct orientation

puts "new_transposed_stars: ", new_transposed_stars, "\n"

hm = {}
num = 0;
new_transposed_stars.each_line.with_index do |line, y|
  line.each_char.with_index do |char, x|
    if char == "#"
      hm[num] = [x, y]
      num += 1
    end
  end
end

puts hm

sum = 0

hm.each_pair do |key, value|
  hm.each_pair do |key2, val2|
    if key >= key2
      next
    end


    sum += (value[0] - val2[0]).abs + (value[1] - val2[1]).abs
  end
end

puts sum
# ANS 9591768
