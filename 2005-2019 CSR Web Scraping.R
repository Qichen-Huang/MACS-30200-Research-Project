# load packages 
library(V8)
library(tidyverse)
library(jsonlite)

# Set up the working directory (2005)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2005")

# Web-scrape the 2005 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2005-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2005",j,".json", sep = ""))
  cat("\n", file = paste("temp2005",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2005",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2005.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2006)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2006")

# Web-scrape the 2006 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2006-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2006",j,".json", sep = ""))
  cat("\n", file = paste("temp2006",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2006",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2006.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2007)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2007")

# Web-scrape the 2007 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2007-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2007",j,".json", sep = ""))
  cat("\n", file = paste("temp2007",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2007",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2007.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2008)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2008")

# Web-scrape the 2008 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2008-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2008",j,".json", sep = ""))
  cat("\n", file = paste("temp2008",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2008",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2008.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2009)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2009")

# Web-scrape the 2009 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2009-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2009",j,".json", sep = ""))
  cat("\n", file = paste("temp2009",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2009",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2009.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2010)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2010")

# Web-scrape the 2010 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2010-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# 2.2 Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2010",j,".json", sep = ""))
  cat("\n", file = paste("temp2010",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2010",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
             `Name(Code)` = industry,
             Score = industryrate,
             Level = Pricelimit,
             Stakeholder_Responsbility = stockNumber,
             Staff_Responsbility = lootingchips,
             `Supplier_Customer_Client_Responsbility` = Scramble,
             Environmental_Responsibility = rscramble,
             Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
      Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2010.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2011)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2011")

# Web-scrape the 2011 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2011-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2011",j,".json", sep = ""))
  cat("\n", file = paste("temp2011",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2011",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2011.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2012)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2012")

# Web-scrape the 2012 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2012-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2012",j,".json", sep = ""))
  cat("\n", file = paste("temp2012",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2012",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2012.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2013)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2013")

# Web-scrape the 201 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2013-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2013",j,".json", sep = ""))
  cat("\n", file = paste("temp2013",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2013",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2013.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2014)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2014")

# Web-scrape the 2014 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2014-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2014",j,".json", sep = ""))
  cat("\n", file = paste("temp2014",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2014",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2014.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2015)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2015")

# Web-scrape the 2015 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2015-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2015",j,".json", sep = ""))
  cat("\n", file = paste("temp2015",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2015",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2015.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2016)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2016")

# Web-scrape the 2016 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2016-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2016",j,".json", sep = ""))
  cat("\n", file = paste("temp2016",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2016",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2016.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2017)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2017")

# Web-scrape the 2017 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2017-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2017",j,".json", sep = ""))
  cat("\n", file = paste("temp2017",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2017",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2017.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2018)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2018")

# Web-scrape the 2018 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2018-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2018",j,".json", sep = ""))
  cat("\n", file = paste("temp2018",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2018",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2018.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}

# Set up the working directory (2019)
setwd("D:/stata16.1/ado/mypaper/SRB/R_SRB2019")

# Web-scrape the 2019 CSR information from the publicly available website Hexun 
url <- c()
for(i in 1:120){
  url[i] <- paste("http://stockdata.stock.hexun.com/zrbg/data/zrbList.aspx?date=2019-12-31&count=20&pname=20&titType=null&page=",i, sep = "")
}
# Web-scrape the json data
for(j in 1:120){
  download.file(url[j], paste("temp2019",j,".json", sep = ""))
  cat("\n", file = paste("temp2019",j,".json", sep = ""), append = T)
  web <- readLines(paste("temp2019",j,".json", sep = "")) %>%
    stringr::str_replace("hxbase_json1\\(", "var data=") %>%
    stringr::str_replace("\\}\\]\\}\\)", "}]};")
  ct <- v8()
  ct$eval(web)
  ct$get("data") -> js
  js$list %>% 
    as_tibble() %>% 
    select(Rank = Number,
           `Name(Code)` = industry,
           Score = industryrate,
           Level = Pricelimit,
           Stakeholder_Responsbility = stockNumber,
           Staff_Responsbility = lootingchips,
           `Supplier_Customer_Client_Responsbility` = Scramble,
           Environmental_Responsibility = rscramble,
           Social_Responsibility = Strongstock,) %>%
    type_convert() %>%
    mutate(Name = str_match(`Name(Code)`, "(.*)\\(")[,2],
           Code = str_match(`Name(Code)`, "\\((.*)\\)")[,2]) %>%
    select(Rank, Name, Code, everything()) -> df
  write.table(df,"data2019.txt", row.names = F, col.names = F, quote = FALSE, append = T)
}
