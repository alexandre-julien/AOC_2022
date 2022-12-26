#!/usr/bin/luajit

local input = io.lines("./input.txt")
local sum = 0
local t = {}

for line in input do
	if line ~= "" then
		sum = sum + line
	else
		table.insert(t, sum)
		sum = 0
	end
end

table.sort(t)
print(t[#t]+t[#t-1]+t[#t-2])
