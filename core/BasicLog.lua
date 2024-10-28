Log = {}

Log.LogLevel = {
    TRACE = 0,
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
    FATAL = 5
}

Log.LogLevelNames = {
    [Log.LogLevel.TRACE] = "TRACE",
    [Log.LogLevel.DEBUG] = "DEBUG",
    [Log.LogLevel.INFO] = "INFO",
    [Log.LogLevel.WARN] = "WARN",
    [Log.LogLevel.ERROR] = "ERROR",
    [Log.LogLevel.FATAL] = "FATAL"
}

Log.CurrentLogLevel = Log.LogLevel[Project.logLevel];

function Log.trace(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.TRACE then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print(Log.LogLevelNames[Log.LogLevel.TRACE], message)
end

function Log.info(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.INFO then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print("^4" .. Log.LogLevelNames[Log.LogLevel.INFO] .. "^7", message)
end

function Log.debug(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.DEBUG then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print("^2" .. Log.LogLevelNames[Log.LogLevel.DEBUG] .. "^7", message)
end

function Log.warn(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.WARN then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print("^3" .. Log.LogLevelNames[Log.LogLevel.WARN] .. "^7", message)
end

function Log.error(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.ERROR then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print("^8" .. Log.LogLevelNames[Log.LogLevel.ERROR] .. "^7", message)
end

function Log.system(message, ...)
    if Log.CurrentLogLevel > Log.LogLevel.ERROR then
        return ;
    end
    local args = { ... }
    message = string.format(message, table.unpack(args))
    Log.print("^9System^7", message)
end

function Log.print(level, message)
    print(("[^9%s^7][%s] %s^7"):format(Project.name, level, message));
end

Log.system(("Log level : ^4%s^7"):format(Project.logLevel))