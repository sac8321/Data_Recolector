---
  title: "datos"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
install.packages("devtools")
devtools::install_github("PROMiDAT/socialscrapeR")



```




```{r cars}
library(wdman)
library(RSelenium)
library(socialscrapeR)
library(rlang)
library(sqldf)


bot_facebook = fb_bot$new()
bot_facebook$login(
  username = "sac8321@gmail.com",
  password = "")

bot_twitter=tw_bot$new()
bot_twitter$login(
  username = "sac8321@gmail.com",
  password = ""
)



MAGFacebook<- bot_facebook$get_posts(pagename = "MAGCOSTARICA", n = 30, reactions = F)
COMEXFacebook<-bot_facebook$get_posts(pagename = "comexcr", n = 30, reactions = F)
MEICFacebook<-bot_facebook$get_posts(pagename = "MEICCR", n = 30, reactions = F)
MTSSFacebook<-bot_facebook$get_posts(pagename = "TrabajoCR", n = 30, reactions = F)
OFINASEFacebook<-bot_facebook$get_posts(pagename = "OFINASE", n = 30, reactions = F)
PIMAFacebook<-bot_facebook$get_posts(pagename = "pima.go.cr", n = 30, reactions = F)
PROCOMERFacebook<-bot_facebook$get_posts(pagename = "ProcomerCR", n = 30, reactions = F)
SFEFacebook<-bot_facebook$get_posts(pagename = "SFE.go.cr", n = 30, reactions = F)
SUPENFacebook<-bot_facebook$get_posts(pagename = "supencr", n = 30, reactions = F)

#MAGTwitter<- bot_twitter$get_posts(pagename = "MAGCOSTARICA", n = 30)  OJO ESTOS NO TIENEN CUENTA DE tw
COMEXTwitter<-bot_twitter$get_posts(pagename = "comexcr", n = 15)
MEICTwitter<-bot_twitter$get_posts(pagename = "MEIC_crc", n = 15)
#MTSSTwitter<-bot_twitter$get_posts(pagename = "MTSS_CR", n = 15)
#OFINASETwitter<-bot_twitter$get_posts(pagename = "OFINASE", n = 30) OJO ESTOS NO TIENEN CUENTA DE tw
#PIMATwitter<-bot_twitter$get_posts(pagename = "pima.go.cr", n = 30) "OJO ESTOS NO TIENEN CUENTA DE tw"
PROCOMERTwitter<-bot_twitter$get_posts(pagename = "Procomer_CR", n = 15)
#SFETwitter<-suppressWarnings(bot_twitter$get_posts(pagename = "FitosanitarioCR", n = 15))
SUPENTwitter<-bot_twitter$get_posts(pagename = "SUPEN_CR", n = 15)



comentarioRedes<-sqldf("select 'Facebook' as Redsocial,'MAG' as comercio,MAGFacebook.text,date_time from MAGFacebook 
                       UNION 
                       select 'Facebook','COMEX',COMEXFacebook.text,date_time from COMEXFacebook
                       UNION
                       select 'Facebook','MEIC',MEICFacebook.text,date_time from MEICFacebook
                       UNION
                       select 'Facebook','MTSS',MTSSFacebook.text,date_time from MTSSFacebook
                       UNION
                       select 'Facebook','OFINASE',OFINASEFacebook.text,date_time  from OFINASEFacebook
                       UNION
                       select 'Facebook','PIMA',PIMAFacebook.text,date_time  from PIMAFacebook
                       UNION
                       select 'Facebook','PROCOMER',PROCOMERFacebook.text,date_time  from PROCOMERFacebook
                       UNION
                       select 'Facebook','SFE',SFEFacebook.text,date_time  from SFEFacebook
                       UNION
                       select 'Facebook','SUPEN',SUPENFacebook.text,date_time  from SUPENFacebook
                       UNION

                       select 'Twitter','COMEX',COMEXTwitter.text,date_time  from COMEXTwitter
                       UNION
                       select 'Twitter','MEIC',MEICTwitter.text,date_time  from MEICTwitter
                       UNION
                       select 'Twitter','PROCOMER',PROCOMERTwitter.text,date_time  from PROCOMERTwitter
                       UNION
                       select 'Twitter','SUPEN',SUPENTwitter.text,date_time  from SUPENTwitter
                       
                       ")

write.csv(comentarioRedes,"C:/MONICA.csv")

```


