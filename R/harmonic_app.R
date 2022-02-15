harmonic_app <- function(){
  t<-1:120
sin12<-sin(2*pi*t/12)
shinyApp( ui = fluidPage(    
  sliderInput("period", "Period:",
              min=2, max=36, value=12),
  sliderInput("phase", "Phase shift:",
              min=-3.14, max=3.14, value=0),
  sliderInput("amp", "Amplitude:",
              min=0.1, max=5, value=1),
  plotOutput("periodPlot")  
),

server = function(input, output) {
  output$periodPlot = renderPlot({
    plot(sin12, type='l', col='gray', ylim=c(-2, 2))
    points(input$amp*sin(2*pi*t/input$period + input$phase),type='l', col='red', xlab='time' )              
    title(paste0(input$amp,'*sin(2*pi*t/',input$period,'+', input$phase, ')'))
  },width = "auto", height = "auto")
}
)
}
