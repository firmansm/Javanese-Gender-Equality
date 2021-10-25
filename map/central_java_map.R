library(GADMTools)
library(sp)

urb = c("Kota Semarang", "Kota Pekalongan", "Surakarta", "Kota Tegal", "Salatiga", "Kota Magelang")
sub = c("Batang","Brebes","Demak",'Karanganyar','Kendal','Klaten',"Semarang",'Pekalongan','Tegal','Magelang','Sukoharjo')
rur = c('Banjarnegara','Banyumas','Blora','Boyolali','Cilacap','Grobogan','Jepara','Kebumen','Kudus','Pati','Pemalang','Purbalingga','Purworejo','Sragen','Temanggung','Wonogiri','Wonosobo','Rembang')
reg = c(rep("Rural",18),rep("Suburb",11),rep("Urban",6))
reg = data.frame(reg, stringsAsFactors = TRUE)
num = c(rep(0,18),rep(1,11),rep(2,6))
kab <- c(rur,sub,urb)
kab
typeof(kab)
jatengreg = cbind(num, reg, kab)
jatengreg
typeof(jatengreg)

jatengdf <- data.frame(num, reg, kab, stringsAsFactors = FALSE)
#jatengdf <- data.frame(jatengreg, stringsAsFactors = FALSE)
typeof(jatengdf$num)
typeof(jatengdf$reg)
typeof(jatengdf$kab)
jatengdf



map <- gadm_sp_loadCountries(c("IDN"), level=2, basefile = "./")
jateng = gadm.subset(map, regions=kab)

choropleth(jateng, jatengdf,
           adm.join = "kab",
           value = "num",
           breaks = "bclust",
           steps = 3,
           palette="Dark2",
           labels = c("Rural", "Suburb", "Urban"),
           legend = "Regions",
           title="Central Java")

jatengdf

