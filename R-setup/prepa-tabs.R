
###
### Tables Chapter 2 -----------------------------------------------------------

## eff
kab_eff <- tibble(
  area = c(
    "Single, homogeneous stand",
    "15-ha plot",
    "1000-ha forest",
    "Natural area",
    "Species area"
  ),
  n = c("30", "100", "400", "800", "2000 to 3000")
)

## c03
kab_c03 <- tibble(
  a     = c( 100  ,  200  ,  400  , 1000  , 2500  , 5000  , 10000  ),
  n     = c(5000  , 2500  , 1250  ,  500  , 2900  ,  100  ,    50  ),
  delta = c(  17.4,   18.7,   20.0,   21.4,   20.1,   22.4,    23.5),
  cv    = c( 114.5,   87.0,   65.7,   44.4,   26.2,   20.5,    14.9)
)

###
### Tables chapter 4 -----------------------------------------------------------

## one
kab_one <- tibble(
  forest    = c(       1,                 1,           1,           1,           2, "$\\vdots$"),
  area      = c(     400, "40$\\textit{1}$",         400,         400,         650, "$\\vdots$"),
  plot      = c(     1.1,               1.1,         1.1,         1.2, "$\\vdots$", "$\\vdots$"),
  longitude = c(   7.345,             7.345,       7.345,       7.832, "$\\vdots$", "$\\vdots$"),
  latitude  = c(  12.146,            12.146,      12.146,      12.253, "$\\vdots$", "$\\vdots$"),
  tree      = c(  "1.1.1",          "1.1.1",     "1.1.2", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  species   = c(    "ANO",            "ANO",       "GUI", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  x         = c(      3.2,              3.2,         7.2, "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  y         = c(      4.5,              4.5,         2.1, "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  stem      = c("1.1.1.1",        "1.1.1.2", "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"), 
  D         = c(       20,               12, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  H         = c(       18,               15, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  V         = c(      2.3,              1.9, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$")
)

## datasp
kab_datasp <- tibble(
  guild = c(rep("non-pioneer light demanding", 5), rep("pioneer", 4), rep("shade bearer", 7)),
  species = c(
    "Heritiera utilis", "Tieghemella heckelii", "Piptadeniastrum africanum", "Aubrevillea kerstingii", 
    "Afzelia bella", "Cecropia peltata", "Ceiba pentandra", "Nauclea diderrichii", "Daniellia thurifera",
    "Guarea cedrata", "Strombosia glaucescens", "Garcinia epunctata", "Drypetes chevalieri", "Cola nitida",
    "Nesogordonia papaverifera", "Dialium aubrevilliei"
  ),
  vernacular = c(
    "Nyankom", "Makore", "Dahoma", "Dahomanua", "Papao-nua", "Odwuma", "Onyina", "Kusia",
    "Sopi", "Kwabohoro", "Afena", "Nsokonua", "Katreka", "Bese", "Danta", "Dua bankye"
  )
)


###
### Tables chapter 5 -----------------------------------------------------------

## prim
kab_prim <- bind_rows(
  poly = tibble(
    Name = c("linear", "parabolic or quadratic", "$p$-order polynomial"),
    Equation = c("$Y=a+bX$", "$Y=a+bX+cX^2$", "$Y=a_0+a_1X+a_2X^2+\\ldots+a_pX^p$"),
    Transformation = c("same", "", "")
  ),
  expo = tibble(
    Name = c(
      "exponential or Malthus", "modified exponential", "logarithm", 
      "reciprocal log", "Vapor pressure"
    ),
    Equation = c(
      "$Y=a\\exp(bX)$", "$Y=a\\exp(b/X)$", "$Y=a+b\\ln X$", 
      "$Y=1/(a+b\\ln X)$", "$Y=\\exp(a+b/X+c\\ln X)$"
    ),
    Transformation = c(
      "$Y'=\\ln Y$, $X'=X$", "$Y'=\\ln Y$, $X'=1/X$", "$Y'=Y$, $X'=\\ln X$",
      "$Y'=1/Y$, $X'=\\ln X$", ""
    )
  ),
  pow = tibble(
    Name = c(
      "power", "modified power", "shifted power", "geometric", 
      "modified geometric", "root", "Hoerl's model", "modified Hoerl's model"
    ),
    Equation = c(
      "$Y'=\\ln Y$", "$Y=ab^X$", "$Y=a(X-b)^c$", "$Y=aX^{bX}$", 
      "$Y=aX^{b/X}$", "$Y=ab^{1/X}$", "$Y=ab^XX^c$", "$Y=ab^{1/X}X^c$"
    ),
    Transformation = c(
      "$Y'=\\ln Y$, $X'=\\ln X$", "$Y'=\\ln Y$, $X'=X$", "", "$Y'=\\ln Y$, $X'=X\\ln X$", 
      "$Y'=\\ln Y$, $X'=(\\ln X)/X$", "$Y'=\\ln Y$, $X'=1/X$", "", ""
    )
  ),
  dens = tibble(
    Name = c(
      "inverse", "quadratic inverse", "Bleasdale's model", "Harri's model"
    ),
    Equation = c(
      "$Y=1/(a+bX)$", "$Y=1/(a+bX+cX^2)$", "$Y=(a+bX)^{-1/c}$", "$Y=1/(a+bX^c)$"
    ),
    Transformation = c(
      "$Y'=1/Y$, $X'=X$", "", "", ""
    )
  ),
  grow = tibble(
    Name = c(
      "saturated growth", "mononuclear or Mitscherlich's model"
    ),
    Equation = c(
      "$Y=aX/(b+X)$", "$Y=a[b-\\exp(-cX)]$"
    ),
    Transformation = c(
      "$Y'=X/Y$, $X'=X$", ""
    )
  ),
  sig = tibble(
    Name = c(
      "Gompertz", "Sloboda", "logistic or Verhulst", "Nelder",
      "von Bertalanffy", "Chapman-Richards", "Hossfeld", "Levakovic",
      "multiple multiplicative factor", "Johnson-Schumacher", "Lundqvist-Matérn or de Korf", "Weibull"
    ),
    Equation = c(
      "$Y=a\\exp[-b\\exp(-cX)]$", "$Y=a\\exp[-b\\exp(-cX^d)]$", "$Y=a/[1+b\\exp(-cX)]$", "$Y=a/[1+b\\exp(-cX)]^{1/d}$",
      "$Y=a[1-b\\exp(-cX)]^3$", "$Y=a[1-b\\exp(-cX)]^d$", "$Y=a/[1+b(1+cX)^{-1/d}]$", "$Y=a/[1+b(1+cX)^{-1/d}]^{1/e}$",
      "$Y=(ab+cX^d)/(b+X^d)$", "$Y=a\\exp[-1/(b+cX)]$", "$Y=a\\exp[-(b+cX)^d]$", "$Y=a-b\\exp(-cX^d)$"
    ),
    Transformation = c(
      "", "", "", "", "", "", "", "", "", "", "", ""
    )
  ),
  misc = tibble(
    Name = c(
      "hyperbolic", "sinusoidal", "heat capacity", "Gaussian", "rational fraction"
    ),
    Equation = c(
      "$Y=a+b/X$", "$Y=a+b\\cos(cX+d)$", "$Y=a+bX+c/X^2$", "$Y=a\\exp[-(X-b)^2/(2c^2)]$", "$Y=(a+bX)/(1+cX+dX^2)$" 
    ),
    Transformation = c(
      "$Y'=Y$, $X'=1/X$", "", "", "", ""
    )
  )
)
kab_prim

###
### Tables Chapter 6 -----------------------------------------------------------

kab_fAICD <- tibble(
  rl = c(
    "(ref:col-fDpara))", "(ref:col-fDD2var)", "(ref:col-fnlsD)", "(ref:col-fnlmD)",
    "(ref:col-frlpD2H)", "(ref:col-fD2Hvar)", "(ref:col-fnlsD2H)", "(ref:col-fnlmD2H)",
    "(ref:col-fnlsDH)", "(ref:col-fnlmDH)"
  ),
  entry = c(
    rep("$D$", 4), rep("$D^2H$", 4), rep("$D$, $H$", 2)
  ),
  meth = rep(c("WLS", "ML"), 5),
  r = c(
    rep(c("(ref:lm)", "(ref:nlme)", "(ref:nls)","(ref:nlme)"), 2), "(ref:nls)", "(ref:nlme)"
  ),
  AIC = c(
    76.71133, 83.09157, 24809.75727, 75.00927, 65.15002, 
    69.09644, 24797.53706, 69.24482, 24802.91248, 76.80204
  )
)
kab_fAICD 

kab_fAICD_html <- tibble(
  rl = c(
    "\\@ref(exr:fDpara)", "\\@ref(exr:fDD2var)", "\\@ref(exr:fnlsD)", "\\@ref(exr:fnlmD)",
    "\\@ref(exr:frlpD2H)", "\\@ref(exr:fD2Hvar)", "\\@ref(exr:fnlsD2H)", "\\@ref(exr:fnlmD2H)",
    "\\@ref(exr:fnlsDH)", "\\@ref(exr:fnlmDH)"
  ),
  entry = c(
    rep("$D$", 4), rep("$D^2H$", 4), rep("$D$, $H$", 2)
  ),
  meth = rep(c("WLS", "ML"), 5),
  r = c(
    rep(c("`lm`", "`nlme`", "`nls`", "`nlme`"), 2), "`nls`", "`nlme`"
  ),
  AIC = c(
    76.71133, 83.09157, 24809.75727, 75.00927, 65.15002, 
    69.09644, 24797.53706, 69.24482, 24802.91248, 76.80204
  )
)
kab_fAICD_html


kab_fAIClnD <- tibble(
  rl = c(
    "(ref:col-rllnBvD)", "(ref:col-rllnBvD2H)", "(ref:col-flnDlnH)", "(ref:col-selvar)"
  ),
  entry = c(
    "$D$", "$D^2H$", rep("$D$, $H$", 2)
  ),
  meth = rep("OLS", 4),
  r = c(
    rep("(ref:lm)", 4)
  ),
  AIC = c(
    56.97923, 46.87780, 48.21367, 45.96998
  )
)
kab_fAIClnD

kab_fAIClnD_html <- tibble(
  rl = c(
    "\\@ref(exr:rllnBvD)", "\\@ref(exr:rllnBvD2H)", "\\@ref(exr:flnDlnH)", "\\@ref(exr:selvar)"
  ),
  entry = c(
    "$D$", "$D^2H$", rep("$D$, $H$", 2)
  ),
  meth = rep("OLS", 4),
  r = c(
    rep("`lm`", 4)
  ),
  AIC = c(
    56.97923, 46.87780, 48.21367, 45.96998
  )
)
kab_fAIClnD_html
