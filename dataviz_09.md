---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Manipulação de Dados 2
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
        content: Manipulação de Dados 1
        url: '/dataviz_05'
    next:
        content: Manipulação de Dados 3
        url: '/dataviz_07'

---


# ggplot2

O `ggplot2` é um pacote desenvolvido em 2005 por Hadley Wickham e sua equipe. Foi o primeiro pacote do núcleo central do Tidyverse e desenvolvido antes dos demais pacotes.

O `ggplot2` é uma gramática para construção de gráficos e é estruturado a partir de um layout de camadas. As funções do `ggplot2` estipulam um sistema de coordenadas e adicionam camadas que se superpõem em mapeamentos estéticos. As camadas são agregadas a partir de um símbolo que funciona como um pipe (**+**). Mas o `ggplot2` é anterior ao `magrittr` e ao `dplyr`, por isso, usa-se o **+** em vez do **%>%**.

## Como é a sintaxe geral da função?

A sintaxe do `ggplot2` é bem simples, embora gráficos mais sofisticados exijam mais linhas de código. De forma resumida, porém, é possível criar um gráfico utilizando basicamente os seguintes comandos:

```
ggplot(<dataset>) +
<geom_function>(aes(<mapping>))
```

Onde <dataset> é o conjunto de dados a ser trabalhado, <geom_function> é a função definidora do tipo de gráfico, e <mapping> é a função de mapeamento estético do gráfico.

É possível também escrever a função desta forma, combinando `dplyr` e `ggplot2`:

```
dataset %>% 
ggplot(aes(x = <x>, y = <y>)) +
<geom_function>(<params>)
```
  
## geoms
  
Há diferentes tipos de geom. Vamos começar com os gráficos de dispersão?


### geom_bar()

`geom_bar`: Este objeto geométrico corresponde a um gráfico de barras na sintaxe do `ggplot2`.

Exemplo: quais os telefones que mais enviam mensagens ao grupo?
  
Repare que o código abaixo aproveita parte do que já fizemos antes e acrescenta uma nova camada referente ao desenvolvimento gráfico.
  
```
grupo_rstats %>% 
  count(author) %>% 
  tidyr::drop_na() %>% 
  ggplot() +
  geom_bar(aes(x = author, y = n), stat = "identity")
```
  
 Mas é possível customizar ainda mais o nosso gráfico:
  
 ```
grupo_rstats %>% 
  count(author) %>% 
  tidyr::drop_na() %>% 
  ggplot() +
  geom_bar(aes(x = reorder(author, n), y = n, fill = author), stat = "identity") +
  geom_text(aes(x = reorder(author, n), y = n, label=n), hjust = -.1) +
  coord_flip() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90)) +
  theme(legend.position = "none") +
  labs(x = "Telefones",
       y = "Frequência",
       title = "Mensagens enviadas no grupo de zap")
  ```
  
### geom_line()
  
`geom_line()`: Em algumas circunstâncias, um gráfico de linha simples pode ser preferível em relação a um gráfico de barras. É o caso, por exemplo, de séries históricas:
  
```
grupo_rstats %>%
  mutate(dia = lubridate::date(time)) %>% 
  count(dia) %>% 
  tidyr::drop_na() %>% 
  ggplot() +
  geom_line(aes(x = dia, y = n), color = "#FF0000")
```
  
### geom_bloxplot()

E que tal produzir um gráfico de caixa e bigode para exprimir a participação de cada usuário ao longo do curso, de acordo com o chat do WhatsApp da turma?
  
```
grupo_rstats %>%
  mutate(dia = lubridate::date(time)) %>% 
  count(dia, author) %>% 
  tidyr::drop_na(author) %>% 
  ggplot() +
  geom_boxplot(aes(x = dia, y = author))
```
  
O `ggplot2` possui ainda várias outras opções de gráficos e os dados do WhatsApp permitem diversos tipos de visualização ainda. Este é só o início. Que tal explorar um pouquinho mais com outros exercícios?
  
# MAIS EXERCÍCIOS
  
1. Construa um gráfico de barras para representar a frequência de mensagens enviadas a partir de telefones brasileiros e de telefones estrangeiros no grupo de WhatsApp que você está monitorando.
  
2. Construa um gráfico de barras para representar que emojis são os mais frequentemente enviados ao grupo de WhatsApp você está monitorando.

Outros exemplos e aplicações podem ser encontrados em: [https://github.com/JBGruber/rwhatsapp](https://github.com/JBGruber/rwhatsapp)

