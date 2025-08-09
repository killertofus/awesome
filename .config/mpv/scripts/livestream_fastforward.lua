mp.observe_property("paused-for-cache", "native", function(_, paused)
    if paused then
        mp.commandv("seek", "100", "absolute-percent")
    end
end)

