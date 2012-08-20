library(grid)
library(lattice)
library(playwith) ## (for panel.usertext, etc)
## + might need others, often library(latticeExtra).
## Assuming that the data are attached and any
## customised style settings are in place; save with
## myStyle <- trellis.par.get(); then restore with
## trellis.par.set(myStyle)
plotOnePage(marginal.plot(dat, data = dat, 
    groups = Exercise, auto.key = list(lines = TRUE, 
        title = "Exercise", cex.title = 1, 
        columns = 2), sub = list("N = 133, 2010-01-15, R 2.10.1", 
        x = 0.99, just = "right", cex = 0.7, 
        font = 1), layout = c(0, 1, 1)), page = 26)
        

