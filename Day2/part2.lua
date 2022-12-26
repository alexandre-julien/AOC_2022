#!/usr/bin/luajit

local input = io.lines("./input.txt")
local opponent_hand
local round_outcome
local chosen_shape
local shape_weight
local round_weight
local score
local score_table = {}
local total = 0

for line in input do
	opponent_hand = string.sub(line, 1, 1)
	round_outcome = string.sub(line, 3, 3)

	-- x need to lose, y draw, z win
	if round_outcome == "X" then
		if opponent_hand == "A" then
			chosen_shape = "C"
		elseif opponent_hand == "B" then
			chosen_shape = "A"
		elseif opponent_hand == "C" then
			chosen_shape = "B"
		end
		round_weight = 0
	elseif round_outcome == "Y" then
		chosen_shape = opponent_hand
		round_weight = 3
	elseif round_outcome == "Z" then
		if opponent_hand == "A" then
			chosen_shape = "B"
		elseif opponent_hand == "B" then
			chosen_shape = "C"
		elseif opponent_hand == "C" then
			chosen_shape = "A"
		end
		round_weight = 6
	end

	if chosen_shape == "A" then
		shape_weight = 1
	elseif chosen_shape == "B" then
		shape_weight = 2
	elseif chosen_shape == "C" then
		shape_weight = 3
	end

	score = shape_weight + round_weight
	table.insert(score_table, score)
end

for _, v in ipairs(score_table) do
	total = total + v
end

print(total)
