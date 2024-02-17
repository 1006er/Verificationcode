local _M = {}
function _M.get_redis()
    -- 连接redis 数据库
    local redis = require('resty.redis')
    local red = redis:new()
    red:set_timeouts(1000,1000,1000)
    local ok, err = red:connect("127.0.0.1", 6379)
    if not ok then
        ngx.say("Failed to connect to Redis  ", err)
        return
    end
    ok, err = red:auth("000415")
    if not ok then
        ngx.say("Failed to authenticate to Redis  ", err)
        return
    end
    return red
end

function _M.close_redis(red)
    -- 关闭redis数据库连接
    if not red then
        return
    end
    local ok, err = red:close()
    if not ok then
        ngx.say("close redis error : ", err)
    end
end
return _M