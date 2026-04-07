---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Manipulação de Dados 1
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
        content: Amostras
        url: '/dataviz2_04'
    next:
        content: Manipulação de Dados 1
        url: '/dataviz2_06'
---

# Estatísticas Descritivas

<div style="position: relative; width: 100%; height: 0; padding-top: 56.2500%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAHEElt9aKc/CRRd2GqgvsGg-SS7m-3LQg/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>


# Estatísticas de Localização

A média de um conjunto de dados é encontrada somando-se todos os números do conjunto de dados e então dividindo o resultado pelo número de valores do conjunto. A média é influenciada por todos os valores, inclusive os extremos.

A mediana é o valor do meio quando o conjunto de dados está ordenado do menor para o maior. É necessário ordenar os valores para reconhecer a mediana. A mediana ignora os *outliers*.

A moda é o número que aparece mais vezes em um conjunto de dados. Não há no R Base uma função específica para o cálculo da moda.

```
mean(c(1,7,3,2,4))
median(c(1,7,3,2,4))
mean(c(6.0, 7.1, 5.5, 3.0, 10.0, 100.0, 6.5, 8.2, 2.9, 3.5, 9.9, 
       9.1, 8.2, 7.6, 9.9, 10.0, 6.7, 4.9, 10.0, 6.8, 6.0))
median(c(6.0, 7.1, 5.5, 3.0, 10.0, 100.0, 6.5, 8.2, 2.9, 3.5, 9.9, 
         9.1, 8.2, 7.6, 9.9, 10.0, 6.7, 4.9, 10.0, 6.8, 6.0))
## 2.9, 3.0, 3.5, 4.9, 5.5, 6.0, 6.0, 6.5, 6.7, 6.8,
## 7.1, 7.6, 8.2, 8.2, 9.1, 9.9, 9.9, 10.0, 10.0, 10.0, 100.0
```

Para resumir algumas variáveis, há funções que descrevem o conjunto de valores.

```
notas <- c(6.0, 7.1, 5.5, 3.0, 10.0, 100.0, 6.5, 8.2, 2.9, 3.5, 9.9, 
           9.1, 8.2, 7.6, 9.9, 10.0, 6.7, 4.9, 10.0, 6.8, 6.0)
summary(notas)
head(notas)
dplyr::glimpse(notas)
```


Vamos agora conhecer um pouco mais sobre manipulação de bancos de dados?
