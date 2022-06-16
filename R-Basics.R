#WEEK-2 => Basics and Fundamentals of R


print("Lets's get started with R") ##Normal print
?print() ##TO know about any function


##declaring a variable
Fizz<-"HEY R community" ##declaring a variable ,which will be used further in declaring Data frame.


##Vector

Mount_height<-c(8848,8611,8586,8516,8485) ##creating a vector of world's highest peak
Mount_name<-c("M.everest","K2","Kanchenjunga","Lhotse","Makalu")
Mount_height #calling

#NOTE:data structure=vectors+data frames+matrix+arrays

#Data frame

Mount_df<-data.frame(Mount_name,Mount_height)##creating a df from vector
Mount_df #calling


#Matrix

m<-matrix(c(1:8),nrow=2)
m
n<-matrix(c(1:8),ncol=2)
n


#operations
half_year_1sales<-300000
half_year_2sales<-200000
full_year_sales<-half_year_1sales+half_year_2sales
full_year_sales
typeof(half_year_1sales)
\

#PACKAGE INSTALLATION

>installed.packages() ##installed and loaded(base) ##installed only(recommended)

install.packages("tidyverse")
library("tidyverse")
##NOTE:dplyr,ggplot2,tidyr ,readr,forcats,tibble,purrr,stringr are core 8 packages of R.


#WORKING WITH PIPES
#a pipe is tool which shows multiple consequent actions in R .%>%

data("ToothGrowth")
View(ToothGrowth)

library(dplyr) ##loading dplyr

filtered_Tg<-filter(ToothGrowth,dose==0.5)
View(filtered_Tg) ##filtering data where doses are 0.5 and viewing.  Remmember R is case sensitve

arrange(filtered_Tg,len) ##filtered data is sorted on the basis of ascending order of length of the data
##nesting
arrange(filter(ToothGrowth,dose==0.5),len)
##piping
filtered_toothgrowth<-ToothGrowth%>% filter(dose==0.5) %>% arrange(len) %>%group_by(supp) %>%  summarize(mean_len=mean(len))
View(filtered_toothgrowth)##filtering dose and then arange and then grouped and then finding mean length,andthen= %>% 

#SUMMARY WEEK-2
##simple print
##assigning variable and making vectors,DF,Matrix.
##OPERATION
##installing and loading packages
##Working with pipes 
***************WEEK-2********END**************
  
                            WEEK -3 Intermediate-R


#Understanding DF 
install.packages("tidyverse")
library(ggplot2)
data("diamonds")
View(diamonds) 


#PREVIWING 

head(diamonds) ##preview of df  first 6 rows
tail(diamonds)##preview last 6 rows

str(diamonds)##structure of data set
colnames(diamonds)##Getting col names


library(dplyr)
mutate(diamonds,carat_100=carat*100)## addtional fucntion of adding a col.mutate is used to add a col in df after installing dplyr


#IMPORTING DATA SET

##importing can be done in R studio through File section Top left corner and then import data set .EXAMPLE:_
###IMPORTING MOVIE DATA FROM COMP
movie_df<-Movie.Data.Starter.Project
View(movie_df)
 
##OR importing can be done through read_csv AND read_excel .make sure forward slashing when using function in file naming.



#CLEANING

install.packages("here")
library(here)

install.packages("skimr")
library(skimr)


install.packages("janitor")
library("janitor")

##make sure to load dplyr
library(dplyr)

install.packages("palmerpenguins") ##loading a data set
library(palmerpenguins)
View(penguins)

##summary

skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

penguins %>% select(species)##using select function to only view a certain col.Select can be used differently.check:-
penguins %>% select(1,3,4,5,6)##selecting only certain col through their numbers starting from 1.
penguins %>% select(-1,-2)##Non selection of 1st and 2nd col


##Renaming
penguins %>% rename(island_new=island) ##renaming island col to island_new

rename_with(penguins,toupper)##changing fields name to upper and lower 
rename_with(penguins,tolower)

clean_names(penguins)##ensuring only letters,numbers and undersoCRE


#ORGANIZE

library(tidyverse)

penguins %>% arrange(bill_length_mm)##arranging the data according to bill_length in ASC
penguins %>% arrange(-bill_length_mm)##arranging the data according to bill_length in DESC

###groupby
penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill_length=mean(bill_length_mm))
##data in penguin ,grouped by islands after droping NULL values and determing mean bill length
##similary
penguins %>% group_by(species) %>% drop_na() %>% summarize(max_length_bill=max(bill_length_mm))

penguins %>% group_by(species,island) %>% drop_na() %>% summarize(mean_bill_length=mean(bill_length_mm),max_bill_legnth=max(bill_length_mm))


###filtering

penguins %>% filter(species=="Adelie")
penguins %>% filter(island=="Torgersen")

#TRANSFORM

##creating a data frame

id<-c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee<-data.frame(id,name,job_title)
View(employee)


##separating values of a coloumn
install.packages("tidyr")

library(tidyr)

employee2<-separate(employee,name,into=c('first_name','last_name'),sep=" ")
View(employee2)

employee3<-unite(employee2,'FULL_NAME',first_name,last_name,sep ='  ')
View(employee3)

install.packages('palmerpenguins')
library(palmerpenguins)

View(penguins)

penguins%>%
  mutate(body_mass_kg=body_mass_g/1000,flipper_length_m=flipper_length_mm/1000)

***********************WEEK-3 Done ******************************
  
  
#WEEK-4***VISUALIZATION IN R*********
  
  
##4 ATTRIBUTES OF VIZ=AESTETICS+FACET+GEOM+LABELS AND ANNOTATION
  
install.packages('palmerpenguins')
library('palmerpenguins')
library('ggplot2')
View(penguins)

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))##GEOM point is used

##NOTE=Work flow of ploting

##AESTHETIC(SIZE,SHAPE,COLOUR)

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

##ADDING COLOUR TO DIFFRENTIATE SPECIES
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))


##ADDING SHAPES
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species))


##ADDINGSIZE
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species,size=species))

##ALPHA

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,alpha=species))


##color outside

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g),color='purple')



##GEOMS
ggplot(data=penguins)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))


##adding both geoms
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))

View(diamonds)


ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut))

ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,color=cut))

ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=cut))

##FACET

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_wrap(~species)

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_grid(sex~species)


#ANNOTATION,LABEL,SAVING IMAGES

library(ggplot2)
install.packages('palmerpenguins')
library("palmerpenguins")
View(penguins)
##adding title
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))+labs(title='palmerpenguins:body mass vs flipper_length')

##adding subtitle
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))+labs(title='palmerpenguins:body mass vs flipper_length',subtitle="sample of three species")

##adding caption
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))+labs(title='palmerpenguins:body mass vs flipper_length',subtitle="sample of three species",caption="data collected by doctor Gorman")

##adding annottion

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))+labs(title='palmerpenguins:body mass vs flipper_length',subtitle="sample of three species",caption="data collected by doctor Gorman") +
  annotate("text",x=220,y=3500,label="Gentoos are the largest")



# SAVING PLOT-1.EXPORT ,2.ggsave()

ggsave("Three penguins data.png")

##check file section for image


********************************WEEK-4-ENDED*********************************************************************

#WEEK -5 R-MARKDOWN
  
install.packages('rmarkdown')


