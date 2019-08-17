#####################################################################################
##### 1 detector
x      = c(     1,      4,     8,     12,     16,    20,    24,    28,      32,      36,      40)
y      = c(18.08,   18.08, 18.08,  18.08,  18.08, 18.08, 18.08, 18.08,   18.08,   18.08,   18.08)
y1     = c(20.62,    5.45,  3.07,   2.52,   2.13,   2.1,  1.83,   1.8,    1.72,    1.75,    1.73)
optimal= c(20.62,    5.16,  2.58,   1.72,   1.29,  1.03,  0.86,  0.74,    0.64,    0.57,    0.52)
ticks<-c(1, 20)

png(filename='~/1detectors_new.png', width = 800, height = 400)
plot(x, y, type='b',pch=0,  axes= FALSE, col='black', xlab  = "#Cores", ylab="RealTime(min)", xlim=c(1, 40), ylim=c(0,30))
lines(x, y1, col='red', type='b', pch = 1)
lines(x, optimal, col='green', type = 'b', pch = 2)
axis(side=1, at=x)
axis(side=2, at=ticks, labels=ticks, tck=1)
title('1 Detector Configuration')
legend("topright", 0, legend=c('master', 'branch', 'ideal'), col=c("black", "red", "green"), lty=1)
box()
dev.off()



###################################################################################
#### 4 detectors
x      = c(     1,      4,       8,      12,     16,       20,      24,      28,     32,     36,       40)
y      = c(75.15,   50.78,   50.78,   50.78,  50.78,    50.78,   50.78,   50.78,  50.78,  50.78,    50.78)
y1     = c(73.83,    19.7,   10.97,    8.17,   6.72,     6.58,    5.58,     5.2,   4.92,   5.05,     4.77)
optimal= c(73.83,   18.46,    9.23,    6.15,   4.61,     3.69,    3.08,    2.64,   2.31,   2.05,     1.85)
ticks<-c(3, 50, 75)

png(filename='~/4detectors_new.png', width = 800, height = 400)
plot(x, y, type='b',pch=0,  axes= FALSE, col='black', xlab  = "#Cores", ylab="RealTime(min)", xlim=c(1, 40), ylim=c(1,100))
lines(x, y1, col='red', type='b', pch = 1)
lines(x, optimal, col='green', type = 'b', pch = 2)
axis(side=1, at=x)
axis(side=2, at=ticks, labels=ticks, tck=1)
title('4 Detectors Configuration')
legend("topright", 0, legend=c('master', 'branch', 'ideal'), col=c("black", "red", "green"), lty=1)
box()
dev.off()

################################################################################33
##### 12 detectors
x      = c(      1,      4,       8,      12,     16,      20,    24,    28,    32,    36,   40)
y      = c(261.167, 130.93,  104.92,    98.4,     98,      98,    98,    98,    98,    98,   98)
y1     = c(224.5,    64.92,   34.92,    26.5,  22.52,   23.93, 20.25, 18.13, 17.22,    17,   17)
optimal= c(224.5,   56.125, 28.0625,  18.708,  14.03,  11.225,  9.35, 8.017,  7.02,  6.24,  5.6)
ticks<-c(10, 100, 220, 260)

png(filename='~/12detectors_new.png', width = 800, height = 400)
plot(x, y, type='b',pch=0,  axes= FALSE, col='black', xlab  = "#Cores", ylab="RealTime(min)", xlim=c(1, 40), ylim=c(1,300))
lines(x, y1, col='red', type='b', pch = 1)
lines(x, optimal, col='green', type = 'b', pch = 2)
axis(side=1, at=x)
axis(side=2, at=ticks, labels=ticks, tck=1)
title('12 Detectors Configuration')
legend("topright", 0, legend=c('master', 'branch', 'ideal'), col=c("black", "red", "green"), lty=1)
box()
dev.off()
