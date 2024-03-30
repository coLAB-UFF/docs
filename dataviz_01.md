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
        content: Proposta do Curso
        url: '/dataviz'
    next:
        content: Estatísticas Descritivas
        url: '/dataviz_02'
---

# Funções Básicas

Conhecendo as funções de impressão (`print()`) e visualização (`View()`).
Imprimindo variáveis numéricas e nominais.

```
1
print(1)

texto
print(texto)

"texto"
print("texto")
```

# Atribuição

Atribuindo um valor a uma variável, por meio da sintaxe `=` ou `<-`.

```
variavel = "texto"
variavel

print(variavel)
View(variavel)

variavel <- "um novo texto"
variavel
```

# Sequências Alfanuméricas

Imprimindo sequências alfanuméricas.

```
1:60
seq(from = 1, to = 60)
seq(1,60)
seq(1,60,3)
seq(1,60,.5)
letters
letters[3]
seq(1,60,3)[5]
rep("texto",10)
variavel <- seq(1,60)
length(variavel)
```

# Operadores Matemáticos ou Lógicos

Operadores aritméticos.

```
1+1
3-1
1-2
9 / 3
2 * 3
4 ^ 2
(3 + 1) * (6 - 1) ^ 2
3 + 1 * 6 - 1 ^ 2
(1 + (2 * 3)) * 5
sqrt(16) # raiz quadrada de 16
log(10,10) # log de 10 na base 10
```

Operados booleanos.

```
3 > 2
5 < 2
2 == 2
2 != 2
(6 > 5) & (7 > 8) # AND
(6 > 5) | (7 > 8) # OR
```

# Inserindo Múltiplas Variáveis

Cohecendo a função de combinação `c()`.

```
c(1, 2, 3, 4, 5, 6,
  7, 8, 9, 10, 11)

c("banana", "laranja", "abacate")

vetor <- c("banana", "laranja", "abacate")
print(vetor)
View(vetor)

vetor1 <- c(1, 2, 3)
vetor2 <- c(2,4,5)
vetor1 + vetor2
vetor1 * vetor2
sum(vetor1) # Soma
prod(vetor2) # Produto (Multiplicação)
max(vetor2)
min(vetor2)
```

