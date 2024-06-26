---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Visualização de Dados 1
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
        content: Manipulação de Dados 4
        url: '/dataviz_08'
    next:
        content: Visualização de Dados 2
        url: '/dataviz_10'

---

# Introdução ao GGplot2

O `ggplot2` é um pacote desenvolvido em 2005 por Hadley Wickham e sua equipe. Foi o primeiro pacote do núcleo central do Tidyverse e desenvolvido antes dos demais pacotes.

O `ggplot2` é uma gramática para construção de gráficos e é estruturado a partir de um layout de camadas. As funções do `ggplot2` estipulam um sistema de coordenadas e adicionam camadas que se superpõem em mapeamentos estéticos.

As camadas são agregadas a partir de um símbolo que funciona como um pipe (`+`). Mas o ggplot2 é anterior ao `magrittr` e ao `dplyr`, por isso, usa-se o + em vez do `%>%`.

Como é a sintaxe geral da função?

```
ggplot(<dataset>) +
<geom_function>(aes(<mapping>))
```

`<dataset>` é o conjunto de dados a ser trabalhado, `<geom_function>` é a função definidora do tipo de gráfico, e <mapping> é a função de mapeamento estético do gráfico.

É possível também escrever a função desta forma, combinando `dplyr` e `ggplot2`:

```
dataset %>% 
 ggplot(aes(x = <x>, y = <y>)) +
 <geom_function>(<params>)
```

Há diferentes tipos de geom. Vamos começar com os gráficos de dispersão?

# Solicitar pacotes

```
#install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(palmerpenguins)
```

# geom_point()

`geom_point`: Este geom corresponde a um gráfico de dispersão (ou *scatterplot*). O *scatterplot* é uma visualização que apresenta múltiplas ocorrências de dados organizados a partir de duas variáveis numéricas e sequenciais.

Exemplo: vamos construir um *scatterplot* com nossos pinguins.

```
pinguins <- penguins %>% tidyr::drop_na()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm))
```

O que este primeiro gráfico nos diz?

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_smooth(aes(x = body_mass_g, y = flipper_length_mm))
```

Vamos acrescentar um novo parâmetro, as espécies dos pinguins. Que tal distinguirmos as espécies por cor? Note que a cor pode corresponder a uma constante ou a uma variável categórica

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm), color = "blue")
  # O parâmetro color está fora de aes nesse caso!

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species))
  # O parâmetro color está dentro de aes nesse caso!
```

E o que é possível observar a partir do gráfico acima?

E quanto à altura (*depth*) e ao comprimento (*lenght*) do bico dos pinguins? Que conclusões podemos tirar desse novo gráfico abaixo?

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = species))
```

Nós também podemos atribuir um tamanho variável aos pontos:

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = species, size = species))
```

Ou podemos trabalhar com pontos diferentes, de acordo com as categorias:

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species))
```

Ou controlar a transparência dos pontos, para adicionar uma quarta variável ao gráfico:

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = species, alpha = island))
```

O próximo passo é tentar condensar essas informações, que estão dispersas, em outro tipo de gráfico.


# geom_bar()

`geom_bar`: Este objeto geométrico corresponde a um gráfico de barras na sintaxe do `ggplot2`. O gráfico de barras condensa a informação dispersa em pontos no gráfico de dispersão, e apresenta uma informação geral e não detalhada sobre os dados. Sua composição requer uma variável categórica e uma variável numérica (que pode ser simplesmente a quantidade).

Exemplo: quantos pinguins temos em nosso banco de dados de acordo com o seu sexo?

```
pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex))
  # Há apenas um eixo X no gráfico, pois o ggplot2 conta as ocorrências
  # para criar o eixo Y.
```

No `geom_bar`, há duas formas de estatísticas mais usadas. A primeira delas é o `count`. Nesse caso, a própria função vai contar as ocorrências para gerar o gráfico. No segundo caso, a variável numérica já está presente no meu conjunto de dados. Então, a estatísticas mais apropriada é `identity`.

```
pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex), stat = "count")

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g), stat = "identity")
```

É possível realizar ajustes de customização no mapeamento estético de nossos gráficos.

```
pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = sex), stat = "identity") +
  coord_flip()
  # Inverter as coordenadas X e Y

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g), stat = "identity", fill = "blue")
  # Definir uma única cor estática (parâmetro fill é externo a aes)

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = sex), stat = "identity")
  # Definir uma cor de acordo com uma variável categórica (parâmetro fill
  # é interno a aes)

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity")
  # Empilhar (stack) valores de acordo com uma terceira variável categórica.
```

Em `geom_bar`, o empilhamento pode ser realizado de múltiplas formas. É possível utilizar também o parâmetro `position` para definir a forma mais apropriada para esta operação. Observe:

```
pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity")
  # Empilhamento simples

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity", position = "identity")
  # Sobreposição de pilhas (pouco útil)

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity", position = "dodge")
  # Alinhamento lateral de pilhas

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity", position = "fill")
  # Empilhamento à mesma altura

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = species), stat = "identity") +
  facet_wrap(~species)
# Apresentação segmentada por categoria
```

# piechart

O `ggplot2` não possui um geom específico para gráficos de pizza. Mas ele introduz a função `coord_polar()`, que permite criar uma espécie de gráfico polar com barras que se convertem em pizza.

```
pinguins %>% 
  ggplot() +
  geom_bar(aes(x = "", y = sex, fill = sex), stat="identity", width=1) +
  coord_polar("y", start=0)

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = "", y = species, fill = species), stat="identity", width=1) +
  coord_polar("y", start=0)
```

# geom_line()

