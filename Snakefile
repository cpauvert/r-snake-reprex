rule r_empty:
    input:
        "vector.RDS"
    output:
        "plot.png"
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
    conda:
        "env.yaml"
    script:
        "script.R"

