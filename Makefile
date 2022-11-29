# Makefile
# 2022-11-28

all : doc/count_report.Rmd 

# count the words
results/isles.dat : data/isles.txt
	python src/countwords.py data/isles.txt results/isles.dat

results/abyss.dat : data/abyss.txt
	python src/countwords.py data/abyss.txt results/abyss.dat

results/last.dat : data/last.txt
	python src/countwords.py data/last.txt results/last.dat

results/sierra.dat : data/sierra.txt 
	python src/countwords.py data/sierra.txt results/sierra.dat

# create the plots

results/figure/isles.png : results/isles.dat
	python src/plotcount.py results/isles.dat results/figure/isles.png
    
results/figure/abyss.png : results/abyss.dat    
	python src/plotcount.py results/abyss.dat results/figure/abyss.png
  
results/figure/last.png : results/last.dat  
	python src/plotcount.py results/last.dat results/figure/last.png
  
results/figure/sierra.png : results/sierra.dat  
	python src/plotcount.py results/sierra.dat results/figure/sierra.png

# write the report
doc/count_report.Rmd : results/figure/isles.png results/figure/abyss.png results/figure/sierra.png results/figure/last.png
	Rscript -e "rmarkdown::render('doc/count_report.Rmd')"
	
	
clean :
			rm -f **/*.dat
			rm -f **/*.png
			
cleanimg : 
			rm -f **/*.png
	
	
	
	