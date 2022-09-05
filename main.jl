using Luxor
using Colors
using StatsBase

width, heigth = 1584, 396 # linkedin background size
Luxor.Drawing(width, heigth, "output.png")

Luxor.background(Colors.RGB(14/255, 12/255, 10/255))
Luxor.fontface("JuliaMono")
Luxor.fontsize(32)

function random_unicode()
    ranges = [
        0x00021:0x0007E, # basic latin
        0x02200:0x022FF, # mathematical operators
        0x1D400:0x1D7FF, # mathematical alphanumeric symbols
    ]
    weights = [88, 4, 8]
    range = StatsBase.sample(ranges, StatsBase.Weights(weights))
    code = rand(range)
    return string(Char(code))
end

x_offset, y_offset = -11, 16
x_step, y_step = 22, 32
for x in x_offset:x_step:width+x_step
    for y in y_offset:y_step:heigth+y_step
        text_color = Colors.LCHab(100, 200, rand()*360)
        Luxor.sethue(text_color)
        Luxor.text(random_unicode(), x, y)
    end
end

Luxor.finish()