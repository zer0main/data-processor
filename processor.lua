-- data-processor, script for the processing of
-- experimental data
-- Copyright (C) 2015 Pavel Dolgov
--
-- See the LICENSE file for terms of use.

-- Calculate the distance using special formula.
-- cof argument is the coefficient of friction.
local function calculateDistance(height, angle,
                                 cof)
    local exponent = math.exp(-2 * angle * cof)
    local cotangent = 1 / math.tan(angle)
    local distance = height * exponent *
        (1 / cof - cotangent)
    return distance
end
