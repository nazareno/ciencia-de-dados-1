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
    
    atribuicoes = tibble(k = ks) %>% 
        group_by(k) %>% 
        do(cbind(filmes, 
                 grupo = as.character(cutree(agrupamento_h, .$k)))) 
    atribuicoes %>% 
        ggplot(aes_string(y = nome_coluna, colour = "grupo")) + 
        geom_jitter(aes(x = " "), 
                    width = .02, height = 0, size = 2, alpha = .6) + 
        facet_wrap(~ paste(k, " grupos")) + 
        xlab("") %>% 
        return()
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
    
    atribuicoes = tibble(k = ks) %>% 
        group_by(k) %>% 
        do(cbind(filmes, 
                 grupo = as.character(cutree(agrupamento, .$k)))) 
    
    atribuicoes %>% 
        ggplot(aes_string(x = nome_colunas[1], y = nome_colunas[2], colour = "grupo")) + 
        geom_jitter(width = .02, height = 0, size = 2, alpha = .6) + 
        facet_wrap(~ paste(k, " grupos")) + 
        xlab("") %>% 
        return()
}