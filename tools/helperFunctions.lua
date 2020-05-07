local HelperFunc = {}

    function HelperFunc:Lerp(pos1, pos2, perc)
        return (1-perc)*pos1 + perc*pos2 -- Linear Interpolation
    end

    function HelperFunc:angleLerp(pos1, pos2, perc)
        return pos1 + shortAngle(pos1, pos2) * perc
    end

    function shortAngle(a0, a1)
        local max = math.pi * 2
        local da = (a1 - a0) % max;
        return 2*da % max - da
    end

    function HelperFunc:Approach(first, last, shift)
        if(first < last) then
            return math.min(first + shift, last)
        elseif (first > last) then
            return math.max(first - shift, last)
        else return end
    end

    function HelperFunc:boolToNumber(value)
        return value == true and 1 or value == false and 0
    end

return HelperFunc