function PhpNamespace()

    let pattern = '\v(.*\/\l+)((\/\u\w+)+)\/\u\w+.php$'
    let file = expand("%:p")

    if match(file, pattern) != -1
       return "namespace " . substitute(substitute(substitute(file, pattern, '\2', ''), '\/', '\\\', 'g'), '^\\\', '', '') . ";"
    endif

    return ""

endfunction
