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
        content: Manipulação de Dados 2
        url: '/dataviz_05'
    next:
        content: Visualização de Dados 2
        url: '/dataviz_07'

---


# Filtrando a Base de Dados por Períodos Específicos

Em algumas ocasiões pode ser necessário filtrar a base de dados por um período específico no tempo. Para isso, utilize a função `between`, do pacote `dplyr`.

```
grupo_horario2 <- grupo_horario %>% 
  filter(between(dia, as.Date("2021-02-01"), as.Date("2021-02-28")))
```

candidato_brasil %>% filter(between(DT_NASCIMENTO, as.Date("1960-02-01"), as.Date("1980-02-28")))


# Buscando por Palavras-Chaves

Caso seja necessário filtrar a base de dados por palavras ou expressões no corpo do texto das mensagens, utilize a função `grepl()` do R Base. A função comporta sintaxe em Regex. Mas, para efeito de simplificação, pesquisaremos apenas por operadores mais simples:

```
grupo_palavras <- grupo_rstats %>% 
  filter(grepl("alun[o|a]|professor",text))
```


# Uniformizando os Telefones

Para lidar com telefones de múltiplas procedências, é importante uniformizar esta variável. Uma operação que simplifica estes dados é suprimir espaços e hífens e tornar os telefones apenas uma sequência numérica simples.

```
grupo_telefones <- grupo_rstats %>% 
    mutate(telefone = author) %>%
    mutate(telefone = gsub("-", "", telefone)) %>% # Remove hífens do telefone
    mutate(telefone = gsub(" ", "", telefone))
```


# Distinguindo Telefones por DDI

É possível codificar os telefones de acordo com a sua origem, com base nos respectivos códigos de discagem direta à distância e código de discagem direta internacional. Para isso, utilize, mais uma vez, a função `grepl()`, e combine-a com a função `case_when()` do pacote `dplyr`.

```
grupo_internacional <- grupo_rstats %>%
  tidyr::drop_na(author) %>% 
  mutate(
    internacional = case_when(
      grepl("\\b+55", author) ~ "Brasil",
      grepl("viktor", author) ~ "Brasil",
      grepl("Manoela Mayrink", author) ~ "Brasil",
      grepl("Isis Lorena", author) ~ "Brasil",
      grepl("Jeferson UFF", author) ~ "Brasil",
      T ~ "Internacional")) %>% count(internacional)
 ```
 
 
 
 # Mergindo Mais de um Chat

Para mergir dois ou mais chats, utilize as funções `join()` do pacote `dplyr`. A função `full_join()` reúne as mensagens enviadas a diferentes *dataframes*.

```
fulldb <- grupo_rstats %>% 
  full_join(chat)
```
 

# MAIS EXERCÍCIOS

1. Forneça uma lista dos números de telefone que mais frequentemente enviaram mensagens ao grupo analisado.

2. Forneça uma lista especificando quantas vezes cada usuário no grupo mencionou a palavra *aula*.

3. Forneça uma lista especificando os dias em que cada usuário enviou mais mensagens ao grupo.

4. Forneça uma lista de quantas mensagens foram enviadas a cada grupo, considerando-se a base completa de dados.


# Anonimizando os Remetentes

Para anonimizar os remetentes, é necessário utilizar um pacote adicional de criptografia. Uma sugestão é o pacote `anonymizer`, desenvolvido por Paul Hendricks. Utilize o seguinte comando para instalar o pacote:

```
remotes::install_github("paulhendricks/anonymizer")
```

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
