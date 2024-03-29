\name{si4bayesmeta-package}
\alias{si4bayesmeta-package}
\alias{si4bayesmeta}
\docType{package}
\title{
\packageTitle{si4bayesmeta}
}
\description{
\packageDescription{si4bayesmeta}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{Sensitivity and identification estimates for all the parameters in the Bayesian normal-normal hierarchical model (NNHM) induced by a Half-Normal (HN) and a Half-Cauchy (HC) heterogeneity priors are produced by two d2BC_S_I_HN_raw and d2BC_S_I_HC_raw functions. Six scenarios are considered: target relative latent model complexity (RLMC) values fixed at 0.25, 0.5 and 0.75 with RLMC-adjusted HN and HC heterogeneity priors. Corresponding posterior estimates can be obtained by the functions raw_estimates_HN and raw_estimates_HC. The methodology implemented in this package has been developed in Roos et al. (2020).}
\packageIndices{si4bayesmeta}
 An overview of how to use the 
 package, including the most
 important functions 
}
\author{
\packageAuthor{si4bayesmeta}

Maintainer: \packageMaintainer{si4bayesmeta}
}
\references{
Roos, M., Hunanyan, S., Bakka, H., Rue, H. (2020). Sensitivity and Identification quantification by a relative latent model complexity perturbation in the Bayesian meta-analysis. Manuscript submitted to Research Synthesis Methods. 
}
%%\keyword{ package }
%%\seealso{
%%~~ Optional links to other man pages, e.g. ~~
%%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
\examples{
# Acute Graft rejection (AGR) data analyzed in Friede et al. (2017),  
# Sect. 3.2, URL: https://doi.org/10.1002/bimj.201500236
# First study: experimental group: 14 cases out of 61; 
# control group: 15 cases out of 20 
# Second study: experimental group: 4 cases out of 36; 
# control group: 11 cases out of 36 
  rT<-c(14,4)
  nT<-c(61,36)
  rC<-c(15,11)
  nC<-c(20,36)
  
  df = data.frame(y = log((rT*(nC-rC))/(rC*(nT-rT))), # log-odds-ratio
                  sigma = sqrt(1/rT+1/(nT-rT)+1/rC+1/(nC-rC)), # SE(log-odds-ratio)
                  labels = c(1:2))



####---- Settings: hh, t_RLMC, Prior parameter values for mu ----####

# Set the normal prior parameter values for mu according to Roever 2018, bayesmeta
# Suitable for logOR and log-odds scale with the unit information argument
mu_mean<-0
mu_sd<-4


# set a global parameter for RMC (relative model complexity) perturbation
hh0<-0.0044 # new value obtained empirically by adjusting it for the epsilon-local 
# sensitivity approach
# with grid_epsilon=0.00354 for RLMC adjusted HN, HC heterogeneity priors with targets
# (0.25,0.5,0.75) in the case of NNHM 

# Fix the value of the target RMC
t_RLMC_025<-0.25

####---- HN: S-I measure (based on the second derivative d2BC/dRLMC at base/target RLMC0) 
#computation for a NNHM ----####

res_d2BC_S_I_rlmc025_HN_raw <- d2BC_S_I_HN_raw(df=df, hh=hh0, 
  rlmc=t_RLMC_025, mu_mean=mu_mean, mu_sd=mu_sd)
res_d2BC_S_I_rlmc025_HN_raw


####---- HC: S-I measure (based on the second derivative d2BC/dRLMC at base/target RLMC0) 
#computation for a NNHM ----####

res_d2BC_S_I_rlmc025_HC_raw <- d2BC_S_I_HC_raw(df=df, hh=hh0, 
  rlmc=t_RLMC_025, mu_mean=mu_mean, mu_sd=mu_sd)
res_d2BC_S_I_rlmc025_HC_raw

}
