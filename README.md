# Ciência de Dados, Parte 1
Código usado na disciplina Análise de Dados 1, do curso de Ciência da Computação da UFCG. Análise de Dados 1 foca em técnicas de Ciência de Dados para análises exploratórias e descritivas. Análise de Dados 2 cobre modelos preditivos. Outras disciplinas do curso se aprofundam em Big Data, visualização, recuperação da informação e IA.

![tirinha](http://i.stack.imgur.com/3ngU8.png)

## Organização
Cada diretório cobre uma unidade da disciplina. A dita cuja está descrita [numa página no Canvas](https://canvas.instructure.com/courses/1155772/modules).

## Dependências

Todo o código nesse repositório é em R, e usa principalmente bibliotecas do tidyverse.

```
dependencias = c("tidyverse", "GGally", "directlabels", "broom", "modelr")
install.packages(dependencias)
```

No Linux o pacote `readr` dentro do tidyverse pode precisar da `libcurl4-openssl-dev`. Se for o caso, faça `sudo apt-get -y install libcurl4-openssl-dev`.


## Licença
Creative Commons. Reuse à vontade!

## Créditos
Nazareno Andrade e João Arthur Brunet Monteiro

<img src="https://analytics-ufcg.github.io/dados-contra-corrupcao//img/logo-analytics-aleatoria.png" width=250>
<img src="https://2350b1fa-a-a6606a5f-s-sites.googlegroups.com/a/computacao.ufcg.edu.br/principal/config/40%20anos%20menor.jpg" width=250>
