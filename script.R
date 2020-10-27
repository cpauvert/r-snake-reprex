# Sink the stderr and stdout to the snakemake log file
log.file<-file(snakemake@log[[1]],open="wt")
sink(log.file)
sink(log.file,type="message")

# Prepare arguments (no matter the order)
args<-list(
           x = readRDS(snakemake@input[[1]])
           )
# Check if extra params are passed
if(length(snakemake@params) > 0 ){
       extra<-eval(parse(text=snakemake@params[["extra"]]))
       if(is.list(extra)){
           # Add them to the list of arguments
           args<-c(args, extra)
       } else{
           message("Optional R parameters should be passed as a string list")
           message("in the Snakefile. Check the example below:")
           message("params:\n\textra='list(verbose=TRUE, foo=c(1,42) )'")
           message("Using defaults parameters from base::plot()")
       }
} else{
    message("No optional parameters. Using defaults parameters from base::plot()")
}

message("printing snakemake@params")
print(snakemake@params)

# Plot and Save
png(snakemake@output[[1]])
do.call(plot, args)
dev.off()
save.image()
