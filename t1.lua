#!/usr/bin/env lua
co = coroutine.create(
function()
    for i=1,3 do
        print('co', i)
        coroutine.yield()
    end
end
)

function costatus()
    print('resume:', coroutine.resume(co))
    print('status:', coroutine.status(co))
end

print(co)
costatus()
costatus()
costatus()
costatus()
costatus()
