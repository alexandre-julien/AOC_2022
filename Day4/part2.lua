#!/usr/bin/luajit

local input = io.lines("./input.txt")
local elf1
local elf2
local elf1_n1
local elf1_n2
local elf2_n1
local elf2_n2
local overlap = 0

for line in input do
	elf1 = string.match(line, "%d+".."-".."%d+"..",")
	elf2 = string.match(line, ",".."%d+".."-".."%d+")
	elf1_n1 = string.match(elf1, "%d+")
	elf1_n2 = string.gsub(string.match(elf1, "-".."%d+"), "-", "")
	elf2_n1 = string.gsub(string.match(elf2, ",%d+"), ",", "")
	elf2_n2 = string.gsub(string.match(elf2, "-".."%d+"), "-", "")
	elf1_n1 = tonumber(elf1_n1)
	elf1_n2 = tonumber(elf1_n2)
	elf2_n1 = tonumber(elf2_n1)
	elf2_n2 = tonumber(elf2_n2)

	if elf2_n1 >= elf1_n1 and elf2_n1 <= elf1_n2 then
		overlap = overlap + 1
	elseif elf2_n2 >= elf1_n1 and elf2_n2 <= elf1_n2 then
		overlap = overlap + 1
	elseif elf1_n1 >= elf2_n1 and elf1_n1 <= elf2_n1 then
		overlap = overlap + 1
	elseif elf1_n2 >= elf2_n1 and elf1_n2 <= elf2_n2 then
		overlap = overlap + 1
	end

end
print(overlap)
