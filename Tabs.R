discretas <- c("Binomial", "Geométrica", "Binomial Negativa", "Hipergeométrica", "Poisson")
continuas <- c("Uniforme", "Normal", "Gamma", "Exponencial")

max <- 30
value <- 20

radioButtonsColores <- radioButtons(inputId = "theme",
                                    label = NULL,
                                    choices = c("Orange", "Royal Blue", "Plum"),
                                    inline = TRUE)

radioButtonsTipo <- radioButtons(inputId = "tipo",
                                 label = NULL,
                                 choices = c("Discretas", "Continuas"),
                                 inline = TRUE)

inputDistribucion <- selectInput(inputId = "dist",
                                 label = "Distribución",
                                 choices = c("Binomial", "Geométrica", "Binomial Negativa", "Hipergeométrica", "Poisson"))

inputBinomial <- conditionalPanel(condition = "input.dist == 'Binomial'",
                                sliderInput(inputId = "nbinom",
                                            label = "Número de repeticiones del experimento",
                                            min = 1,
                                            max = 30,
                                            value = 20),
                                sliderInput(inputId = "pbinom",
                                            label = "Probabilidad de éxito en cada repetición",
                                            min = 0,
                                            max = 1,
                                            value = 0.5))

inputGeometrica <- conditionalPanel(condition = "input.dist == 'Geométrica'",
                                  sliderInput(inputId = "pgeom",
                                              label = "Probabilidad de éxito en cada repetición",
                                              min = 0,
                                              max = 1,
                                              value = 0.5))

inputBinomialNegativa <- conditionalPanel(condition = "input.dist == 'Binomial Negativa'",
                                        sliderInput(inputId = "rnbinom",
                                                    label = "r-ésimo éxito",
                                                    min = 1,
                                                    max = 30,
                                                    value = 20),
                                        sliderInput(inputId = "pnbinom",
                                                    label = "Probabilidad de éxito en cada repetición",
                                                    min = 0,
                                                    max = 1,
                                                    value = 0.5))

inputHipergeometrica <- conditionalPanel(condition = "input.dist == 'Hipergeométrica'",
                                       sliderInput(inputId = "thyper",
                                                   label = "Total de elementos que componen a la población",
                                                   min = 0,
                                                   max = 30,
                                                   value = 30),
                                       sliderInput(inputId = "nhyper",
                                                   label = "Tamaño de la muestra extraída",
                                                   min = 0,
                                                   max = 30,
                                                   value = 20),
                                       sliderInput(inputId = "dhyper",
                                                   label = "Total de elementos que se consideran exitosos que componen a la población",
                                                   min = 0,
                                                   max = 30,
                                                   value = 20))

inputPoisson <- conditionalPanel(condition = "input.dist == 'Poisson'",
                               sliderInput(inputId = "ppois",
                                           label = "Lambda (λ)",
                                           min = 0,
                                           max = 30,
                                           value = 20))

inputUniforme <- conditionalPanel(condition = "input.dist == 'Uniforme'",
                                  sliderInput(inputId = "aUnif",
                                              label = "A",
                                              min = -30,
                                              max = 30,
                                              value = 10),
                                  sliderInput(inputId = "bUnif",
                                              label = "B",
                                              min = -30,
                                              max = 30,
                                              value = 20))

inputNormal <- conditionalPanel(condition = "input.dist == 'Normal'",
                                sliderInput(inputId = "muNormal",
                                            label = "Esperanza",
                                            min = -30,
                                            max = 30,
                                            value = 15),
                                sliderInput(inputId = "varNormal",
                                            label = "Varianza",
                                            min = 0,
                                            max = 30,
                                            value = 2,
                                            step = 0.1))

inputGamma <- conditionalPanel(condition = "input.dist == 'Gamma'",
                               sliderInput(inputId = "alphaGamma",
                                           label = "α",
                                           min = 0,
                                           max = 10,
                                           value = 1,
                                           step = 0.1),
                               sliderInput(inputId = "lambdaGamma",
                                           label = "λ",
                                           min = 0,
                                           max = 10,
                                           value = 1,
                                           step = 0.1))

inputExponencial <- conditionalPanel(condition = "input.dist == 'Exponencial'",
                                     sliderInput(inputId = 'lambdaExp',
                                                 label = "λ",
                                                 min = 0,
                                                 max = 4,
                                                 value = 1,
                                                 step = 0.1))