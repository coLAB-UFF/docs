---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Manipulação de Dados 1
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
        content: Estatísticas Descritvas
        url: '/dataviz_04'
    next:
        content: Manipulação de Dados 2
        url: '/dataviz_06'
---

# dplyr

O `dplyr` é um dos pacotes do Tidyverse e é voltado especificamente para o trabalho de manipulação de dados.

## Instalação e Requisição do Pacote dplyr

```
install.packages("dplyr")

library(dplyr)
```

Opcionalmente, podemos instalar de uma só vez todos os pacotes contidos no `tidyverse`, que incluem, entre outros, o `dplyr`, o `tidyr`, o `ggplot2` e o `magrittr`.

```
install.packages("tidyverse")

library(tidyverse)
```

O `dplyr` se estrutura em torno de um conjunto de verbos, que operam como funções para a manipulação de grandes bancos de dados. Vamos conhecer os principais verbos!

## select()

A função `select()` seleciona uma ou mais colunas de um *dataframe*. É utilizada para reduzir o tamanho da base de dados que estamos manipulando. Por exemplo, vamos supor que, no *dataframe* que criamos anteriormente, `dados_aves`, não precisemos lidar com dados de extensão das nadadeiras ou massa corporal dos pinguins; queremos apenas saber a espécie, o local de habitação e o sexo. Vamos selecionar somente essas colunas?

```
select(dados_aves, species, island, sex) # O primeiro parâmetro é o dataframe, os demais são as colunas
```

## O pipe (%>%)

O dplyr possui uma sintaxe que facilita o trabalho e permite concatenar vários comandos dentro de uma só expressão. Para isso, vamos conhecer um pouquinho o "pipe" (ou `%>%`). O pipe é um operador que foi criado originalmente para o pacote `magritrr`. No dplyr, ele permite que você indique primeiro o banco de dados e depois estruture suas funções de modo encadeado. O mesmo comando anterior ficaria assim:

```
dados_aves %>% select(species, island, sex)
```

Se eu quiser dispor desse resultado em um novo *dataframe*:

```
dados_aves_resumido <- dados_aves %>% 
  select(species, island, sex)
```

Não se assuste: você pode digitar o pipe de forma simples com `CTRL+SHIFT+M`.

Um exemplo de Hadley Wickham de que gosto muito:

* Pense numa receita que tenha as seguintes instruções: junte os igredientes, misture e leve ao forno. Na forma usual do R, tais instruções provavelmente teriam a seguinte sintaxe:
  
```
forno(misture(junte(ingredientes)))
```

* Note que temos que pensar "de dentro para fora". O primeiro comando que lemos é forno que, na verdade, é a última operação que será realizada! Com o operador pipe, por outro lado, você escreveria algo mais ou menos assim:
  
```
ingredientes %>% junte %>% misture %>% forno
```

* É quase igual a ler instruções verbais da receita. Parece mais intuitivo, não?

Vamos voltar agora a aprender outros verbos do `dplyr`...

## filter()

A função `filter()` filtra um *dataframe* com vetores lógicos. Em outras palavras, deixa apenas as linhas que satisfazem a certo critério. Por exemplo: suponhamos que queiramos manter em nosso *dataframe* apenas os pinguins de sexo feminino e encontrados na ilha de Torgersen. Que comando executamos?

```
filter(dados_aves, sex == "female", island == "Torgersen") 
```

Ou, usando o `%>%`:

```
dados_aves %>% filter(sex == "female", island == "Torgersen")
```

Posso usar `filter()` e `select()` na mesma expressão? **SIM!** Basta encadear os `%>%`:

```
dados_aves_resumido <- dados_aves %>% 
  select(species, island, sex) %>% 
  filter(sex == "female", island == "Torgersen")
```

## mutate()

A função `mutate()` cria uma nova coluna com base nos parâmetros indicados. Por exemplo, vamos criar uma nova coluna com um operador lógico no nosso *dataframe* original `dados_aves` para indicar se a ave é grande ou não. Sempre que o espécime pesar mais de 4kg ele será classificado como "grande". Adicionalmente, a massa corporal das aves está descrita em gramas (g) e nós gostaríamos de transpor esse valor para kg. Como fazemos?

