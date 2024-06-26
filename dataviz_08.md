---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Manipulação de Dados 4
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
        content: Manipulação de Dados 3
        url: '/dataviz_07'
    next:
        content: Visualização de Dados 1
        url: '/dataviz_09'

---

# Requisitar os Pacotes de Trabalho

```
#install.packages(magick)
#install.packages(tidyr)
#install.packages(stringr)

library(dplyr)
library(tidyr)
library(stringr)
library(magick)
library(palmerpenguins)
```

# Tidyr

Frequentemente, os dados dispostos em bancos de dados precisam ser arrumados, antes de serem analisados. O Tidyverse considera que o modelo ideal de arrumação de dados é o modelo designado por `tidy data`. Os bancos de dados tidy obedecem a três regras:

1. Cada variável deve ter sua própria coluna

2. Cada observação deve ter sua própria linha

3. Cada valor deve ter sua própria célula

Visualmente, as regras se apresentam dessa forma:

```
magick::image_read(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/tidy_data.png"
) %>% magick::image_scale("640") %>% print()
```

Ocorre que nem todos os bancos de dados, inicialmente, se encontram arrumados dessa forma. Por isso, muitas vezes, é necessário arrumar esses dados.

Considere, por exemplo, os conjuntos de dados a seguir. Qual(quais) desse(s) conjunto(s) é(são) *tidy*? E por quê?

```
#> tabela 1 # A tibble: 6 x 4
#>   country      year  cases population
#>   <chr>       <int>  <int>      <int>
#> 1 Afghanistan  1999    745   19987071
#> 2 Afghanistan  2000   2666   20595360
#> 3 Brazil       1999  37737  172006362
#> 4 Brazil       2000  80488  174504898
#> 5 China        1999 212258 1272915272
#> 6 China        2000 213766 1280428583

#> tabela 2 # A tibble: 12 x 4
#>   country      year type           count
#>   <chr>       <int> <chr>          <int>
#> 1 Afghanistan  1999 cases            745
#> 2 Afghanistan  1999 population  19987071
#> 3 Afghanistan  2000 cases           2666
#> 4 Afghanistan  2000 population  20595360
#> 5 Brazil       1999 cases          37737
#> 6 Brazil       1999 population 172006362
#> # … with 6 more rows

#> tabela 3 # A tibble: 6 x 3
#>   country      year rate             
#> * <chr>       <int> <chr>            
#> 1 Afghanistan  1999 745/19987071     
#> 2 Afghanistan  2000 2666/20595360    
#> 3 Brazil       1999 37737/172006362  
#> 4 Brazil       2000 80488/174504898  
#> 5 China        1999 212258/1272915272
#> 6 China        2000 213766/1280428583

#> tabela4A casos # A tibble: 3 x 3
#>   country     `1999` `2000`
#> * <chr>        <int>  <int>
#> 1 Afghanistan    745   2666
#> 2 Brazil       37737  80488
#> 3 China       212258 213766

#> tabela4B população # A tibble: 3 x 3
#>   country         `1999`     `2000`
#> * <chr>            <int>      <int>
#> 1 Afghanistan   19987071   20595360
#> 2 Brazil       172006362  174504898
#> 3 China       1272915272 1280428583
```

Os dois problemas mais comuns com bancos de dados não arrumados são:

1. Uma variável pode estar espalhada por várias colunas

2. Uma observação pode estar espalhada por várias linhas

Para solucionar esses dois problemas comuns, utilizaremos o pacote `tidyr` e seus dois principais verbos: `gather()` e `spread()`. 

# Reunir

`gather()` reúne duas ou mais colunas que representam a mesma variável. O resultado é um banco de dados mais vertical, com um número menor de colunas, e com colunas que representam, cada uma, uma variável diferente.

```
magick::image_read(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/tidy_gather.png"
) %>% magick::image_scale("640") %>% print()
```

A função `gather()` requer três parâmetros:

1. O conjunto de colunas que deve ser reunido (variáveis)

2. O nome da variável a ser criada (chave)

3. O nome da variável cujos valores estão espalhados (valores)

Os parâmetros são informados segundo a seguinte sintaxe:

```
tabela %>% gather(variavel1, variavel2, key = "chave", value = "valores")
```

Assim:

