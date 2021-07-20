source('Tabs.R')

ui <- shinyUI({
  fluidPage(
    theme = shinytheme("spacelab"),
    titlePanel("Distribuciones Famosas"),
    sidebarLayout(
      sidebarPanel(
        radioButtonsColores,
        radioButtonsTipo,
        
        inputDistribucion,
        inputBinomial,
        inputGeometrica,
        inputBinomialNegativa,
        inputHipergeometrica,
        inputPoisson,
        
        inputUniforme,
        inputNormal,
        inputGamma,
        inputExponencial
        ),
      mainPanel(
        plotOutput(outputId = "plot")
      )
    )
  )
})