---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: dataviz
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
        content: Tipos de Variáveis
        url: '/dataviz_02'
    next:
        content: Importação e Exportação de Dados
        url: '/dataviz_04'
---

# Estatísticas Descritivas (Estatísticas de Posição)

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

