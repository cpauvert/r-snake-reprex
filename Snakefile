rule r_empty:
    input:
        "vector.RDS"
    output:
        "plot.png"
    log:
        "logme.log"
    conda:
        "env.yaml"
    script:
        "script.R"

rule r_default:
    input:
        "vector.RDS"
    params:
        extra=''
    output:
        "plot-default.png"
    log:
        "logme-default.log"
    conda:
        "env.yaml"
    script:
        "script.R"

rule r_params:
    input:
        "vector.RDS"
    params:
        extra='list(ylab="Side caption", ylim=c(25,75))'
    output:
        "plot-params.png"
    log:
        "logme-params.log"
    conda:
        "env.yaml"
    script:
        "script.R"

rule search:
    input:
        needle="needle.txt", haystack="haystack.txt"
    output:
        dynamic("search.done")
    log:
        "logsearch.log"
    conda:
        "env.yaml"
    script:
        "search.R"

rule search_bis:
    input:
        needle="needle.txt"
    output:
        dynamic("searchoption.done")
    log:
        "logsearch.log"
    script:
        "search.R"