```
dados_aves_massa <- dados_aves %>% 
  mutate(massa_kg = body_mass_g/1000) %>% # Transpor de g para kg
  mutate(especime_grande = massa_kg > 4) %>%  # Verificar através de um operador lógico todos os espécimes acima de 4kg
  select(species, body_mass_g, massa_kg, especime_grande)
```

## arrange()

A função `arrange()` orderna o *dataframe* com base em uma coluna. Por exemplo, nós gostaríamos de ordenar o dataframe que criamos no exercício anterior com base na coluna massa_kg. Assim, podemos ver quais os espécimes mais pesados.

```
dados_aves_massa <- dados_aves_massa %>% 
  arrange(massa_kg) # Do mais leve ao mais pesado

dados_aves_massa <- dados_aves_massa %>% 
  arrange(desc(massa_kg)) # Do mais pesado ao mais leve
```

Você notou que há dois pinguins sem informação de massa corporal? Vamos subtrai-los de nossos dados?

```
dados_aves_massa <- dados_aves_massa %>% 
  arrange(desc(massa_kg)) %>% # Do mais pesado ao mais leve
  tidyr::drop_na()  # Estamos chamando uma função que não está presente no pacote dplyr
                    # Por isso é necessário primeiro instalar o pacote tidyr se você ainda
                    # não tiver feito isso...
```

## group_by()

Esta função agrupa um *dataframe* segundo um vetor de categorias. “Agrupar” aqui quer dizer que todas as operações subsequentes serão feitas separadas por grupos. 

## summarise() ou reframe()

Esta função transforma um vetor com vários números em um único número de acordo com uma função.

Geralmente os verbos `group_by()` e `summarise()` aparecem combinados entre si em uma expressão sequencial. Por exemplo, qual a espécie de pinguim com maior média de massa corporal?

```
dados_aves_especies <- dados_aves_massa %>% 
  group_by(species) %>% 
  summarise(media = mean(massa_kg))
```

Obs.: A função `summarise()` está deprecada, isto é, obsoleta. Ela vem sendo gradualmente substituída pela função `reframe()`. 

## count()

Um outro verbo muito útil para tratamento e manipulação de dados é o `count()`. O resultado de `count()` é geralmente uma outra tabela, com informações sobre a contagem. A coluna n expressa os valores da contagem.

Vamos tentar descobrir quantos pinguins têm massa corporal superior a 4kg em toda a nossa amostra?

```
dados_aves %>% 
  filter(body_mass_g > 4000) %>% 
  count()
```

E quantos pinguins têm massa corporal inferior a 4kg?

```
dados_aves %>% 
  filter(body_mass_g < 4000) %>% 
  count()
```

E qual a média da massa corporal dos pinguins na nossa amostra?

```
dados_aves %>% 
  tidyr::drop_na() %>% 
  reframe(media = mean(body_mass_g))
```

Vamos fazer exercícios com outro conjunto de dados agora??


## EXERCÍCIO 1

* Considere os dados do IBGE sobre a população brasileira em 2022.

```
install.packages("devtools")
devtools::install_github("tbrugz/ribge")
populacao2022 <- ribge::populacao_municipios(2022)
```

1. Quais os cinco municípios com maior população no estado do Rio de Janeiro?
   
2. Qual a média populacional dos municípios do Rio de Janeiro?
   
3. Quantos municípios do Rio de Janeiro estão acima dessa média?

## EXERCÍCIO 2

* Considere os dados oficiais do TSE a respeito dos candidatos ao cargo de deputado federal nas eleições de 2022.

```
install.packages("electionsBR")
candidato_brasil <- electionsBR::elections_tse(2022, type = "candidate") %>% filter(DS_CARGO == "DEPUTADO FEDERAL")
```

1. Crie uma tabela somente com os dados dos nomes dos candidatos na urna, siglas dos partidos, estado por que se candidataram, estado em que nasceram, idade, sexo, raça e grau de instrução, nessa ordem.
   
2. Quais partidos têm mais pretos ou pardos como candidatos?

3. Quais partidos têm mais mulheres como candidatas?

4. Quais partidos têm mais mulheres pretas como candidatas?

5. Quantos e quais candidatos se candidataram por um estado diferente daquele que nasceram?

