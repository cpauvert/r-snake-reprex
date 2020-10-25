rule r_params: 
    input:
        "vector.RDS"
    params: {}
    output:
        "plot.png"
    conda:
        "env.yaml"
    script:
        "script.R"

