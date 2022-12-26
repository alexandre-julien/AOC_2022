#!/usr/bin/luajit

local input = io.lines("./input.txt")
local opponent_hand
local my_hand
local winner
local shape_weight
local round_weight
local score
local score_table = {}
local total = 0

for line in input do
	opponent_hand = string.sub(line, 1, 1)
	my_hand = string.sub(line, 3, 3)

	if opponent_hand == "A" and my_hand == "X" then
		winner = 0
	elseif opponent_hand == "B" and my_hand == "Y" then
		winner = 0
	elseif opponent_hand == "C" and my_hand == "Z" then
		winner = 0
	elseif opponent_hand == "A" and my_hand == "Y" then
		winner = 1
	elseif opponent_hand == "B" and my_hand == "Z" then
		winner = 1
	elseif opponent_hand == "C" and my_hand == "X" then
		winner = 1
	elseif opponent_hand == "A" and my_hand == "Z" then
		winner = 2
	elseif opponent_hand == "B" and my_hand == "X" then
		winner = 2
	elseif opponent_hand == "C" and my_hand == "Y" then
		winner = 2
	end

	if my_hand == "X" then
		shape_weight = 1
	elseif my_hand == "Y" then
		shape_weight = 2
	elseif my_hand == "Z" then
		shape_weight = 3
	end

	if winner == 0 then
		round_weight = 3
	elseif winner == 1 then
		round_weight = 6
	elseif winner == 2 then
		round_weight = 0
	end

	score = shape_weight + round_weight
	table.insert(score_table, score)
end

for _, v in ipairs(score_table) do
	total = total + v
end

print(total)
