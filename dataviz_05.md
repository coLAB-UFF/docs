---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: zeeschuimer
description: Curso de raspagem de dados das mídias sociais

# Author box
author:
    title: DDoS Lab
    title_url: 'https://colab-uff.github.io/ddoslab/'
    external_url: true
    description: Laboratório de Combate à Desinformação e ao Discurso de Ódio em Sistemas de Comunicação em Rede

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Manipulação de Dados 1
        url: '/zeeschuimer_03'
    next:
        content: Visualização de Dados
        url: '/zeeschuimer_05'
---

# Limpando a Base de Dados

Os chats do WhatsApp trazem informações referentes à criação dos grupos, ingresso e remoção dos usuários. Essas mensagens são alertas do sistema e não devem ser confundidas com posts de usuários. Por isso, um passo inicial importante no tratamento das bases de dados do WhatsApp é limpar essas mensagens. O modo mais fácil de tratar a base é remover as mensagens sem emissor definido. Quando a variável `author` está vazia, isso significa que não se trata de um post no grupo.

Para remover essas mensagens, vamos utilizar a função `drop_na()`, que é proveniente do pacote `tidyr`, também integrante do Tidyverse.

```
grupo_limpo <- grupo_rstats %>%
  tidyr::drop_na(author)
```


# Separando Data e Hora

Os chats trazem informação sobre data e horário da publicação das mensagens. O formato da base é `aaaa-mm-dd hh:mm:ss`, mas, para muitas operações, o ideal é descartarmos horas, minutos e segundos. Por isso, eventualmente, pode ser importante criarmos uma segunda variável derivada que informe apenas o dia de publicação. Para isso, o pacote `lubridate` pode ser muito útil.

```
grupo_horario <- grupo_rstats %>%
  mutate(dia = lubridate::date(time))
```

Uma utilidade desta operação, por exemplo, é contar a frequência diária de publicação de mensagens. Nós podemos descobrir quantas mensagens são enviadas por dia utilizando a função `count()`.

```
grupo_horario <- grupo_rstats %>%
  mutate(dia = lubridate::date(time)) %>% 
  count(dia)
```


## EXERCÍCIO

Como seria se eu quisesse descobrir o dia em que houve o maior número de publicação de mensagens?

E você conseguiria acrescentar uma coluna indicando a média na publicação diária de mensagens ao lado do valor daquele dia em específico?


# Filtrando a Base de Dados por Períodos Específicos

Em algumas ocasiões pode ser necessário filtrar a base de dados por um período específico no tempo. Para isso, utilize a função `between`, do pacote `dplyr`.

```
grupo_horario2 <- grupo_horario %>% 
  filter(between(dia, as.Date("2021-02-01"), as.Date("2021-02-28")))
```


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
 
 
 # Contando os Emojis

A coluna de *emojis* isola da variável *text* todos os emojis utilizados na mensagem. Entretanto, esta coluna pode apresentar mais de um emoji simultaneamente. Por isso, ao tentar contabilizar a frequência de uso de emojis na base de dados, uma mensagem com 😊 seria contabilizada de forma distinta de 😊😂, apesar de ambas conterem o mesmo emoji.

Para separar cada emoji individualmente, é necessário utilizar a função `unnest()`, do pacote `tidyr`.


```
grupo_rstats %>%
  tidyr::unnest(emoji) %>%
  count(emoji) %>% 
  arrange(desc(n))
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

E, em seguida, indique o vetor a ser anonimizado. Uma boa opção é utilizar o algoritmo de criptografia md5.

```
grupo_rstats$author2 <- grupo_rstats$author %>% anonymizer::hash(.algo = "md5")
```
