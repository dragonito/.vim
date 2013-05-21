function SymfonyBundle()
 
    let pattern = '((((|\\)\w+)+)\\\w+Bundle)'
    let namespace = PhpNamespace()

    if namespace == "" && match(namespace, pattern) == -1 
        echo 'nichts'
        return ""
    endif

    echo substitute(namespace, pattern, '\1', '')

endfunction
