#!/usr/bin/luajit

local input = io.lines("./input.txt")
local stack1 = {"W", "D", "G", "B", "H", "R", "V"}
local stack2 = {"J", "N", "G", "C", "R", "F"}
local stack3 = {"L", "S", "F", "H", "D", "N", "J"}
local stack4 = {"J", "D", "S", "V"}
local stack5 = {"S", "H", "D", "R", "Q", "W", "N", "V"}
local stack6 = {"P", "G", "H", "C", "M"}
local stack7 = {"F", "J", "B", "G", "L", "Z", "H", "C"}
local stack8 = {"S", "J", "R"}
local stack9 = {"L", "G", "S", "R", "B", "N", "V", "M"}
local move_amt
local from
local to

local function n2stack(n)
	n = tonumber(n)
	if n == 1 then
		return stack1
	elseif n == 2 then
		return stack2
	elseif n == 3 then
		return stack3
	elseif n == 4 then
		return stack4
	elseif n == 5 then
		return stack5
	elseif n == 6 then
		return stack6
	elseif n == 7 then
		return stack7
	elseif n == 8 then
		return stack8
	elseif n == 9 then
		return stack9
	end
end

for line in input do
	for n in string.gmatch(line, "%d+") do
		if move_amt == nil then
			move_amt = n
		elseif from == nil then
			from = n
		elseif to == nil then
			to = n
		end
	end

	for _ = 1, move_amt do
		table.insert(n2stack(to), n2stack(from)[#n2stack(from)])
		table.remove(n2stack(from), #n2stack(from))
	end

	move_amt = nil
	from = nil
	to = nil
end

local res = ""
for i = 1, 9 do
	res = res .. n2stack(i)[#n2stack(i)]
end

print(res)
