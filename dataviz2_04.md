---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: Estatísticas Descritivas
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
        content: Tipos de Variáveis
        url: '/dataviz2_03'
    next:
        content: Estatísticas Descritivas
        url: '/dataviz2_05'
---

# Amostra e Amostragem

<div style="position: relative; width: 100%; height: 0; padding-top: 56.2500%;
 padding-bottom: 0; box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); margin-top: 1.6em; margin-bottom: 0.9em; overflow: hidden;
 border-radius: 8px; will-change: transform;">
  <iframe loading="lazy" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none; padding: 0;margin: 0;"
    src="https://www.canva.com/design/DAHEEsaf55k/qgyrndd0UeCX5BTDnNH1Tg/view?embed" allowfullscreen="allowfullscreen" allow="fullscreen">
  </iframe>
</div>

# Criando uma Amostra

Para criar uma amostra aleatória simples dos dados disponíveis na sua base, estabeleça um valor amostral e requisite que o R crie essa amostra com a função `sample_n` do pacote `dplyr`:

```
amostra <- candidato_brasil %>% 
  sample_n(500)
```

