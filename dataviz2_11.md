---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Correlação de Pearson e Regressão Linear
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
        content: Visualização de Dados 2
        url: '/dataviz2_10'
    next:
        content: Mapas Coropléticos
        url: '/dataviz2_12'

---

<div style="position: relative; width: 100%; height: 0; padding-top: 56.2500%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAHKtuw_qIA/zhQO2UMjmA08Wu-mZKO5_Q/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>

# Correlação de Pearson

As principais funções para calcular a correlação de Pearson entre duas variáveis numéricas são `cor()` e `cor.test()`, ambas do R Base.

```
library(palmerpenguins)
library(dplyr)
library(ggplot2)

pinguins <- penguins %>% tidyr::drop_na()

cor(pinguins$flipper_length_mm, pinguins$body_mass_g, method = "pearson")

pinguins %>% 
  summarise(correlacao = cor(flipper_length_mm, body_mass_g, method = "pearson"))

cor.test(pinguins$flipper_length_mm, pinguins$body_mass_g, method = "pearson")
```

Em `cor.test()`, observar:

* **Coeficiente de correlação (r)**: mede a força e a direção da associação entre duas variáveis.
  
* **p-valor**: indica a probabilidade de observar o resultado obtido caso a hipótese nula seja verdadeira. Um p-valor muito pequeno indica que seria muito improvável observar uma correlação tão forte apenas por acaso.
  
* **Intervalo de confiança**: faixa de valores plausíveis para o parâmetro estimado na população.
  
* **Estatística t**: mede o quanto o resultado observado se afasta do valor esperado sob a hipótese nula. Quanto mais alto, mais estatisticamente significativa a correlação também.
  
* **df (graus de liberdade)**: quantidade de informação independente disponível para estimar o teste estatístico. Quanto maior o df, maior a quantidade de dados sustentando o teste; isso torna a estimativa mais estável e o teste mais confiável.

# Regressão Linear

```
pinguins <- penguins %>% tidyr::drop_na()
```

# Matriz de Correlação

Para gerar uma visualização de matriz de correlação, instale o pacote `corrplot`.

```
library(corrplot)

pinguins <- penguins %>%
  select(flipper_length_mm, body_mass_g, bill_length_mm, bill_depth_mm) %>%
  drop_na()

corrplot(cor(pinguins))
```

# Customizando os Títulos do Gráfico

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  labs(title = "Um título bem bonito", 
       subtitle = "Seguido de um subtítulo",
       x = "O eixo X",
       y = "O eixo Y",
       caption = "A sua legenda")
```

# Customizando o Fundo

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme(panel.background = element_rect(fill="white", colour="red"))
```

# Customizando os Eixos do Gráfico

* Redefinindo as escalas

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  ylim(0,300) +
  xlim(0,6500)
```

* Rotacionando os rótulos dos eixos

```
p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
```

* Prevenindo notação científica

```
p + scale_y_continuous(labels = ~ format(., scientific = FALSE))

p + scale_x_continuous(labels = ~ format(., scientific = FALSE))
```

* Alterando as fontes e tamanhos do título e subtítulo

```
p + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.text = element_text(size = 14), plot.title = element_text(family="Times New Roman", size=14), plot.subtitle = element_text(family="Times New Roman", size=14))
```

* Centralizando título

```
p + theme(plot.title = element_text(hjust=0.5))
```


# Indicando os Valores

```
pinguins %>%
  filter(species == "Adelie") %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  geom_text(aes(label = body_mass_g, x = body_mass_g, y = flipper_length_mm), 
            color = "#000000", size = 2, hjust = -1, vjust = 0)
```

* DICA: Outras customizações em: https://www.r-graph-gallery.com/


# Customizando as Cores do Gráfico

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  scale_color_manual(values=c("black", "red", "yellow"))

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = sex), stat = "identity") +
  coord_flip() +
  scale_fill_manual(values=c("black", "red"))

RColorBrewer::display.brewer.all()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  scale_colour_brewer(palette = "Dark2", direction = 1)

pinguins %>% 
  ggplot() +
  geom_bar(aes(x = sex, y = body_mass_g, fill = sex), stat = "identity") +
  coord_flip() +
  scale_fill_brewer(palette = "Set2", direction = 1)
```

# Customizando o Tema

```
pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_bw()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_classic()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_dark()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_light()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_minimal()

pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  theme_void()
```

# Gráficos Interativos

Você também pode criar gráficos interativos no R. Para isso, vamos usar os seguintes pacotes:

```
#install.packages("ggplot2")
#install.packages("plotly")
library(ggplot2)
library(plotly)
library(dplyr)
library(palmerpenguins)
```

* *Scatterplot* Interativo

```
grafico1 <- pinguins %>% 
  ggplot() +
  geom_point(aes(x = body_mass_g, y = flipper_length_mm, color = species))

ggplotly(grafico1)
```

* *Lineplot* Interativo

```
grafico2 <- pinguins %>% 
  count(year, species) %>% 
  ggplot() +
  geom_line(aes(x = year, y = n, group = species, color = species))

ggplotly(grafico2)
```

* *Boxplot* Interativo

```
grafico3 <- pinguins %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y = body_mass_g))

ggplotly(grafico3)
```

* *Barplot* Interativo

```
grafico4 <- pinguins %>% 
  ggplot() +
  geom_bar(aes(x = island), stat = "count")

ggplotly(grafico4)
```

