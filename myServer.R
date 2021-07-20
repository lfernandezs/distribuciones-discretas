graficarDistribucionDiscreta <- function(input, output, color) {
  x <- 0:max
  y <- reactive({calcularProbabilidades(input, x)})
  
  output$plot <- renderPlot({
    p <- ggplot(data = data.frame(x, y()), aes(x=x, y=y())) +
      geom_segment(aes(x=x, xend=x, y=0, yend=y()), size=1, color="grey") +
      geom_point(color = color(), size=5) +
      theme_light() +
      xlab("") +
      ylim(0,1) +
      xlim(0, if (input$dist == "Binomial") {input$nbinom}
           else if (input$dist == "Hipergeométrica") {input$nhyper}
           else {max})
    suppressWarnings(print(p))
  })
}

calcularProbabilidades <- function(input, x) {
  if (input$dist == "Binomial") {
         return(dbinom(x, input$nbinom, input$pbinom))
       } else if (input$dist == "Geométrica") {
         return(dgeom(x, input$pgeom))
       } else if (input$dist == "Binomial Negativa") {
         return(dnbinom(x-input$rnbinom, size=input$rnbinom, prob=input$pnbinom))
       } else if (input$dist == "Hipergeométrica") {
         validate(need(input$nhyper <= input$thyper, "Los elementos favorables deben ser menores o iguales al total de la población."))
         return(dhyper(x, m=input$dhyper, n=input$thyper - input$dhyper, input$nhyper))
       } else {
         return(dpois(x, lambda = input$ppois))
       }
}

graficarDistribucionContinua <- function(input, output, color) {
  x <- 0:max
  fun <- reactive({
    if (input$dist == "Normal") dnorm
    else if (input$dist == "Uniforme") dunif
    else if (input$dist == "Gamma") dgamma
    else dexp
  })

  args <- reactive({
    if (input$dist == "Normal") list(mean = input$muNormal, sd = sqrt(input$varNormal))
    else if (input$dist == "Uniforme") list(min = input$aUnif, max = input$bUnif)
    else if (input$dist == "Gamma") list(shape = input$alphaGamma, scale = input$lambdaGamma)
    else list(rate = input$lambdaExp)
  })

  output$plot <- renderPlot({
    p <- ggplot() +
      geom_function(fun = fun(), args = args(), color=color(), size=1) +
      xlim(-5, max) +
      ylim(0, if (input$dist == "Exponencial") {2} else {1}) +
      theme_light()
    suppressWarnings(print(p))
  })
}

server <- function(input, output, session) {
  color <- reactive({tolower(gsub(" ", "", input$theme))})
  
  observeEvent(
    input$tipo,
    {
      if (input$tipo == "Discretas") {
        updateSelectInput(
          session = session,
          inputId = "dist",
          choices = discretas
        )
      } else {
        updateSelectInput(
          session = session,
          inputId = "dist",
          choices = continuas
        )
      }
  })
  
  observeEvent(
    input$tipo,
    {if (input$tipo == "Discretas") {graficarDistribucionDiscreta(input, output, color)}
    else {graficarDistribucionContinua(input, output, color)}})

}