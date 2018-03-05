module Tachyons

using WebIO

export tachyons_css, @class_str

const tachyons_css = Scope(imports=["/pkg/Tachyons/tachyons.min.css"])

macro class_str(s)
    :(function (elem)
          if haskey(props(elem), :className)
              elem(className=props(elem)[:className] * " " * $(esc(s)))
          else
              elem(className=$(esc(s)))
          end
      end)
end

end # module
