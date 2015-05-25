-- data-processor, script for the processing of
-- experimental data
-- Copyright (C) 2015 Pavel Dolgov
--
-- See the LICENSE file for terms of use.

-- Calculate the distance using special formula.
-- cof argument is the coefficient of friction.
local function calculateDistance(height, angle, cof)
    local exponent = math.exp(-2 * angle * cof)
    local cotangent = 1 / math.tan(angle)
    local distance = height * exponent *
        (1 / cof - cotangent)
    return distance
end

-- Calculate the distance using wrong formula.
-- (It's necessary to compare the experimental results with
-- results calculated by the wrong formula and results
-- calculated by the correct formula.)
-- cof argument is the coefficient of friction.
local function calculateDistanceWrongly(height, angle, cof)
    local cotangent = 1 / math.tan(angle)
    local distance = height * (1 / cof - cotangent)
    return distance
end

local out = io.open('results.txt', 'w')

for line in io.stdin:lines() do
    local height, sin, cof =
        line:match('([%d.]+)%s([%d.]+)%s([%d.]+)')
    if (height == nil) then break end
    height = tonumber(height)
    sin = tonumber(sin)
    cof = tonumber(cof)
    local angle = math.asin(sin)
    local distance = calculateDistance(height, angle, cof)
    out:write(tostring(distance), "\n")
end

out:close()
