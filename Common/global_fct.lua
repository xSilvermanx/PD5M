-- Converts a decimal number to a binary string
-- usage: STRING = NumberToBinStr(INT)
function NumberToBinStr(x)
	ret=""
	while x~=1 and x~=0 do
		ret=tostring(x%2)..ret
		x=math.modf(x/2)
	end
	ret=tostring(x)..ret
	return ret
end

-- Gets the value of the specified bit of a binary string with up to 32 digits.
-- The bits are numbered from high to low starting with 31, ending with 0. Thus the last digit will need n = 0
-- the return value is a string '0' or '1'
-- x needs to be a binary string
-- n needs to be an integer between 0 and 31
-- usage: STRING = GetNthBinaryFlag(STRING, INT)
function GetNthBinaryFlag(x, n) -- returns the value of the bit at position 2**n
	String = NumberToBinStr(x)
	StringDigits = 32 - string.len(String)
	Digits = ""
	for i=1, StringDigits do
		Digits = Digits .. "0"
	end
	PaddedString = Digits .. String
	Bit = 32 - n
	BitValue = string.sub(PaddedString, Bit, Bit)	
	return BitValue
end

-- determines if n is an integer
-- usage: bool = IsInt(NUMBER)
function IsInt(n)
	return n == math.floor(n)
end
