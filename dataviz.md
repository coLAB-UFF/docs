---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: dataviz
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
    next:
        content: Raspagem de Dados
        url: '/dataviz_01'
---

# Proposta do Curso

Este é um curso de curta duração cujo principal objetivo é apresentar, em uma linguagem objetiva e instrumental, técnicas de extração e tratamento de dados obtidos a partir de diferentes plataformas digitais. A oficina não se propõe a introduzir princípios e fundamentos da linguagem R ou da ciência de dados, mas alguns desses tópicos podem ser discutidos ao longo das aulas. No geral, pretende-se trabalhar com a raspagem de dados das mídias sociais por meio de uma extensão para o navegador Mozilla Firefox desenvolvida pelo laboratório Digital Methods Initiative (DMI) da Universidade de Amsterdam. Em seguida à raspagem, será realizada a importação desses dados no software R Studio como um dataframe, e subsequente tratamento, transformação e visualização desses dados. Os alunos serão levados a exercitar essas habilidades e produzir análises exploratórias dos dados com estatísticas descritivas.


# Requisitos e Funcionamento

O curso tem caráter de oficina. Serão ministradas três aulas síncronas com 4h de duração cada. Os alunos receberão material de apoio, documentação e scripts com os principais comandos executados a cada aula. É necessário ter um computador (desktop ou laptop) com acesso à internet para o curso. Solicita-se a instalação prévia dos seguintes softwares, todos opensource:

* [R <https://cran-r.c3sl.ufpr.br/>](https://cran-r.c3sl.ufpr.br/) *(versões para Linux, Mac OS e Windows disponíveis)* 
* [R Studio <https://www.rstudio.com/products/rstudio/download/#download>](https://www.rstudio.com/products/rstudio/download/#download) *(versões para Linux, Mac OS e Windows disponíveis)*

Instale sempre primeiro o software R e depois o R Studio. Usuários de Mac Os devem instalar também o [X Quartz <https://www.xquartz.org/>](https://www.xquartz.org/). Durante o curso, outros pacotes e plugins serão instalados, conforme orientação do(a) professor(a) responsável.

* [Mozilla Firefox <https://www.mozilla.org/pt-BR/firefox/new/>](https://www.mozilla.org/pt-BR/firefox/new/) *(versões para Linux, Mac OS e Windows disponíveis)*
* [Zeeschuimer <https://github.com/digitalmethodsinitiative/zeeschuimer/releases>](https://github.com/digitalmethodsinitiative/zeeschuimer/releases) *(extensão xpi para o Firefox)*


# Recursos da Oficina

* [Google Meet](https://meet.google.com/bmo-xzwz-ybc)


# Principais Pacotes

**dplyr** &middot; # O dplyr é um dos pacotes do Tidyverse e é voltado especificamente para o trabalho de manipulação de dados. O dplyr se estrutura em torno de um conjunto de verbos, que operam como funções para a manipulação de grandes bancos de dados. Para mais detalhes, acesse: https://dplyr.tidyverse.org/

**ndjson** &middot; # O ndjson é um pacote para streaming e importação de arquivos json e ndjson com grande número de registros. Para mais detalhes, acesse: https://github.com/hrbrmstr/ndjson

**tidyr** &middot; # O tidyr é um dos pacotes do Tidyverse e é voltado especificamente para a arrumação de bancos de dados. Para mais detalhes, acesse: https://tidyr.tidyverse.org/

**stringr** &middot; # O stringr é um dos pacotes do Tidyverse e é voltado para a manipulação de strings textuais. Para mais detalhes, acesse: https://stringr.tidyverse.org/

**ggplot2** &middot; # O ggplot2 é um sistema para criação de gráficos, baseado em uma grámática própria e em camadas estéticas. Para mais detalhes, acesse: https://ggplot2.tidyverse.org/

**rwhatsapp** &middot; # O rwhatsapp é um script desenvolvido por Johannes Gruber para manipulação e parse de dados exportados a partir de chats do WhatsApp. Para mais informações, consulte: https://github.com/JBGruber/rwhatsapp


# Referências Adicionais

* Aquino, Jakson Alves de. [R para cientistas sociais](http://www.uesc.br/editora/livrosdigitais_20140513/r_cientistas.pdf). Ilhéus: Editora da UESC, 2014.

* Oliveira, Paulo Felipe de; Guerra, Saulo; McDonell, Robert. [Ciência de Dados com R: Introdução](https://ibpad.com.br/publicacoes/ciencia-de-dados-com-r-introducao/). Brasília: Editora IBPad, 2018.

* Wickham, Hadley; Grolemund, Garrett. [R para data science](https://r4ds.had.co.nz/). Rio de Janeiro: Alta Books, 2019.

* [R Graph Gallery](https://www.r-graph-gallery.com/).

