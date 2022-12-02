From rocker/r-ubuntu

# DB: add a couple packages
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev
RUN apt-get update && apt-get install -y libfontconfig1-dev
RUN apt-get update && apt-get install -y pandoc 

ENV VERSION 0.16.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))" # need to know why
RUN R -e "remotes::install_github('rstudio/renv@${VERSION}')"
RUN R -e "install.packages(c('yaml', 'tidyverse', 'kableExtra', 'ggplot2', 'rmarkdown', 'here', 'knitr'))"

RUN mkdir /final_proj
WORKDIR /final_proj

COPY makefile .
COPY README.md .
COPY .gitignore .

RUN mkdir data
RUN mkdir code
RUN mkdir output 

COPY data data
COPY code code 
COPY report.Rmd .

RUN mkdir report

CMD make && mv report.html report




