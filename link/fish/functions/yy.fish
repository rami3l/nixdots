# Rename this file to match the name of the function
# e.g. ~/.config/fish/functions/yy.fish
# or, add the lines to the 'config.fish' file.

function yy --description 'support auto cd on exiting yazi'
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
