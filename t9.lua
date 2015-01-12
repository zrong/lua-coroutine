#!/usr/local/openresty/luajit/bin/luajit

require 'socket'

host = 'www.w3.org'
file = '/TR/html5/'

function download(host, file)
    local c = assert(socket.connect(host, 80))
    local count = 0
    c:send('GET '.. file .. ' HTTP/1.0\r\n\r\n')

    while true do
        local s, status, partial = receive(c)
        count = count + #(s or partical)
        if status == 'closed' then break end
    end
    c:close()
    print(file, count)
end

function receive(conn)
    conn:settimeout(0)
    local s, status, partial = conn:receive(2^10)
    if status == 'timeout' then
        coroutine.yield(conn)
    end
    return s or partial, status
end
