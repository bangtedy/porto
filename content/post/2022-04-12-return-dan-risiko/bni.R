library(xts) # memanggil xts library
source("~/load.data.R", encoding = 'UTF-8') # dari Clifford Ang

# Mengimpor data saham BNI dari finance.yahoo.com

data.bni <- load.data("BBNI.JK.csv", "BNI")
head(data.bni) # data dimulai dari 15 April 2021
tail (data.bni) # data terakhir 14 April 2022
names(data.bni) # melihat nama-nama variabel 
plot(data.bni$BNI.Close) # plotting harga saham penutupan BNI
summary(data.bni$BNI.Close)

# Kita lakukan hal yang sama untuk saham PT Waskita Karya

data.wskt <- load.data("WSKT.JK.csv", "WSKT")
head(data.wskt) # data dimulai dari 15 April 2021
tail (data.wskt) # data terakhir 14 April 2022
names(data.wskt) # melihat nama-nama variabel 
plot(data.wskt$WSKT.Close) # plotting harga saham penutupan WSKT
summary(data.wskt$WSKT.Close)

# Kita lakukan hal yang sama untuk saham PT ANEKA Tambang, Tbk

data.antm <- load.data("ANTM.JK.csv", "ANTM")
head(data.antm) # data dimulai dari 15 April 2021
tail (data.antm) # data terakhir 14 April 2022
names(data.antm) # melihat nama-nama variabel 
plot(data.antm$ANTM.Close) # plotting harga saham penutupan WSKT
summary(data.antm$ANTM.Close)

# Kita kombinasikan semua data harga penutupan menjadi satu

close.prc <- cbind(data.bni$BNI.Close, data.wskt$WSKT.Close, data.antm$ANTM.Close)
names(close.prc)  <-  c("BNI", "WSKT", "ANTM")
head(close.prc) # cek data apakah sudah betul

# Selanjutnya kita normalkan data agar perbandingan kinerja saham lebih adil

(first.bni <- as.numeric(data.bni[1, 6]))
(first.wskt <- as.numeric(data.wskt[1, 6]))
(first.antm <- as.numeric(data.antm[1, 6]))

norm.prc <- close.prc
norm.prc$BNI <- norm.prc$BNI/first.bni
norm.prc$WSKT <- norm.prc$WSKT/first.wskt
norm.prc$ANTM <- norm.prc$ANTM/first.antm

head(norm.prc)

# Plot the Capital Appreciation of Each Security

(y.range <- range(norm.prc))
dt <- index(norm.prc)

plot(x = dt,
     y = norm.prc$BNI,
     xlab = "Date",
     ylab = "Value of Investment",
     ylim = y.range,
     type = "l",
     lwd = 2,
     main = "Value of Rp 1 Investment in BNI, WSKT and ANTM")

lines(x = dt, y = norm.prc$WSKT, col = "blue")
lines(x = dt, y = norm.prc$ANTM, col = "red")

legend ("topleft", c("BNI", "WSKT","ANTM"),
       lwd = c(2, 1, 1),
       col = c("black", "blue", "red"))


       