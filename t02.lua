#!/usr/bin/env lua

co = coroutine.create(function(a,b,c)
    print('co', a,b,c)
end)

co2 = coroutine.create(function(a,b)
    print('yield', coroutine.yield(a+b, a-b))
end)

co3 = coroutine.create(function(a,b)
    print('yield', coroutine.yield(a+b, a-b))
    --print('yield', y1, y2)
end)

co4 = coroutine.create(function()
    return 6, 7
end)
--print(coroutine.resume(co, 1,2,3))
--print(coroutine.status(co))
print('resume1', coroutine.resume(co2, 50, 20, 100))
print('resume2', coroutine.resume(co2, 40, 90, 100))
--print(coroutine.resume(co3, 20, 10, 100))
--coroutine.resume(co3, 20, 10, 100)
--print('resume1', coroutine.resume(co3, 60,20,100, '1'))
--print('resume2', coroutine.resume(co3, 50, 30, 100, '2'))
--print('resume3', coroutine.resume(co3, 50, 30, 100, '3'))
--print('resume', (coroutine.resume(co3, 20, 10, 100)))

--print(coroutine.resume(co4))
