function permgen(a, n)
    n = n or #a
    if n<=1 then
        printResult(a)
    else
        for i=1,n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n-1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

function printResult(a)
    for i=1, #a do
        io.write(a[i], '  ')
    end
    io.write('\n')
end

--permgen({1,2,3,4,6})
--permgen({1,2,3,4})
--permgen({1,2,3})
--permgen({1,2})
