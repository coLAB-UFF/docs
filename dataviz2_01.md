---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Funções Básicas
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
        url: '/dataviz2'
    next:
        content: Tipos de Variáveis
        url: '/dataviz2_02'
---

# Definições Iniciais

<div style="position: relative; width: 100%; height: 0; padding-top: 56.2500%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAHED5qu3d4/wTeTdz41ew7F6eBzwPB8iw/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>
<a href="https:&#x2F;&#x2F;www.canva.com&#x2F;design&#x2F;DAHED5qu3d4&#x2F;wTeTdz41ew7F6eBzwPB8iw&#x2F;view?utm_content=DAHED5qu3d4&amp;utm_campaign=designshare&amp;utm_medium=embeds&amp;utm_source=link" target="_blank" rel="noopener">Dataviz Aula 1</a> de Viktor Chagas

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

