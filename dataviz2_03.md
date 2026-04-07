---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Tipos de Variáveis
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
        content: Estruturas de Dados
        url: '/dataviz2_02'
    next:
        content: Amostras
        url: '/dataviz2_04'
---

# Tipos de Variáveis

Existem diferentes tipos de variáveis comportadas pelo R. As mais comuns são as seguintes:

* Numéricas (`numeric`): Números inteiros ou reais, como idade, renda, número de filhos.

* Datas (`Date`): São um tipo especial de variável numérica.

* Categóricas (`factor`): Variáveis qualitativas, ou seja, características dos indivíduos para as quais não é possível atribuir um valor numérico, como sexo, religião, estado civil, opinião sobre algum tema. É possível agrupar os indivíduos em categorias e contar quantos indivíduos pertencem a cada categoria, mas se, por exemplo, um indivíduo afirma ser católico, e outro, protestante, não podemos, com base nessas afirmações, considerar um mais religioso do que o outro.

* Categóricas ordenáveis (`ordered`): Tipo de variável categórica cujas categorias podem ser hierarquizáveis, como grau de escolaridade, alguns tipos de respostas a perguntas de questionário. Se à pergunta “Qual o papel do governo?”, as opções de resposta forem “O governo deve mandar em tudo”, “O governo deve controlar algumas coisas” e “Não precisamos de governo”, poderíamos considerar aqueles que optaram pela primeira opção adeptos de uma ideologia mais estatizante do que aqueles que escolheram a terceira opção.

* Texto (`character`): Características puramente individuais que não podem ser utilizadas para categorizar os indivíduos. Geralmente aparecem nos bancos de dados apenas para ajudar em análises qualitativas e não estatísticas. Exemplo: o nome dos candidatos num banco de dados de resultados eleitorais. Em alguns casos, os textos são passíveis de categorização, como as respostas a uma pergunta aberta. Neste caso, seria preciso manualmente recodificar as respostas abertas numa nova variável contendo um número limitado de categorias.

* Booleanas (`logical`): Variáveis cujos valores podem ser VERDADEIRO ou FALSO; no R, TRUE ou FALSE.

```
variavel <- seq(1,60)
summary(variavel)
class(variavel)

numero <- 1:10
class(numero)
summary(numero)

numero <- 1
class(numero)

numero <- "1"
class(numero)
summary(numero)

numero <- 1 == 1
class(numero)

numero <- 2021-02-09
numero
numero <- "2021-02-09"
class(numero)

numero <- as.Date("2021-02-09")
class(numero)

tamanho <- factor(c("pequeno", "grande", "grande", "pequeno", "medio")) # factor com três diferentes níveis
tamanho
class(tamanho)

tamanho <- factor(c("pequeno", "grande", "grande", "pequeno", "medio"),
                  levels = c("pequeno", "medio", "grande"), ordered = TRUE) # determinando a ordem do fator
tamanho
class(tamanho)
```




