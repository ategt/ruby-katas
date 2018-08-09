class Game

  def initialize
    @DoorColors = ["Red", "Blue", "Green"]
  end

  def simulate_game(door_colors=@DoorColors)
    doors = door_colors.map { |door_color| {color: door_color, has_prize: false, is_open: false, player_choosen: false} }

    doors.shuffle!

    doors[0][:has_prize] = true
    prize_door = doors[0]

    doors.shuffle!

    doors[0][:player_choosen] = true
    player_door = doors[0]

    doors_without_a_prize = doors.select { |door| door[:has_prize] == false }
    doors_eligible_for_opening = doors_without_a_prize.select { |door| door[:player_choosen] == false }

    doors_eligible_for_opening.shuffle!

    doors_eligible_for_opening[0][:is_open] = true
    open_door = doors_eligible_for_opening[0]

    other_door = doors.select { |door| door[:is_open] == false and door[:player_choosen] == false }[0]

    story = "Monty Hall asks the player to choose a door.  The player chooses the #{player_door[:color]} colored door.  Then Monty Hall opens the #{open_door[:color]} door to reveal that it is empty.  Monty Hall then asks the player if they would like to switch their choosen door, #{player_door[:color]}, for the #{other_door[:color]} colored door, which is the only other door in play.  \n\
\n\
  And while the player ponders their decision, which will decide whether they win or lose, Monty Hall already knows that the prize is behind the #{prize_door[:color]} door. If the player stays they will #{player_door == prize_door ? 'win' : 'lose'} and if the player switches they will #{player_door != prize_door ? 'win' : 'lose'}."

    [ story, player_door == prize_door ? 1 : 0, player_door != prize_door ? 1 : 0 ]
  end    
end