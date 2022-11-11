report.html: code/04_render_report.R code/02_make_plot.R code/01_make_table1.R code/00_clean_data.R report.Rmd output/table_one.rds output/ldx.png output/lc.png output/rc.png output/vs.png
	Rscript code/04_render_report.R

output/data_clean.rds: code/00_clean_data.R data/city.csv
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_make_table1.R output/data_clean.rds

	Rscript code/01_make_table1.R

output/ldx.png: code/02_make_plot.R output/data_clean.rds

	Rscript code/02_make_plot.R

output/lc.png: code/02_make_plot.R output/data_clean.rds

	Rscript code/02_make_plot.R
	
output/rc.png: code/02_make_plot.R output/data_clean.rds

	Rscript code/02_make_plot.R

output/vs.png: code/02_make_plot.R output/data_clean.rds

	Rscript code/02_make_plot.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png
	
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