`geom_line`: O `geom_line` corresponde ao gráfico de linha simples. Para utilizá-lo, é preciso haver duas variáveis numéricas e sequenciais a serem relacionadas. Geralmente, é empregado para visualizar flutuações ao longo do tempo, mas não apenas.

* Importando os dados

```
pinguins <- penguins %>% tidyr::drop_na()
```

* Gerando um gráfico de linha simples com stat_count

```
pinguins %>% 
  ggplot() +
  geom_line(aes(x = year), stat = "count")
```

* Gerando um gráfico de linha simples com `stat_identity`

```
pinguins %>% 
  count(year) %>% 
  ggplot() +
  geom_line(aes(x = year, y = n), stat = "identity")
```

* Gerando um gráfico de linha agrupado

```
pinguins %>% 
  count(year, species) %>% 
  ggplot() +
  geom_line(aes(x = year, y = n, group = species, color = species))
```

# geom_area()

`geom_area`: Este *geom* funciona de modo similar ao `geom_line`, mas, ao invés de uma linha, ele plota uma área sólida. Além disso, é possível também empilhar as áreas.

* Gerando um gráfico de área simples

```
pinguins %>% 
  count(year) %>% 
  ggplot() +
  geom_area(aes(x = year, y = n))
```

* Gerando um gráfico de área empilhada

```
pinguins %>% 
  count(year, species) %>% 
  ggplot() +
  geom_area(aes(x = year, y = n, fill = species, color = species))
```

* Gerando um gráfico de área segmentado por facetas (*small multiples*)

```
pinguins %>% 
  count(year, species) %>% 
  ggplot() +
  geom_area(aes(x = year, y = n, fill = species, color = species)) +
  facet_wrap(~species)
```

# geom_histogram()

`geom_histogram`: O `geom_histogram` apresenta uma visualização gráfica em que uma variável numérica e sequencial tem sua frequência calculada.

* Gerando um histograma simples

```
pinguins %>% 
  ggplot() +
  geom_histogram(aes(x = body_mass_g), binwidth = 100)
```

* Gerando um histograma segmentado por facetas

```
pinguins %>% 
  ggplot() +
  geom_histogram(aes(x = body_mass_g, fill = species), binwidth = 100) +
  facet_wrap(~species)
```

# geom_tile()

`geom_tile`: Este *geom* apresenta um mapa de calor (*heatmap*) a partir do cruzamento entre duas variáveis categóricas com uma terceira variável numérica sequencial.

* Gerando um mapa de calor

```
pinguins %>% 
  select(species, sex, body_mass_g) %>% 
  ggplot() +
  geom_tile(aes(x = species, y = sex, fill = body_mass_g))
```

# geom_boxplot()

`geom_boxplot`: Este objeto geométrico corresponde a um gráfico de caixa e bigode na sintaxe do `ggplot2`. O gráfico de caixa sintetiza um conjunto importante de informações em uma visualização extremamente condensada. É o tipo de gráfico mais comum para comparar diferentes grupos de observações. O *boxplot* pode ser utilizado para comparar duas variáveis numéricas ou uma variável numérica e uma categórica.

```
magick::image_read("https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula10/boxplot_explanation.png") %>% 
  magick::image_scale("500") %>% print()
```

No esquema visual acima, note que a caixa organiza e divide quatro áreas do gráfico. No fio abaixo da caixa, estão representadas 25% das ocorrências com menor valor. No fio acima da caixa, estão as 25% ocorrências com maior valor. A caixa é dividida pela mediana, isto é, o valor central em um conjunto de dados.

Vamos praticar?

```
pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g))
```

O *boxplot* acima é bem simples e compara uma variável categórica (*sex*) com uma variável numérica (*body_mass_g*). Vamos incrementar este gráfico com cores?

```
pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g), color = "red")

pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g, color = sex))

pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g, fill = sex), color = "red")
```

Vamos adicionar mais uma variável com *fill*?

```
pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g, fill = species))
```

E se quisermos olhar para as observações individuais?

```
pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g, fill = sex)) +
  geom_jitter(aes(x = sex, y = body_mass_g, color = species), size=0.4, alpha=0.9)

pinguins %>% 
  ggplot() +
  geom_violin(aes(x = sex, y = body_mass_g, fill = sex)) +
  geom_jitter(aes(x = sex, y = body_mass_g, color = species), size=0.5, alpha=0.9) 
```

# Exportando os gráficos

É possível exportar seus gráficos em diferentes formatos. Os mais comuns são em formato PDF e em formato PNG. Acesse o botão **Export** na área **Plots** do seu R Studio, para uma exportação facilitada. Depois, é só escolher a pasta onde o gráfico será salvo, o tamanho da imagem e salvar.


# EXERCÍCIOS

Para os exercícios a seguir, compartilhe no grupo da disciplina as imagens dos gráficos exportadas em formato PNG, e, somente com o professor, o seu *script* R utilizado para fazer os exercícios.

## EXERCÍCIO 1

1. Com base nos dados que você coletou na aula anterior, crie um gráfico de dispersão que apresente os RTs de cada *tweet* coletado e o número de seguidores do usuário que publicou o *tweet*.

## EXERCÍCIO 2

1. Com base nos dados que você coletou na aula anterior, crie um gráfico de barras que apresente os cinco idiomas (*lang*) mais comumente empregados em sua amostra.

Dica: Combine funções do `dplyr` com outra do `ggplot2`.

## EXERCÍCIO 3

1. Com base nos dados que você coletou na aula anterior, crie um gráfico de caixa que apresente os tweets que obtiveram acima de 100 *retweets* na sua amostra, categorizados de acordo com os principais dispositivos (*source*) utilizados por usuários para acessar o Twitter.

