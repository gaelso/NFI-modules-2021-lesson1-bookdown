

## Create a function to convert TeX expressions to Rmd
conv_tex <- function(.file){
  
  conv_citep <- .file %>% 
    str_extract_all(pattern = "\\\\citep\\{[^{}]+\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\citep\\{", "[@") %>%
        str_replace("\\}", "]") %>%
        str_replace_all(",", "; @")
    )
  conv_citep
  
  conv_citet <- .file %>% 
    str_extract_all(pattern = "\\\\citet\\{[^{}]+\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\citet\\{", "@") %>%
        str_replace("\\}", "") %>%
        str_replace_all(",", "; @")
    )
  conv_citet
  
  conv_citealp <- .file %>% 
    str_extract_all(pattern = "\\([^()]+\\)") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      has_citealp = str_detect(tex, "citealp")
      ) %>%
    filter(has_citealp == TRUE) %>%
    mutate(
      citealp = str_extract(tex, pattern = "\\\\citealp\\{[^{}]+\\}"),
      citealp_regex = citealp %>%
        str_replace("\\\\", "\\\\\\\\") %>%
        str_replace("\\{", "\\\\{") %>%
        str_replace("\\}", "\\\\}"),
      citealp_conv = citealp %>% 
        str_replace("\\\\citealp\\{", "@") %>%
        str_replace("\\}", "") %>%
        str_replace_all(",", "; @"),
      conv = tex %>%
        str_replace(pattern = citealp_regex, replacement = citealp_conv) %>%
        str_replace("\\(", "[") %>%
        str_replace("\\)", "]") %>%
        str_replace("\\\\", "\\\\\\\\")
    ) %>%
    select(tex, conv)
  conv_citealp
  
  conv_section <- .file %>% 
    str_extract_all(
      pattern = "\\\\section\\{[^{}]+\\}|\\\\subsection\\{[^{}]+\\}|\\\\subsubsection\\{[^{}]+\\}"
    ) %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\section\\{", "## ") %>%
        str_replace("\\\\subsection\\{", "### ") %>%
        str_replace("\\\\subsubsection\\{", "#### ") %>%
        str_replace("\\}", "")
    )
  conv_section
  
  conv_textit <- .file %>% 
    str_extract_all(pattern = "\\\\textit\\{[^{}]+\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\textit\\{", "*") %>%
        str_replace("\\}", "*")
    )
  conv_textit
  
  conv_emph <- .file %>% 
    str_extract_all(pattern = "\\\\emph\\{[^{}]+\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\emph\\{", "*") %>%
        str_replace("\\}", "*")
    )
  conv_emph
  
  conv_texttt <- .file %>% 
    str_extract_all(pattern = "\\\\texttt\\{[^{}]+\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\texttt\\{", "`") %>%
        str_replace("\\}", "`")
    )
  conv_texttt
  
  conv_ref <- .file %>% 
    str_extract_all(
      pattern = "Figure \\\\ref\\{[^{}]+\\}|chapter \\\\ref\\{[^{}]+\\}|Table \\\\ref\\{[^{}]+\\}|section \\\\ref\\{[^{}]+\\}|red line \\\\ref\\{[^{}]+\\}"
    ) %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("Figure \\\\ref\\{", "Figure \\\\\\\\@ref(fig:") %>%
        str_replace("Table \\\\ref\\{", "Table \\\\\\\\@ref(tab:") %>%
        str_replace("chapter \\\\ref\\{", "chapter \\\\\\\\@ref(") %>%
        str_replace("section \\\\ref\\{", "section \\\\\\\\@ref(") %>%
        str_replace("red line \\\\ref\\{", "red line \\\\\\\\@ref(exr:") %>%
        str_replace("\\}", ")")
    )
  conv_ref
  
  conv_uspace <- .file %>% 
    str_extract_all(pattern = "\\\\,") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\,", "\\\\\\\\ ")
    )
  conv_uspace
  
  conv_eqlabel <- .file %>% 
    str_extract_all(pattern = "\\\\label\\{[^{}]+\\}\\r\\n\\\\end\\{equation\\}") %>%
    unlist() %>% 
    tibble(tex = .) %>% 
    mutate(
      conv = tex %>% 
        str_replace("\\\\label\\{", "\\(\\\\#eq\\:") %>%
        str_replace("\\}", "\\)") %>%
        str_replace_all("\\\\", "\\\\\\\\")
      )
    conv_eqlabel
    
  conv_all <- bind_rows(
    conv_citep, 
    conv_citet, 
    conv_citealp,
    conv_section,
    conv_textit,
    conv_emph,
    conv_texttt,
    conv_ref,
    conv_uspace,
    conv_eqlabel
  ) %>%
    mutate(
      regex = tex %>%
        str_replace_all("\\\\", "\\\\\\\\") %>%
        str_replace_all("\\{", "\\\\{") %>%
        str_replace_all("\\}", "\\\\}") %>%
        str_replace_all("\\(", "\\\\(") %>%
        str_replace_all("\\)", "\\\\)")
    )
  
  return(conv_all)
    
} ## END FUNCTION conv_tex()

## Programmatically read all tex files and convert to rmd
tex_files <- list.files(path = "source/tex_original", pattern = "ok_2.tex", full.names = T)
tex_names <- list.files(path = "source/tex_original", pattern = "ok_2.tex") %>% str_remove("_done.*")

tex_list <- map(tex_files, read_file)
names(tex_list) <- tex_names
str(tex_list)

dir.create("tex_conv", showWarnings = FALSE)

for (i in seq_along(tex_list)){
  
  tex <- tex_list[[i]]
  
  conv_table <- conv_tex(tex)
  
  tex_conv <- tex 
  
  for (j in seq_along(conv_table$regex)) {
    
    tex_conv <- str_replace(tex_conv, pattern = conv_table$regex[j], replacement = conv_table$conv[j])
    
  }
  
  ## Also replace `` and ''
  tex_conv <- str_replace_all(tex_conv, pattern = "\`\`", replacement = "\"")
  tex_conv <- str_replace_all(tex_conv, pattern = "\'\'", replacement = "\"")
  
  write_file(tex_conv, file = paste0("tex_conv/", tex_names[i], ".rmd"))
  
}

