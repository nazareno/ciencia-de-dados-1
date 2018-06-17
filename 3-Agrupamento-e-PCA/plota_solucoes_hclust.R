get_grupos <- function(agrupamento, num_grupos){
    agrupamento %>% 
        cutree(num_grupos) %>% 
        as.data.frame() %>% 
        mutate(label = rownames(.)) %>% 
        gather(key =  "k", value = "grupo", -label) %>% 
        mutate(grupo = as.character(grupo))
}

plota_hclusts_1d = function(dados_filme, 
                            nome_coluna, # coluna usada para distâncias
                            dist_method = "euclidean", 
                            linkage_method = "complete", 
                            ks = 1:9){
    #' Retorna um ggplot das soluções de agrupamento de `dados_filme` 
    #' para as quantidades de grupos em `ks` usando `hclust`.
    library(ggplot2)
    library(dplyr, warn.conflicts = F)
    
    agrupamento_h = dados_filme %>% 
        column_to_rownames("TITLE") %>% 
        select_(nome_coluna) %>%
        dist(method = dist_method) %>% 
        hclust(method = linkage_method)
    
    atribuicoes = get_grupos(agrupamento_h, num_grupos = ks)
    
    atribuicoes = atribuicoes %>% 
        mutate(TITLE = label) %>% 
        left_join(filmes, by = "TITLE")
    
    atribuicoes %>% 
        ggplot(aes_string(y = nome_coluna, colour = "grupo")) + 
        geom_jitter(aes(x = " "), 
                    width = .02, height = 0, size = 1.6, alpha = .6) + 
        facet_wrap(~ paste(k, " grupos")) + 
        scale_color_brewer(palette = "Set2") + 
        xlab("") 
}

plota_hclusts_2d = function(agrupamento,
                            dados_filme,
                            nome_colunas, # coluna usada para distâncias
                            dist_method = "euclidean", 
                            linkage_method = "complete", 
                            ks = 1:9){
    #' Retorna um ggplot das soluções de agrupamento de `dados_filme` 
    #' para as quantidades de grupos em `ks` usando `hclust`.
    library(ggplot2)
    library(dplyr, warn.conflicts = F)
    
    atribuicoes = get_grupos(agrupamento, num_grupos = ks)
    
    atribuicoes = atribuicoes %>% 
        mutate(TITLE = label) %>% 
        left_join(filmes, by = "TITLE")
    
    atribuicoes %>% 
        ggplot(aes_string(x = nome_colunas[1], y = nome_colunas[2], colour = "grupo")) + 
        geom_jitter(width = .02, height = 0, size = 2.6, alpha = .6) + 
        facet_wrap(~ paste(k, " grupos")) + 
        scale_color_brewer(palette = "Set2")
}


plota_hclusts_md = function(agrupamento,
                            dados_filme,
                            nome_colunas, # coluna usada para distâncias
                            dist_method = "euclidean", 
                            linkage_method = "complete", 
                            ks = 1:9){
    #' Retorna um ggplot das soluções de agrupamento de `dados_filme` 
    #' para as quantidades de grupos em `ks` usando `hclust`.
    library(ggplot2)
    library(dplyr, warn.conflicts = F)
    
    atribuicoes = get_grupos(agrupamento, num_grupos = ks)
    
    atribuicoes = atribuicoes %>% 
        mutate(TITLE = label) %>% 
        left_join(filmes, by = "TITLE")
    
    atribuicoes %>% 
        ggplot(aes_string(x = nome_colunas[1], y = nome_colunas[2], colour = "grupo")) + 
        geom_jitter(width = .02, height = 0, size = 2.6, alpha = .6) + 
        facet_wrap(~ paste(k, " grupos")) + 
        scale_color_brewer(palette = "Set2")
}