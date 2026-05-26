---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Correlação de Pearson e Regressão Linear
description: Curso de análise e visualização de dados

# Author box
author:
    title: coLAB
    title_url: 'https://colab-uff.github.io/'
    external_url: true
    description: Laboratório de Pesquisa em Comunicação, Culturas Políticas e Economia da Colaboração

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Visualização de Dados 2
        url: '/dataviz2_10'
    next:
        content: Mapas Coropléticos
        url: '/dataviz2_12'

---

<div style="position: relative; width: 100%; height: 0; padding-top: 56.2500%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAHKtuw_qIA/zhQO2UMjmA08Wu-mZKO5_Q/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>

# Correlação de Pearson

As principais funções para calcular a correlação de Pearson entre duas variáveis numéricas são `cor()` e `cor.test()`, ambas do R Base.

```
library(palmerpenguins)
library(dplyr)
library(ggplot2)

pinguins <- penguins %>% tidyr::drop_na()

cor(pinguins$flipper_length_mm, pinguins$body_mass_g, method = "pearson")

pinguins %>% 
  summarise(correlacao = cor(flipper_length_mm, body_mass_g, method = "pearson"))

cor.test(pinguins$flipper_length_mm, pinguins$body_mass_g, method = "pearson")
```

Em `cor.test()`, observar:

* **Coeficiente de correlação (r)**: mede a força e a direção da associação entre duas variáveis.
  
* **p-valor**: indica a probabilidade de observar o resultado obtido caso a hipótese nula seja verdadeira. Um p-valor muito pequeno indica que seria muito improvável observar uma correlação tão forte apenas por acaso.
  
* **Intervalo de confiança**: faixa de valores plausíveis para o parâmetro estimado na população.
  
* **Estatística t**: mede o quanto o resultado observado se afasta do valor esperado sob a hipótese nula. Quanto mais alto, mais estatisticamente significativa a correlação também.
  
* **df (graus de liberdade)**: quantidade de informação independente disponível para estimar o teste estatístico. Quanto maior o df, maior a quantidade de dados sustentando o teste; isso torna a estimativa mais estável e o teste mais confiável.

# Matriz de Correlação

Para gerar uma visualização de matriz de correlação de forma simples, instale o pacote `corrplot`.

```
library(corrplot)

pinguins <- penguins %>%
  select(flipper_length_mm, body_mass_g, bill_length_mm, bill_depth_mm) %>%
  drop_na()

corrplot(cor(pinguins))
```

# Regressão Linear Simples

Para criar um modelo de regressão linear simples ou múltipla, utilize a função `lm()` do R Base.

```
pinguins <- penguins %>% tidyr::drop_na()

modelo1 <- lm(flipper_length_mm ~ body_mass_g, pinguins)

summary(modelo1)

broom::tidy(modelo1)

modelo2 <- lm(body_mass_g ~ flipper_length_mm + bill_length_mm + bill_depth_mm + sex + species, pinguins)

summary(modelo2)
```

# Teste de Qui Quadrado

Para avaliar a associação entre duas variáveis categóricas, utilize a função `chisq.test()` do R Base.

```
chisq.test(pinguins$species, pinguins$island)
```

# Análise de Correspondência

Para visualizar a associação entre duas variáveis categóricas binárias ou multinomiais, utilize o pacote `ca`.

```
library(ca)

ca(table(pinguins$species, pinguins$island))

plot(ca(table(pinguins$species, pinguins$island)))
```

Pode-se utilizar um pacote adicional, como `ggplotit` para simplificar o uso e melhor customizar os elementos estéticos do gráfico.

```
library(ggplotit)

library(ggplot2)

dataca <- ca(table(pinguins$species, pinguins$island))

ggplotit(dataca) +
  ggplot2::geom_vline(xintercept = 0) +
  ggplot2::geom_hline(yintercept = 0)
```

```

