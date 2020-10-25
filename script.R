# Prepare arguments (no matter the order)
args<-list(
           x = readRDS(snakemake@input[[1]])
           )
# Check if extra params are passed
if(length(snakemake@params) > 0 ){
       if(length(snakemake@params[[1]]) == 0 ){
           message("No optional parameters. Using defaults parameters from base::plot()")
       }
       if(is.list(snakemake@params[[1]])){
           # Add them to the list of arguments
           args<-c(args,snakemake@params[[1]])
       } else{
           message("Optional R parameters should be passed as Python dictionary")
           message("in the Snakefile. Check the example below:")
           message("\tparams: { 'verbose': True, 'foo': [1,42] }")
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
