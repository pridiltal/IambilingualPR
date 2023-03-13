#https://www.njtierney.com/post/2022/04/11/rmd-to-qmd/

# change filenames: filename.Rmd —> filename.qmd
library(fs)
library(stringr)
rmd_names <- dir_ls(path = ".", glob = "*.Rmd")
qmd_names <- str_replace(string = rmd_names,
                         pattern = "Rmd",
                         replacement = "qmd")
file_move(path = rmd_names,
          new_path = qmd_names)

file_move(path = "_bookdown.yml",
          new_path = "_quarto.yml")

# Step2
#Change _bookdown.yml to _quarto.yml and remove _output.yml

# Step 3
#One thing I also needed to do was to replace the chapter names I had listed in the chapter as :
#“index.Rmd” –> “index.qmd”
#“license.Rmd” -> “license.qmd”
#et cetera.
#I used this code to do that:

library(readr)
library(stringr)
quarto_yaml_rmd <- read_lines("_quarto.yml")

quarto_yaml_qmd <- str_replace_all(string = quarto_yaml_rmd,
                                   pattern = "Rmd",
                                   replacement = "qmd")

write_lines(
  x = quarto_yaml_qmd,
  file = "_quarto.yml"
)
  
# Step 4
# on terminal type
# quarto preview
