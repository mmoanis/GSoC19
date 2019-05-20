x = c(  1,   4, 8,   12, 16)

# 1 detector
y = c(22, 6, 3, 2, 2)
y1 = c(20, 20, 20, 20, 20)

# 4 detectors
#y = c(108,  28,  14,  11, 9)
#y1 = c(88, 39, 39, 39, 39)

# 12 detectors
#y = c(253, 78, 39, 30, 25)
#y1 = c(253, 96, 73, 65, 65)


plot(x, y, type='b', axes= FALSE, col='black', xlab  = "#Cores", ylab="RealTime(min)")
lines(x, y1, col='red')
axis(side=1, at=x)
axis(side=2, at=y)
legend("topright", 95, legend=c('mt-overhaul', 'master'), col=c("black", "red"), lty=1, title = "1 Detectors")
box()
