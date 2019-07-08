## Import data ##
abs_data <- read.delim("/Users/marta/Desktop/Universitat/Undergraduate_Internship/Platereader/abstabl.txt", header = TRUE)
abs_data

gfp_data <- read.delim("/Users/marta/Desktop/Universitat/Undergraduate_Internship/Platereader/gfpdata.txt", header = TRUE)
gfp_data


## Function that creates the difference between the rfp and the blanck. The blank should be put as first column ##
create_tables_gfp <- function(gfp_data){
  # initialize tables
  gfp_blanck_table <- matrix(NA, ncol = ncol(gfp_data), nrow = nrow(gfp_data))
  gfp_blanck_table <- data.frame(gfp_blanck_table)
  # iterate over table to assign values
  for (i in 1:ncol(gfp_data)) {
    for (j in 1:nrow(gfp_data)){
      z <- gfp_data[j,i]-gfp_data[j,1]
      gfp_blanck_table[j,i] <- z
      j = j + 1
    }
    i = i + 1
  }
  # print and create a txt file where the table can be found. The table will be created in the directory you are working at.
  print(gfp_blanck_table)
  write.table(gfp_blanck_table, 'gfp-blank.txt' )
}

## Function that creates table to see the difference of rfp betweeen the different samples and the blank. ##
create_tables_rfp <- function(rfp_data){
  # initialize tables
  rfp_blanck_table <- matrix(NA, ncol = ncol(rfp_data), nrow = nrow(rfp_data))
  rfp_blanck_table <- data.frame(rfp_blanck_table)
  # iterate over table to assign values
  for (i in 1:ncol(rfp_data)) {
    for (j in 1:nrow(rfp_data)){
      z <- rfp_data[j,i]-rfp_data[j,1]
      rfp_blanck_table[j,i] <- z
      j = j + 1
    }
    i = i + 1
  }
  # print and create a txt file where the table can be found. The table will be created in the directory you are working at.
  print(rfp_blanck_table)
  write.table(rfp_blanck_table, 'rfp-blank.txt' )
}

create_tables_abs <- function(abs_data){
  abs_blanck_table <- matrix(NA, ncol = ncol(gfp_data), nrow = nrow(gfp_data))
  abs_blanck_table <- data.frame(abs_blanck_table)
  # iterate over table to assign values
  for (i in 1:ncol(abs_data)) {
    for (j in 1:nrow(abs_data)){
      z <- abs_data[j,i]-abs_data[j,1]
      abs_blanck_table[j,i] <- z
      j = j + 1
    }
    i = i + 1
  }
  # print and create a txt file where the table can be found. The table will be created in the directory you are working at.
  print(abs_blanck_table)
  write.table(abs_blanck_table, 'abs-blank.txt' )
}

## Apply function ##
create_tables_gfp(gfp_data = gfp_data)
create_tables_abs(abs_data = abs_data)
create_tables_rfp(rfp_data = )

## Load new tables ##
gfp_blanck_data <- read.table("/Users/marta/Desktop/Universitat/Undergraduate_Internship/Platereader/gfp-blank.txt", header = TRUE)
abs_blanck_data <- read.table("/Users/marta/Desktop/Universitat/Undergraduate_Internship/Platereader/abs-blank.txt", header = TRUE)



## GFP/Abs or RFP/Abs ##

gfp_abs <- function(gfp_blanck_data, abs_blanck_data){
  gfp_abs_table <- matrix(NA, ncol = ncol(gfp_data), nrow = nrow(gfp_data))
  gfp_abs_table <- data.frame(abs_blanck_table)
  for (n in 1:nrow(gfp_blanck_data)){
    for (m in 2:ncol(abs_blanck_data)){
      div <- gfp_blanck_data[n,m]/abs_blanck_data[n,m]
      gfp_abs_table[n,m] <- div
      m = m + 1
    }
    n = n + 1
  }
  print(gfp_abs_table)
  write.table(gfp_abs_table, 'gfp-abs.txt' )
}

## Apply function ##

gfp_abs(gfp_blanck_data = gfp_blanck_data, abs_blanck_data = abs_blanck_data)

## Load table ##

gfp_abs_data <- read.table("/Users/marta/Desktop/Universitat/Undergraduate_Internship/Platereader/gfp-abs.txt", header = TRUE)


## Get values from last row and plot ##

plot_values <- function(gfp_abs_data){
  values_to_plot <- c()
  for (col in 2:ncol(gfp_abs_data)){
    values_to_plot[col] <- gfp_abs_data[nrow(gfp_abs_data), col]
    col = col + 1
  }
  barplot(values_to_plot)
}

plot_values(gfp_abs_ldata = gfp_abs_data)


