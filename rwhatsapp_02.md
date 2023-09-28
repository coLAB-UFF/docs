---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: rwhatsapp
description: Curso de coleta e tratamento de dados do WhatsApp

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
        content: Exportação de Chats
        url: '/rwhatsapp_01B'
    next:
        content: Manipulação de Dados 1
        url: '/rwhatsapp_03'
---

# rwhatsapp

O rwhatsapp é um script desenvolvido por Johannes Gruber para manipulação e parse de dados exportados a partir de chats do WhatsApp. Para mais informações, consulte: https://github.com/JBGruber/rwhatsapp


# Instalando e Requisitando o Pacote rwhatsapp

Antes de começar a utilizar o rwhatsapp, abra o seu R Studio e instale o pacote. 

```
install.packages("rwhatsapp")

library(rwhatsapp)
```

Em caso de dificuldade, é possível também instalá-lo diretamente do GitHub:

```
install.packages("remotes")
remotes::install_github("JBGruber/rwhatsapp")

library(rwhatsapp)
```

# Demo

O pacote rwhatsapp possui uma base de dados de exemplo. Para importá-la, utilize os seguintes comandos:

```
sample <- system.file("extdata", "sample.txt", package = "rwhatsapp")

chat <- rwhatsapp::rwa_read(sample)

View(chat)
```

A principal função do pacote rwhatsapp é a `rwa_read()`. Esta função tem o objetivo de importar e parsear os chats do WhatsApp em formato de *dataframe* no R Studio.


# Importando Dados do WhatsApp no R Studio

Vamos agora trabalhar com dados reais não-anonimizados.

Salve, no seu computador, o arquivo de texto disponível [neste link](https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula8/Conversa%20do%20WhatsApp%20com%20Rstats.txt).

Selecione o arquivo salvo no computador local:

```
grupo_rstats <- rwa_read(file.choose())
```

Ou indique o *path* diretamente no próprio comando:

```
grupo_rstats <- rwa_read(
  "~/Downloads/Conversa do WhatsApp com Rstats.txt")
```

Vamos agora aprender a manipular e tratar esses dados...
