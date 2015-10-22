fitAll <- lm(mpg ~., data = mtcars)
vif(fitAll)
#cyl      disp        hp      drat        wt      qsec        vs        am      gear      carb 
#15.373833 21.620241  9.832037  3.374620 15.164887  7.527958  4.965873  4.648487  5.357452  7.908747 

fitNoAm <- lm(mpg ~ . -am, data = mtcars)
vif(fitNoAm)

#cyl      disp        hp      drat        wt      qsec        vs      gear      carb 
#14.328068 21.604525  9.809873  3.292070 15.029923  6.963059  4.747437  4.830069  7.878308 

#no strong indication am related to others

fitNoDisp <- lm(mpg ~ . -disp, data = mtcars)
vif(fitNoDisp)

#cyl        hp      drat        wt      qsec        vs        am      gear      carb 
#14.284737  7.123361  3.329298  6.189050  6.914423  4.916053  4.645108  5.324402  4.310597 

# vif of wt drops significantly, t4 disp & wt are highly correlated; meanwhile am remains, 
# maybe not correlation wt & am

fitNoCyl <- lm(mpg ~ . -cyl, data = mtcars)
vif(fitNoCyl)

#disp        hp      drat        wt      qsec        vs        am      gear      carb 
#20.088643  9.499795  3.118062 14.971795  6.960353  4.454935  4.332286  4.691536  7.497054

#vif of wt stables, vif of am stable => no correlation cyl & am

fitNoWt <- lm(mpg ~ . -wt, data = mtcars)
vif(fitNoWt)

#cyl      disp        hp      drat      qsec        vs        am      gear      carb 
#15.178081  8.823590  9.263736  3.278905  5.592552  4.930175  4.607117  5.181264  4.087999 

# vif of am, cyl stable; disp decreases

#pairs(mtcars)
#g = ggpairs(mtcars, lower = list(continuous = "smooth"),params = c(method = "loess"))
#g
# carTest = mtcars
# carTest$cyl <- as.factor(carTest$cyl)
# carTest$am <- as.factor(carTest$am)
# custom_car <- ggpairs(carTest, lower = list(discrete = "ratio"),  title = "Mtcars")
# custom_car


# fit1 <- lm(mpg ~ wt, data = mtcars)
# summary(fit1)$coef
# g1 = ggplot(mtcars, aes(x = wt, y = mpg))
# g1 = g1 + geom_point(size = 4, colour = "blue", alpha = 0.4)
# g1 = g1 + geom_abline(intercept = coef(fit1)[1], slope = coef(fit1)[2], size = 2)
# g1 = g1 + xlab("Weight in tons") + ylab("MPG")
# g1

##------
# fit2 <- lm(mpg ~ wt + am, data = mtcars)
# g2 = ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(am)))
# g2 = g2 + geom_point(size = 6, colour = "black") + geom_point(size = 4)
# g2 = g2 + geom_abline(intercept = coef(fit2)[1], slope = coef(fit2)[2], size = 2)
# g2 = g2 + xlab("Weight in tons") + ylab("MPG")
# g2
# 
# fit3 <- lm(mpg ~ wt * factor(am), data = mtcars)
# g3 = ggplot(mtcars, aes(x = wt, y = mpg, colour = as.factor(am)))
# g3 = g3 + geom_point(size = 6, colour = "black") + geom_point(size = 4)
# #g3 = g3 + geom_abline(intercept = coef(fit2)[1], slope = coef(fit2)[2], size = 2, color = "blue")
# g3 = g3 + geom_abline(intercept = coef(fit3)[1] + coef(fit3)[3], 
#                           slope = coef(fit3)[2] + coef(fit3)[4], size = 2, color = "orange")
# g3 = g3 + xlab("Weight in tons") + ylab("MPG")
# g3
# 
# 
# fit4 <- lm(mpg ~ wt * disp, data = mtcars)
# g4 = ggplot(mtcars, aes(x = wt, y = mpg, colour = disp))
# g4 = g4 + geom_point(size = 6, colour = "black") + geom_point(size = 4)
# g4 = g4 + geom_abline(intercept = coef(fit4)[1] + coef(fit4)[3], slope = coef(fit4)[2] + coef(fit4)[4], size = 2, color = "orange")
# g4
# ## -----
# 
# fit5 <- lm(mpg ~ factor(am), data = mtcars)
# 
# g5 = ggplot(mtcars, aes(x = factor(am), y = mpg, colour = wt))
# g5 = g5 + geom_point(size = 6, colour = "black") + geom_point(size = 4)
# g5 = g5 + geom_abline(intercept = coef(fit5)[1], slope = coef(fit5[2], size = 2, color = "yellow"))
# g5
# 
# fit6 <- lm(mpg ~ am, data = mtcars)
# #round(dfbetas(fit6)[, 2], 3)
# #round(hatvalues(fit6), 3)
# # doesn't mean much here
# g6 = ggplot(mtcars, aes(x = am, y = mpg))
# g6 = g6 + geom_point(size = 6, colour = "black") + geom_point(size = 4)
# g6 = g6 + geom_abline(intercept = coef(fit6)[1], slope = coef(fit6[2], size = 2, color = "yellow"))
# g6
# # ggplot example taken from example(geom_text)
#   plot <- ggplot2::ggplot(mtcars, ggplot2::aes(x=wt, y=mpg, label=rownames(mtcars)))
#   plot <- plot +
#     ggplot2::geom_text(ggplot2::aes(colour=factor(cyl)), size = 3) +
#     ggplot2::scale_colour_discrete(l=40)
# custom_car <- putPlot(custom_car, plot, 1, 2)
# personal_plot <- ggally_text(
#   "ggpairs allows you\nto put in your\nown plot.\nLike that one.\n <---"
# )
# custom_car <- putPlot(custom_car, personal_plot, 1, 3)

# carTest = mtcars
# carTest$cyl <- as.factor(carTest$cyl)
# carTest$am <- as.factor(carTest$am)
# custom_car <- ggpairs(carTest, lower = list(discrete = "ratio"),  title = "Figure 1-2: Mtcars")
# custom_car
## this callback calculates mean values
# fun_mean <- function(x){
#         return(data.frame(y=round(mean(x), 3),label= round(mean(x,na.rm=T), 3)))
# }
# 
# p = ggplot(mtcars, aes(x = factor(am), y = mpg))
# p = p + geom_boxplot(aes(fill = factor(am)))
# p = p + labs(x = "", y = "MPG", title="Figure 1-1: Transmision Type Vs. MPG")
# p = p + stat_summary(fun.y = mean, geom="point",colour="darkred", size=3)
# p = p + stat_summary(fun.data = fun_mean, geom="text", vjust=-0.7)
# p = p + scale_fill_discrete(name="Transmission",
#                          breaks=c(0, 1),
#                          labels=c("Automatic", "Manual"))
# p