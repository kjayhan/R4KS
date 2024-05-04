#text two columns

Let's analyze the text from Korea's 2022 Diplomatic White Paper (외교백서, waegyo baekseo) which is available as a pdf file on the Ministry of Foreign Affairs' (MOFA) website.

Let's load the pdf file:
  
  {r}
# Load PDF
#pdf_path <- "data/2022외교백서.pdf"

Now let's extract the text from the pdf file using the pdf_text function from the pdftools package.

{r}
# Extract text
pdf_text_all <- pdf_text(pdf_path)

Now, pdf_text_all is a list of character vectors, where each element corresponds to a page in the pdf file. For example, we can look at the 141st page of the pdf file in the following way.

{r}
# Look at the 141st page
pdf_text_all[141]

The 141st page, which is actually 296 and 297th pages, in the pdf file looks like this:

2022 Diplomatic White Paper (Korean Version), 280 and 281th pages

Table extraction

Let's try to extract the first table on the pages from 280th to 284th of the pdf file. It is going to be more complicated than regular text extraction. That is because the table is not multi-page but also each pdf page actually consist two pages, that is there are two columns on each page. In other words, when extracting, we would see that the lines on the table on the left side of the pdf page (i.e., page 280) and the lines on the table on the right side of the pdf page (i.e., page 281) are technically on the same line. Check out line 11 of the 141th page on the pdf file. UN and OECD are on the same line. Explain the functions.

{r}
pdf_141_143 <- pdf_text_all[141:143]

lines_pdf_141_143 <- str_split(pdf_141_143, "\n")

for (i in 1:3) {
  assign(paste0("lines_pdf_", i), lines_pdf_141_143[[i]])
}

lines_pdf_1[11]

#https://stackoverflow.com/questions/42541849/extract-text-from-two-column-pdf-with-r

Let's combine all the text into a single character vector.

{r}




# let's automate this process


pdf_text <- map(pdf_text_all, ~.x |> str_c(collapse = " ") |> str_squish())

# Combine text
pdf_text <- str_c(pdf_text, collapse = " ")


