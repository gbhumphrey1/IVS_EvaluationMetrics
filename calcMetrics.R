    gamma.1 <- 0.7
    
    dat.names <- c("AR1", "AR9", "TAR1", "TAR2", "NL", "Friedman", "Bank", "Miller", "Kentucky", "Salinity")
    for(dat.i in 1:length(dat.names)) {
      dat.name <- dat.names[dat.i]
      switch(dat.name,
         AR1 = {correct.inps <- c("x.t-1")},
         AR9 = {correct.inps <- c("x.t-1", "x.t-4", "x.t-9")},
         TAR1 = {correct.inps <- c("x.t-3")},
         TAR2 = {correct.inps <- c("x.t-6", "x.t-10")},
         Bank = {correct.inps <- c("a1cx", "a1cy", "b2x", "b2y", "a2pop",
                                   "a3pop", "temp", "mxql")},
         Friedman = {correct.inps <- c("x1", "x2", "x3", "x4", "x5")},
         Salinity = {correct.inps <- c("MAS.t-1", "WAS.t-1", "L7F.t-1")},
         Kentucky = {correct.inps <- c("Qt.t-1", "Qt.t-2", "Ert.t", "Ert.t-1")},
         NL = {correct.inps <- c("x.2", "x.6", "x.9")},
         Miller = {correct.inps <- c("x1", "x2")},
         correct.inps <- NULL)
    }

    sel.inps <- vector() #### define/read in inputs selected as relevant by IVS method here. 
                              Store as vector of input names.
    P <- 1 #### define/read in number of inputs in candidate input pool
    K <- length(correct.inps)
    k <- sum(sel.inps %in% correct.inps)
    p <- sum(!(sel.inps %in% correct.inps))
   
    SA.c <- k / K
    SA.e <- 1 - p / (P - K)
    SA <- gamma.1 * SA.c + (1 - gamma.1) * SA.e
   
