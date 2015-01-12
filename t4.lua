#!/usr/bin/env lua

co = coroutine.create(
    function(a,b)
        print('params', a,b)
        return coroutine.yield(3,3)
    end
)

print(coroutine.resume(co, 1, 2))
print('status:', coroutine.status(co))
print(coroutine.resume(co, 4, 5))
print('status:', coroutine.status(co))
