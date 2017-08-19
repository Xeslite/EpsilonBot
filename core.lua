local b="wVWXANOuvHIJPexyz0BCDEghijklmnoFG1QRSTUfpq23rstKLM89+YZabcd4567/";

function encrypt(data)
    return ((data:gsub(".", function(x) 
        local r,b="",x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and "1" or "0") end
        return r;
    end).."0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
        if (#x < 6) then return "" end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=="1" and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ "", "", "" })[#data%3+1]);
end;

function decrypt(data)
    data = string.gsub(data, "[^"..b.."=]", "")
    return (data:gsub(".", function(x)
        if (x == "=") then return "" end
        local r,f="",(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and "1" or "0") end
        return r;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if (#x ~= 8) then return "" end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=="1" and 2^(8-i) or 0) end
        return string.char(c)
    end));
end;

OOOOI = {}
OOOOI["OOOII"] = decrypt("DL") --S
OOOOI["OOIII"] = decrypt("lG") --n
OOOOI["OIIII"] = decrypt("jw") --d
OOOOI["IIIII"] = decrypt("zz") --A
OOOOI["OOOIO"] = decrypt("lL") --o
OOOOI["OOIIO"] = decrypt("Cz") --M
OOOOI["OIIIO"] = decrypt("mL") --s	
OOOOI["IIIIO"] = decrypt("iz") --a
OOOOI["OOIOO"] = decrypt("jL") --g
OOOOI["OIIOO"] = decrypt("jz") --e
OOOOI["IIIOO"] = decrypt("mw") --p
OOOOI["IIOOO"] = decrypt("mG") --r
OOOOI["IOOOO"] = decrypt("kz") --i
OOOOI["OOIOO"] = decrypt("nw") --t

TestPrint = OOOOI["IIIOO"]..OOOOI["IIOOO"]..OOOOI["IOOOO"]..OOOOI["OOIII"]..OOOOI["OOIOO"]
TestPrint("test")
TestPrinter = _G[OOOOI["IIIOO"]..OOOOI["IIOOO"]..OOOOI["IOOOO"]..OOOOI["OOIII"]..OOOOI["OOIOO"]]



--("EPSILON_TYPING",2,"Channel",1) --SendAddonMessage













