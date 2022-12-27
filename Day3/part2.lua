#!/usr/bin/luajit

local input = io.lines("./input.txt")
local match
local prio = {
	a = 1,
	b = 2,
	c = 3,
	d = 4,
	e = 5,
	f = 6,
	g = 7,
	h = 8,
	i = 9,
	j = 10,
	k = 11,
	l = 12,
	m = 13,
	n = 14,
	o = 15,
	p = 16,
	q = 17,
	r = 18,
	s = 19,
	t = 20,
	u = 21,
	v = 22,
	w = 23,
	x = 24,
	y = 25,
	z = 26,
	A = 27,
	B = 28,
	C = 29,
	D = 30,
	E = 31,
	F = 32,
	G = 33,
	H = 34,
	I = 35,
	J = 36,
	K = 37,
	L = 38,
	M = 39,
	N = 40,
	O = 41,
	P = 42,
	Q = 43,
	R = 44,
	S = 45,
	T = 46,
	U = 47,
	V = 48,
	W = 49,
	X = 50,
	Y = 51,
	Z = 52,
}

local lines = {}
local groups = {}
local buf = ""
local pos1 = 1
local pos2 = 3
local sum = 0

for line in input do
	table.insert(lines, line)
end

while pos2 <= #lines do
	for j = pos1, pos2 do
		buf = buf .. lines[j] .. "|"
	end
	table.insert(groups, buf)
	buf = ""
	pos1 = pos2+1
	pos2 = pos1+2
end

for _, v in ipairs(groups) do
	for char in string.gmatch(v, "%a") do
		local reg = char .. ".*|.*" .. char .. ".*|.*" .. char
		if string.match(v, reg) then
			match = char
			break
		end
	end
	sum = sum + prio[match]
end
print(sum)
