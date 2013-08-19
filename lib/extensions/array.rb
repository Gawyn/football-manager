class Array
  def round_robin
    team_ids = self.each_with_index.map do |element, index|
      [element, index]
    end

    change_local = false
    rounds = 9.times.map do
      matches = team_ids.sort_by { |team_id, index| index }.map(&:first)
      matches = matches.each_slice(2).to_a
      matches = matches.map(&:reverse) if change_local

      team_ids = team_ids.map do |team_id, index|
        if index == 9
          index = 1
        elsif index > 0
          index += 1
        end
        [team_id, index]
      end

      change_local = !change_local
      matches
    end

    second_part = rounds.map do |round|
      round.map(&:reverse)
    end

    rounds + second_part
  end
end
