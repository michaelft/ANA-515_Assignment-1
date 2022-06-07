---
Title: "ANA 515, Assignment 1"
Author: "Michael Tagore"
Date: "06/05/22"
output: 
  html_document:
   theme: 
    bootswatch: minty
---
  
```{r, include = FALSE}
gun_deaths = read.csv("https://raw.githubusercontent.com/fivethirtyeight/guns-data/master/full_data.csv")
```


```{r, include = FALSE}
library(bslib)
library(knitr)
library(tidyverse)
```

```{r, include = FALSE}
youth = subset(gun_deaths,age<=65)
```

```{r, include = FALSE}
summary(youth)
```


We have data about `r nrow(gun_deaths)` individuals killed by guns. Only `r nrow(gun_deaths) - nrow(youth)` are older than 65. The distribution of the remainder is shown below: 
  
```{r youth-dist, echo = FALSE}
youth %>% 
  ggplot(aes(age)) + 
  geom_freqpoly(binwidth = 1)
```

```{r race-dist, echo = FALSE}
youth %>% 
  ggplot(aes(fct_infreq(race)%>%fct_rev())) + geom_bar() + coord_flip()+labs(x="Victim race")
```
