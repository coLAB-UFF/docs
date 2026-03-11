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
        url: '/dataviz2_10'

---

# Mapas Coropléticos

Mapas são objetos poligonais. Para produzirmos um mapa coroplético, precisamos de uma variável georreferenciada, que indique as coordenadas de cada polígono a ser representado. O pacote 'geobr' facilita este processo, incorporando as coordenadas geográficas de mapas brasileiros produzidos pelo IBGE. O pacote 'sf' provê operações geométricas que interpretam as coordenadas poligonais como vetores no R.

# Solicitar pacotes

```
#install.packages("geobr")
#install.packages("sf")
#install.packages("patchwork")

library(geobr)
library(sf)
library(ggplot2)
library(patchwork)
```

# Plotar um mapa simples do Brasil (com divisas de estados)

```
# Coletar dados de divisas de estados no mapa brasileiro em 2020
divisoes_uf <- read_state(code_state="all", year=2020)

# Plotar mapa
divisoes_uf %>% 
  ggplot() +
  geom_sf(fill="green4", color="yellow2", size=.15)

# Customizando o mapa
ggplot() +
  geom_sf(data = divisoes_uf, fill="#2D3E50", color="#FEBF57", size=.15) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="Mapa do Brasil", size=8)
```

# Plotar mapa do Rio de Janeiro (com divisas de municípios)

```
# Coletar dados de divisas de municípios no mapa do Rio de Janeiro em 2022
RJ_municipios <- read_municipality(
  code_muni = "RJ", 
  year= 2022,
  showProgress = FALSE
)

# Plotar mapa
ggplot() +
  geom_sf(data=RJ_municipios, fill="blue3", color="white", size=.10) +
  labs(subtitle="Municípios do Rio de Janeiro, 2022", size=8) +
  theme_minimal()
```

# Para conhecer todas as funções do pacote `geobr`

```
# Criar dataframe para apresentar os dados disponíveis
geobr_funcoes <- list_geobr()
```

# Plotar evolução dos mapas brasileiros lado a lado

```
# Coletando dados históricos de fronteiras
fronteiras_1872 <- read_state(code_state="all", year=1872)
fronteiras_1900 <- read_state(code_state="all", year=1900)
fronteiras_1933 <- read_state(code_state="all", year=1933)
fronteiras_1960 <- read_state(code_state="all", year=1960)
fronteiras_1991 <- read_state(code_state="all", year=1991)
fronteiras_2020 <- read_state(code_state="all", year=2020)

# Gerandos os mapas individuais
mapa1872 <- ggplot() +
  geom_sf(data=fronteiras_1872, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="1872", size=8)

mapa1900 <- ggplot() +
  geom_sf(data=fronteiras_1900, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="1900", size=8)

mapa1933 <- ggplot() +
  geom_sf(data=fronteiras_1933, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="1933", size=8)

mapa1960 <- ggplot() +
  geom_sf(data=fronteiras_1960, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="1960", size=8)

mapa1991 <- ggplot() +
  geom_sf(data=fronteiras_1991, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="1991", size=8)

mapa2020 <- ggplot() +
  geom_sf(data=fronteiras_2020, fill="grey25", color="grey75", size=.07) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
  labs(subtitle="2020", size=8)

# Plotando os mapas lado a lado
(mapa1872 | mapa1900 | mapa1933) / (mapa1960 | mapa1991 | mapa2020)
```

# Plotar mapa de reservas indígenas

```
# Coletar dados de reservas indígenas
reservas <- geobr::read_indigenous_land(201907)

# Criar objeto para selecionar o estado do Acre
AC_municipios <- read_municipality( code_muni = "AC", year= 2020)

# Plotar o estado do Acre com divisas dos municípios
plot(AC_municipios$geom)

# Plotar o estado do Acre com divisas dos municípios e em cores
ggplot() +
    geom_sf(data=AC_municipios, fill="#2D3E50", color="#FEBF57", size=.15) + 
      theme_minimal() +
      theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank()) +
      labs(subtitle="Acre", size=8)

# Selecionar somente as reservas Kaxinawá
reservas %>% 
  mutate(row = row_number()) %>% 
  mutate(kaxinawa = stringr::str_detect(etnia_nome, "[K|k]axinaw[a|á]")) %>% 
  filter(kaxinawa == TRUE) %>% 
  select(row)

# Plotar apenas áreas específicas de reservas no Acre (todas as áreas Kaxinawá)
ggplot() +
  geom_sf(data=AC_municipios$geom, color="#bcbcbc", size=.15, show.legend = FALSE) +
  geom_sf(data=reservas$geom[14], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[189], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[257], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[260], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[261], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[262], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[263], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[264], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[265], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[266], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[267], fill="#FE0000", color="#FE0000", size=.15) +
  geom_sf(data=reservas$geom[281], fill="#FE0000", color="#FE0000", size=.15) +
    labs(subtitle="Kaxinawá", size=8) +
  theme_minimal() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank())
```

# Plotar mapa eleitoral do segundo turno em 2022

```
# Coletando os dados de resultados eleitorais por estados em 2022
resultados_uf_2022 <- read.csv(
  "https://raw.githubusercontent.com/coLAB-UFF/docs/main/data/resultados_uf_2022.csv")

# Mergindo as bases de dados (resultados eleitorais + divisas de estados)
divisoes_uf <- read_state(code_state="all", year=2020) %>% 
  mutate(uf = abbrev_state)

mapa <- left_join(divisoes_uf, resultados_uf_2022, by = "uf")

# Plotando o mapa eleitoral
ggplot() +
  geom_sf(data = mapa, aes(fill = vencedor), color = NA, size = .15) +
  labs(subtitle = "Resultado: Eleições Presidenciais 2022", size = 8) +
  scale_fill_manual(values = c("seagreen", "red3")) +
  theme_minimal()
```

