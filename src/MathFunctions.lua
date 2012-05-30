function round(num,idp)
    local mult = 10^(idp or 0)
    return math.floor(num*mult+0.5)/mult
end

function comma_val(num)
    local formatted = num
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)",'%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end