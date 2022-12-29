#!/usr/bin/luajit

local input = io.lines("./input.txt")
local pos1
local pos2
local subset
local marker
local char_pos
local uniq

for line in input do
	for i = 1, #line-3 do
		pos1 = i
		pos2 = i+3
		subset = (string.sub(line, pos1, pos2))

		for char in string.gmatch(subset, "%a") do
			char_pos = string.find(subset, char)
			if not string.match(subset, char, char_pos+1) then
				if char_pos == 4 then
					uniq = true
					marker = pos2
					break
				end
			else
				break
			end
		end

		if uniq then
			break
		end

	end
end
print(marker)
