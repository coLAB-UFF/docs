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


# Filtrando a Base de Dados por Períodos Específicos

Em algumas ocasiões pode ser necessário filtrar a base de dados por um período específico no tempo. Para isso, utilize a função `between`, do pacote `dplyr`. Vamos descobrir, por exemplo, quem são os candidatos jovens que disputaram as últimas eleições?

```
candidato_brasil %>% mutate(DT_NASCIMENTO = lubridate::dmy(DT_NASCIMENTO)) %>%
  filter(between(DT_NASCIMENTO, lubridate::as_date("1980-01-01"), lubridate::as_date("2000-01-01")))
```

# Buscando por Palavras-Chaves

Caso seja necessário filtrar a base de dados por palavras ou expressões no corpo do texto das mensagens, utilize a função `grepl()` do R Base. A função comporta sintaxe em Regex. Mas, para efeito de simplificação, pesquisaremos apenas por operadores mais simples. Que tal descobrirmos quais candidatos e candidatas têm João, José ou Maria no nome?

```
candidato_brasil %>% 
  filter(grepl("JO[ÃO|OANA]|JOSÉ|MARIA", NM_CANDIDATO))
```

# Alterando o Texto de Algumas Strings

Para realizar algumas padronizações no banco de dados, pode ser importante uniformizar algumas *strings*. Uma operação que permite realizar essas alterações é substituir e alterar o texto com a função `gsub`.

```
candidato_brasil %>% 
  filter(DS_OCUPACAO == "JORNALISTA E REDATOR") %>% 
  mutate(DS_OCUPACAO = gsub("JORNALISTA E REDATOR", "JORNALISTA", DS_OCUPACAO))
```

# Criando uma Variável Categórica a partir de Outra

É possível recodificar uma variável com novos valores e categorias. Para isso, utilize, mais uma vez, a função `grepl()`, e combine-a com a função `case_when()` do pacote `dplyr`.

```
candidato_brasil %>%
  mutate(
    IDEOLOGIA = case_when(
      grepl("PP", SG_PARTIDO) ~ "DIREITA",
      grepl("REPUBLICANOS", SG_PARTIDO) ~ "DIREITA",
      grepl("UNIÃO", SG_PARTIDO) ~ "DIREITA",
      grepl("PL", SG_PARTIDO) ~ "DIREITA",
      grepl("PSC", SG_PARTIDO) ~ "DIREITA",
      grepl("PATRIOTA", SG_PARTIDO) ~ "DIREITA",
      grepl("PT", SG_PARTIDO) ~ "ESQUERDA",
      grepl("PSB", SG_PARTIDO) ~ "ESQUERDA",
      grepl("PCO", SG_PARTIDO) ~ "ESQUERDA",
      grepl("PC do B", SG_PARTIDO) ~ "ESQUERDA",
      grepl("REDE", SG_PARTIDO) ~ "ESQUERDA",
      T ~ "OUTRO"))
 ```

# Anonimizando os Sujeitos

Para anonimizar os sujeitos de seu banco de dados, é necessário utilizar um pacote adicional de criptografia. Uma sugestão é o pacote `anonymizer`, desenvolvido por Paul Hendricks. Utilize o seguinte comando para instalar o pacote:

```
remotes::install_github("paulhendricks/anonymizer")
```

E, em seguida, indique o vetor a ser anonimizado. Uma boa opção é utilizar o algoritmo de criptografia md5.

```
candidato_brasil$NM_ANONIMO <- candidato_brasil$NM_CANDIDATO %>% anonymizer::hash(.algo = "md5")
```

# Manipulando *strings*

Muitas vezes, os valores dispostos em nosso banco de dados se apresentam como variáveis de texto (strings). Algumas dessas variáveis textuais precisam ser remodeladas ou transformadas, a fim de facilitar nossa interpretação.

Vamos aprender algumas funções de manipulação de strings a seguir.

1. Convertendo strings em minúsculas e em maiúsculas:

* str_to_upper

```
pinguins5 <- pinguins1 %>% 
  mutate(maiuscula = str_to_upper(island))
```

* str_to_lower

```
pinguins6 <- pinguins5 %>% 
  mutate(minuscula = str_to_lower(species))
```

* str_to_title

```
pinguins7 <- pinguins6 %>% 
  mutate(titulo = str_to_title(sex))
```

2. Detectando padrões textuais em um vetor de strings

```
pinguins7 <- pinguins7 %>% 
  mutate(string_teste = sex)

pinguins7$string_teste <- pinguins7$string_teste %>% 
  str_detect("ale")
```

3. Substituindo padrões textuais em um vetor de strings

```
pinguins7$sex <- pinguins7$sex %>% 
  str_replace("female", "fêmea") %>% 
  str_replace("male", "macho")
```


  
