library(dplyr)
library(readr)
movies = read_csv("~/workspace/fpcc2/02-inferencia/dados/ml-latest-small/movies.csv", 
                         col_types = list(.default = col_character()))

movies =  movies %>%
    rowwise() %>%
    mutate(num_genres = length(unlist(strsplit(genres, '[|]'))))

l2w_genres = function(line){
    resposta = rep(line, times = l)
    g = data.frame(genre = unlist(strsplit(line$genres, '[|]')))
    g$title = line$title
    return(full_join(as.data.frame(line), g))
}

moviegenre = movies %>%
    #select(title, genres) %>%
    rowwise() %>%
    do(l2w_genres(.))
