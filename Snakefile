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
        {}
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
        {'ylab':"Side caption", 'ylim':[25,75]}
    output:
        "plot-params.png"
    log:
        "logme-params.log"
    conda:
        "env.yaml"
    script:
        "script.R"