```
pinguins1 <- penguins %>% 
  mutate(id = row_number()) %>% # Adicionar uma chave primária
  gather(bill_length_mm, bill_depth_mm, # Reunir colunas
         key = "bico", value = "medidas"
  ) %>% 
  select(id, species, island, sex, body_mass_g, bico, medidas) # Selecionar colunas
```

## pivot_longer

Versões mais recentes do 'tidyr' vêm substituindo gradativamente a função 'gather()' pela função 'pivot_longer()', conforme o exemplo abaixo:

```
pinguins_longer <- palmerpenguins::penguins %>%
  mutate(id = row_number()) %>% # Adicionar Chave Primária
  tidyr::pivot_longer(cols=c("bill_length_mm", "bill_depth_mm"), names_to = "bico", values_to = "medidas")
```

# Espalhar

`spread()` espalha duas ou mais colunas que representam variáveis diferentes e encontram-se reunidas. O resultado é um banco de dados mais horizontal, com um número maior de colunas, e com colunas que representam, cada uma, uma variável diferente.

```
magick::image_read(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/tidy_spread.png"
) %>% magick::image_scale("640") %>% print()
```

A função `spread()` requer dois parâmetros:

1. A coluna que contém os nomes das variáveis a serem criadas (chave)

2. A coluna que contém os valores das variáveis (valores)

Os parâmetros são informados segundo a seguinte sintaxe:

```
tabela %>% spread(chave, valores)
```

Assim:

```
pinguins2 <- pinguins1 %>% 
  spread(
    bico, medidas # Espalhar colunas
    ) 
```

## pivot_wider

Versões mais recentes do 'tidyr' vêm substituindo gradativamente a função 'spread()' pela função 'pivot_wider()', conforme o exemplo abaixo:

```
pinguins_wider <- pinguins_longer %>%
  tidyr::pivot_wider(names_from = bico, values_from = medidas)
```

# Unir

`unite()` combina várias colunas em uma única.

```
magick::image_read(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/tidy_unite.png"
) %>% magick::image_scale("640") %>% print()
```

A função `unite()` requer até três parâmetros:

1. A nova coluna resultante da união das variáveis selecionadas

2. As variáveis a serem unidas

3. O separador, se houver (parâmetro opcional)

Os parâmetros são informados segundo a seguinte sintaxe:

```
tabela %>% unite(coluna, variavel1, variavel2, sep = "")
```

Assim:

```
pinguins3 <- penguins %>% 
  mutate(id = row_number()) %>% # Adicionar uma chave primária
  unite(bico, bill_length_mm, bill_depth_mm, # Unir colunas
         sep = "/"
  ) %>% 
  select(id, species, island, sex, body_mass_g, bico) # Selecionar colunas
```

# Separar

`separate()` separa uma coluna em duas ou mais.

```
magick::image_read(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/tidy_separate.png"
) %>% magick::image_scale("640") %>% print()
```

A função `separate()` requer até três parâmetros:

1. A variável a ser separada

2. As novas colunas resultantes da separação da variável selecionada

3. O separador, se houver (parâmetro opcional)

Os parâmetros são informados segundo a seguinte sintaxe:

```
tabela %>% separate(coluna, into = c("variavel1", "variavel2"), sep = "")
```

Assim:

```
pinguins4 <- pinguins3 %>% 
  separate(bico, c("comprimento (mm)", "largura (mm)"), # Separar colunas
        sep = "/"
  ) %>% 
  select(id, species, island, sex, body_mass_g, 
         `comprimento (mm)`, `largura (mm)`) # Selecionar colunas
```


Vamos agora fazer alguns exercícios?

# EXERCÍCIO 1

Considere o conjunto de dados abaixo:

```
representatividade_2018 <- read.csv(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/representatividade_2018.csv")
```

Arrume os dados de modo a tornar a estrutura do banco *tidy*.

DICA: Mantenha três colunas na tabela e transforme negros_pardos e mulheres em uma só variável.


# EXERCÍCIO 2

Considere o conjunto de dados abaixo:

```
bbb21_mensagens <- read.csv(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/bbb21_mensagens.csv")
```

A coluna métricas possui dois valores associados na mesma célula. Transforme esses dois valores em duas variáveis diferentes, considerando o primeiro valor como de RTs recebidos por um determinado *tweet*, e o segundo valor como o de vezes em que esse mesmo *tweet* foi favoritado.

