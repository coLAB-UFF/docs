---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Mapas Coropléticos
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
        url: '/dataviz_10'

---

# Percepção Gráfica

Os gráficos plotados por meio do `ggplot2` podem ser customizados em muitos níveis. Vejamos abaixo algumas possibilidades.

# Solicitar pacotes

```
#install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(palmerpenguins)
library(RColorBrewer)
```

# Importando os dados

```
pinguins <- penguins %>% tidyr::drop_na()
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

