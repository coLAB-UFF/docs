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
        content: Estatísticas Descritivas
        url: '/dataviz_03'
    next:
        content: Manipulação de Dados 1
        url: '/dataviz_05'
---

# Instalação de Pacotes no R

Para instalar pacotes, utilize o comando `install.packages()`, indicando entre aspas o nome do pacote pretendido. É possível também proceder uma instalação pelo modo gráfico, no menu **Packages > Install do R Studio**.

Sempre que um pacote é instalado, é preciso requisitá-lo, antes de começar a usar. Você pode requisitar um pacote por meio da função `library()` ou da função `require()`.

O R fornece uma série de pacotes com *datasets* para testar manipulação de dados. Alguns desses pacotes já estão integrados à *R Base*, como `mtcars` (pacote com dados sobre modelos de carros esportivos). Outros, precisam de instalação adicional, como `palmerpenguins` (pacote com dados sobre pinguins catalogados na Antártida). Vamos visualizar esses dados?

* `mtcars`

```
mtcars

carros <- mtcars

View(carros)
```

*  `palmerpenguins`

```
install.packages("palmerpenguins")
library(palmerpenguins)
penguins

dados_aves <- penguins
View(dados_aves)
```

Para utilizar as funções de um pacote, há duas maneiras. A primeira delas é requisitar o pacote, por meio da função `library()`. A segunda é indicar o nome do pacote imediatamente antes de executar a função. Veja os exemplos abaixo.

```
palmerpenguins::penguins

library(palmerpenguins)
penguins
```

Vamos agora conhecer um pouco mais sobre manipulação de bancos de dados?


