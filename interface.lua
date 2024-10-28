Debug = {
    network = false,
}
Interface = {
    coroutineManager = {},
    thread = function(func)
        Citizen.CreateThread(func)
    end,
    wait = function(seconds)
        Citizen.Wait(seconds)
    end,
    await = function(promise)
        return Citizen.Await(promise)
    end,
    netEvent = function(name, cb)
        Log.debug("-- Registering net event: ^2" .. name)
        RegisterNetEvent(name, function(...)
            if (Debug.network) then
                Log.debug("Received net event: ^2" .. name)
            end
            local src = source or 0
            cb(src, ...)
        end)
    end,
    emitClient = TriggerClientEvent,
    emitServer = TriggerServerEvent,
    promise = promise,
    getGameTimer = GetGameTimer,
    setTimeout = function(delay, fn)
        Interface.thread(function()
            Interface.wait(delay)
            fn()
        end)
    end,
    startTime = GetGameTimer(),
    Vector3 = vector3,
    Vector2 = vector2,
    Vector4 = vector4,
    keyCode = { A = 34, B = 29, C = 26, D = 30, E = 46, F = 49, G = 47, H = 74, K = 311, L = 7, M = 244, N = 249, P = 199, Q = 44, R = 45, S = 33, T = 245, U = 303, V = 0, W = 32, X = 73, Y = 246, Z = 20, UpArr = 27, DownArr = 173, LeftArr = 174, RightArr = 175, LAlt = 19, F11 = 344, NUM1 = 157, NUM2 = 158, NUM3 = 160, NUM4 = 164, NUM5 = 165, NUM6 = 159, NUM7 = 161, NUM8 = 162, NUM9 = 163, LShift = 21, ESC = 322, F1 = 288, F2 = 289, F3 = 170, F5 = 166, F6 = 167, F7 = 168, F8 = 169, F9 = 56, F10 = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ['7'] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, BACKSPACE = 177, TAB = 37, ["["] = 39, ["]"] = 40, ENTER = 18, CAPS = 137, LEFTSHIFT = 21, [","] = 82, ["."] = 81, LEFTCTRL = 36, LEFTALT = 19, SPACE = 22, RIGHTCTRL = 70, HOME = 213, PAGEUP = 10, PAGEDOWN = 11, DELETE = 178, LEFT = 174, RIGHT = 175, TOP = 27, DOWN = 173, NENTER = 201, N4 = 108, N5 = 60, N6 = 107, ["N+"] = 96, ["N-"] = 97, N7 = 117, N8 = 61, N9 = 118 },
    isServer = function()
        return true
    end,
    isClient = function()
        return not IsDuplicityVersion()
    end,
    isControlJustPressed = IsControlJustPressed,
    isControlJustReleased = IsControlJustReleased,
}

Ats.Interface = Interface;
Ats.thread = Interface.thread;
Ats.wait = Interface.wait;
Ats.await = Interface.await;
Ats.netEvent = Interface.netEvent;
Ats.emitClient = Interface.emitClient;
Ats.emitServer = Interface.emitServer;
Ats.promise = Interface.promise;
Ats.getGameTimer = Interface.getGameTimer;
Ats.setTimeout = Interface.setTimeout;
Ats.startTime = Interface.startTime;
Ats.Vector3 = Interface.Vector3;
Ats.Vector2 = Interface.Vector2;
Ats.Vector4 = Interface.Vector4;
Ats.isServer = Interface.isServer;
Ats.isClient = Interface.isClient;
Ats.isControlJustPressed = Interface.isControlJustPressed;
Ats.isControlJustReleased = Interface.isControlJustReleased;
Ats.keyCode = Interface.keyCode;
Ats.natives = Interface.natives;

--- Take globales ---
GPlayer = Player;
GLocalPlayer = LocalePlayer;
GEntity = Entity;

print("Interface loaded ⚡")