# column F has the total number of goals scored for each team
# column A has the total number of goals agains each team
# column Team has the team name
#
# the output should be the name of team with the smallest difference in 'for' and 'against' goals

require_relative 'file_processing'

include FileProcessing

$team_name = ''
$smallest_difference = Float::INFINITY

def find_smallest_difference
  process_file_data('soccer (2).dat')
  unless $team_name.empty?
    puts "Team #{$team_name} has the smallest difference in 'for' and 'against' goals #{$smallest_difference}"
  end
end

def line_to_hash(line)
  columns = line.split
  return {} if columns.empty? || !columns.any? { |item| item.include?('-') }

  {
    team_name: columns[1],
    for_goals: string_to_integer(columns[6]),
    against_goals: string_to_integer(columns[8])
  }
end

def string_to_integer(goals)
  goals = remove_special_characters(goals)
  return goals.to_i unless goals.empty?

  goals
end

def updated_smallest_difference(line_hash)
  if line_hash[:for_goals].is_a?(Integer) && line_hash[:against_goals].is_a?(Integer)
    goals_difference = (line_hash[:for_goals] - line_hash[:against_goals]).abs

    if goals_difference < $smallest_difference
      $smallest_difference = goals_difference 
      $team_name = line_hash[:team_name]
    end
  end
end

find_smallest_difference

