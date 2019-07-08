#import data
abs_data <- read.delim("/Users/eva_gf/Desktop/data1/abstabl.txt", header = TRUE)
abs_data

gfp_data <- read.delim("/Users/eva_gf/Desktop/data1/gfpdata.txt", header = TRUE)
gfp_data



# reading table

#Creating new frames

abs_blanck_table <- data.frame()
gfp_abs_table <- data.frame()

#Iterate over table
gfp_blanck_table <- matrix(NA, ncol = ncol(gfp_data), nrow = nrow(gfp_data))
gfp_blanck_table <- data.frame(gfp_blanck_table)
abs_blanck_table <- matrix(NA, ncol = ncol(gfp_data), nrow = nrow(gfp_data))
abs_blanck_table <- data.frame(abs_blanck_table)
create_tables <- function(gfp_data, abs_data){
  for (i in 1:ncol(gfp_data)) {
    for (j in 1:nrow(gfp_data)){
      z <- gfp_data[j,i]-gfp_data[j,1]
      gfp_blanck_table[1,i] <- z
      j = j + 1
    }
    i = i + 1
  }
  for (i in 1:ncol(abs_data)) {
    for (j in 1:nrow(abs_data)){
      z <- abs_data[j,i]-abs_data[j,1]
      abs_blanck_table[j,i] <- z
      j = j + 1
    }
    i = i + 1
  }
}

create_tables(gfp_data = gfp_data, abs_data = abs_data)