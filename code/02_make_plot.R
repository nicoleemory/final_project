here::i_am("code/02_make_plot.R")

file_minus_loc <- here::here("data/city_minus.csv")
city_minus <- read.csv(file_minus_loc)

file_cities_loc <- here::here("data/cities.csv") 
cities <- read.csv(file_cities_loc) 

library(ggplot2)

#Late Diagnoses by Gender within Each Region
ldx <- ggplot(cities, aes(x=REGION)) +
        geom_point(aes(y = mldxprop, color = "darkblue"), size = 1) + 
        geom_point(aes(y = fldxprop, color = "darkred"), size = 1) +
          scale_color_discrete(name = "Legend", labels = c("Males", "Females")) +
            labs(x = "Regions" , y = "Percentages", title = "Figure 1. Percentages of Late Diagnoses by Gender within Each Region") + 
              theme(plot.title = element_text(hjust = 0.5)) +
                theme_bw() +
                  coord_cartesian( ylim = c(0, 100))

#Linked to Care by Gender within Each Region
lc <- ggplot(city_minus, aes(x=REGION)) +
        geom_point(aes(y = mlcprop, color = "darkblue"), size = 1) + 
        geom_point(aes(y = flcprop, color = "darkred"), size = 1) +
          scale_color_discrete(name = "Legend", labels = c("Males", "Females")) +
            labs(x = "Regions" , y = "Percentages", title = "Figure 2. Percentages of Linkages to Care by Gender within Each Region") + 
              theme(plot.title = element_text(hjust = 0.5)) +
                theme_bw() +
                  coord_cartesian( ylim = c(0, 100))

#Receipt of Care by Gender within Each Region
rc <- ggplot(cities, aes(x=REGION)) +
        geom_point(aes(y = mrcprop, color = "darkblue"), size = 1) + 
        geom_point(aes(y = frcprop, color = "darkred"), size = 1) +
          scale_color_discrete(name = "Legend", labels = c("Males", "Females")) +
            labs(x = "Regions" , y = "Percentages", title = "Figure 3. Percentages of Receipt of Care by Gender within Each Region") + 
              theme(plot.title = element_text(hjust = 0.5)) +
                theme_bw() +
                  coord_cartesian( ylim = c(0, 100))

#Viral Suppression by Gender within Each Region
vs <- ggplot(cities, aes(x=REGION)) +
        geom_point(aes(y = mvsprop, color = "darkblue"), size = 1) + 
        geom_point(aes(y = fvsprop, color = "darkred"), size = 1) +
          scale_color_discrete(name = "Legend", labels = c("Males", "Females")) +
            labs(x = "Regions" , y = "Percentages", title = "Figure 4. Percentages of Viral Suppression by Gender within Each Region") + 
              theme(plot.title = element_text(hjust = 0.5)) +
                theme_bw() +
                  coord_cartesian( ylim = c(0, 100))

ggsave(here::here("output/ldx.png"), 
       plot = ldx,
       device = "png")

ggsave(here::here("output/lc.png"), 
       plot = lc,
       device = "png")

ggsave(here::here("output/rc.png"), 
       plot = rc,
       device = "png")

ggsave(here::here("output/vs.png"), 
       plot = vs,
       device = "png")