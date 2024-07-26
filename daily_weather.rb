# column one has the day number
# column two has the highest temperature
# column three has the minimum temperature
#
# the output should be the day number with the smallest temperature spread

require_relative 'file_processing'

include FileProcessing

$day_with_smallest_spread = ''
$smallest_spread = Float::INFINITY

def find_smallest_temperature
  process_file_data('w_data (1).dat')
  unless $day_with_smallest_spread.empty?
    puts "Day #{$day_with_smallest_spread} has the smallest temperature spread #{$smallest_spread}"
  end
end

def line_to_hash(line)
  columns = line.split
  return {} if columns.size < 3

  {
    day: columns[0],
    max_temp: parse_temperature(columns[1]),
    min_temp: parse_temperature(columns[2])
  }
end

def parse_temperature(temperature)
  temperature = remove_special_characters(temperature)
  return temperature.to_f unless temperature.empty?

  temperature
end

def updated_smallest_difference(line_hash)
  if line_hash[:max_temp].is_a?(Float) && line_hash[:min_temp].is_a?(Float)
    temperature_difference = line_hash[:max_temp] - line_hash[:min_temp]

    if temperature_difference < $smallest_spread
      $smallest_spread = temperature_difference
      $day_with_smallest_spread = line_hash[:day]
    end
  end
end

find_smallest_temperature

