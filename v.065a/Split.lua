function split(str,c)
    a=string.find(str,c)
    str = string.gsub(str,c,"",1)
    aCount=0
    start=1
    array={}
    last=0
    
    while a do
        array[aCount] = string.sub(str,start,a-1)
        start=a
        a=string.find(str,c)
        
        str=string.gsub(str,c,"",1)
        aCount=aCount+1
    end
return array
end