for (dir in c("Data_squat", "Data_non_squat")) {
  directory <- paste0("C:/Users/nanie/Documents/UTC/GI04/PRFlit/",dir)
  setwd(directory)
  
  # virer les JPG avant de le faire
  
  donnees = dir(directory)
  for (element in donnees){
    name1 = substr(toString(element), 1, nchar(element)-4)
    name = paste0("../jpg_", dir,"/", name1,".jpg")
    print(name)
    data <- read.csv(element, 
                     header=T)
    jpeg(name)
    plot(data[,1],data[,2], xlim = c(min(data[,1]),max(data[,1])), ylim = c(min(data[2:4]),max(data[2:4])), type="l", col="blue")
    lines(data[,1],data[,3], col="red")
    lines(data[,1],data[,4], col="green")
    dev.off()
    
    # ajout de bruit pour certaines données 
    random <- round(runif(1, min=0, max=10), digits=0)
    if (random == 2 || random == 3 || random == 4) {
      fact <- round(runif(1, min=50, max=150), digits=0)
      data[,random] <- jitter(data[,random],fact)
      name <- paste0("../jpg_", dir,"/", name1,"_noise.jpg")
      jpeg(name)
      plot(data[,1],data[,2], xlim = c(min(data[,1]),max(data[,1])), ylim = c(min(data[2:4]),max(data[2:4])), type="l", col="blue")
      lines(data[,1],data[,3], col="red")
      lines(data[,1],data[,4], col="green")
      dev.off()
    }
  }
}