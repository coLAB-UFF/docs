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
        content: Manipulação de Dados 1
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

## summarise()

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
  summarise(media = mean(body_mass_g))
```

Vamos fazer exercícios com outro conjunto de dados agora??


# EXERCÍCIO

Com base nos dados disponíveis no gitHUB e exportados do WhatsApp, disponíveis no seguinte [link](https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula8/Conversa%20do%20WhatsApp%20com%20Rstats.txt), 

1. Monte uma tabela indicando que são os usuários que mais enviam mensagens para o grupo.

2. Monte uma tabela indicando quais são os emojis mais utilizados em mensagens.




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
