#!/usr/bin/env lua
function foo (a)
    print("foo", a)  -- foo 2
    return coroutine.yield(2 * a) -- return: a , b
end

co = coroutine.create(function (a , b)
    print("co-body1", a, b) -- co-body 1 10
    local r = foo(a + 1)

    print("co-body2", r)
    local r, s = coroutine.yield(a + b, a - b)
    print('r,s', r,s)

    print("co-body3", r, s)
    return b, "end"
end)

print("1------")
print("main", coroutine.resume(co, 1, 10)) -- true, 4
print("2------")
print("main", coroutine.resume(co, "r0000000", 'eeee')) -- true 11 -9
print("3------")
print("main", coroutine.resume(co, "x", "y")) -- true 10 end
print("4------")
print("main", coroutine.resume(co, "x", "y")) -- false cannot resume dead coroutine
