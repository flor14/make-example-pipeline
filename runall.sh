# run_all.sh
# Tiffany Timbers, Nov 2018

# This driver script completes the textual analysis of
# 3 novels and creates figures on the 10 most frequently
# occuring words from each of the 3 novels. This script
# takes no arguments.

# example usage:
# bash runall.sh

# count the words
python src/countwords.py data/isles.txt results/isles.dat
python src/countwords.py data/abyss.txt results/abyss.dat
python src/countwords.py data/last.txt results/last.dat
python src/countwords.py data/sierra.txt results/sierra.dat

# create the plots
python src/plotcount.py results/isles.dat figures/isles.png
python src/plotcount.py results/abyss.dat figures/abyss.png
python src/plotcount.py results/last.dat figures/last.png
python src/plotcount.py results/sierra.dat figures/sierra.png

# write the report
Rscript -e "rmarkdown::render('doc/count_report.Rmd')"