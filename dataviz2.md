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
    next:
        content: Funções Básicas
        url: '/dataviz2_01'
---

# Proposta do Curso

O desenvolvimento da assim chamada ciência de dados é francamente devedor de experiências pregressas no campo da estatística, que tornaram-se mais sofisticadas com a introdução de técnicas inovadoras de visualização de dados. Fundamentos hoje extensamente difundidos, como os gráficos de barra ou de linha, primeiro surgiram no século XVIII, com William Playfair, e décadas mais adiante foram aprimoradas por pioneiras como Florence Nightingale. Mas só no século XX, com a ciência computacional, e o princípio da dataficação da vida social permitiram avançar naquilo que John Tukey apropriadamente denominou de análise exploratória de dados. Nos últimos anos, em decorrência da penetração cada vez maior das plataformas digitais nas múltiplas dimensões do cotidiano, ganharam novo impulso habilidades como o design da informação, a percepção gráfica, e, claro, a mineração de dados.

Este curso se propõe a introduzir fundamentos básicos da análise e da visualização de dados para pesquisadores em formação no campo das humanidades. Seu principal objetivo é munir alunos e alunas de conhecimento prático e laboratorial acerca da análise exploratória de dados, de modo que possam se apropriar dessa técnica para o desenvolvimento metodológico de suas próprias investigações. Com caráter de oficina, o curso se utilizará, de forma instrumental, de variadas aplicações opensource, com ênfase na linguagem R e na gramática de gráficos de seu principal pacote de visualização de dados, o ggplot2, para fornecer tanto uma discussão conceitual, quanto capacidades empíricas para lidar com formatos de dados abertos. As aulas contarão com momentos expositivos e práticas orientadas. Alunos e alunas aprenderão a ler e criar diferentes tipos de gráficos, a produzir análises sobre estatísticas descritivas, análises textuais lexicométricas, análises georreferenciadas e análises de redes sociais. Além disso, receberão treinamento para a coleta de dados de repositórios públicos, bem como para limpar e organizar grandes bancos de dados (data wrangling).

# Requisitos e Funcionamento

O curso tem caráter de oficina. Os alunos receberão material de apoio, documentação e scripts com os principais comandos executados a cada aula. É necessário ter um computador (desktop ou laptop) com acesso à internet para o curso. Solicita-se a instalação prévia dos seguintes softwares, todos opensource:

* [R <https://cran-r.c3sl.ufpr.br/>](https://cran-r.c3sl.ufpr.br/) *(versões para Linux, Mac OS e Windows disponíveis)* 

* [R Studio <https://www.rstudio.com/products/rstudio/download/#download>](https://www.rstudio.com/products/rstudio/download/#download) *(versões para Linux, Mac OS e Windows disponíveis)*

Instale sempre primeiro o software R e depois o R Studio. Usuários de Mac Os devem instalar também o [X Quartz <https://www.xquartz.org/>](https://www.xquartz.org/). Durante o curso, outros pacotes e plugins serão instalados, conforme orientação do(a) professor(a) responsável.

* [Gephi <https://gephi.org/>](https://gephi.org/) *(versões para Linux, Mac OS e Windows disponíveis)*
  
* [IramuteQ <http://www.iramuteq.org/>](http://www.iramuteq.org/) *(versões para Linux, Mac OS e Windows disponíveis)*


# Principais Pacotes R

**dplyr** &middot; # O dplyr é um dos pacotes do Tidyverse e é voltado especificamente para o trabalho de manipulação de dados. O dplyr se estrutura em torno de um conjunto de verbos, que operam como funções para a manipulação de grandes bancos de dados. Para mais detalhes, acesse: [dplyr](https://dplyr.tidyverse.org/)

**tidyr** &middot; # O tidyr é um dos pacotes do Tidyverse e é voltado especificamente para a arrumação de bancos de dados. Para mais detalhes, acesse: [tidyr](https://tidyr.tidyverse.org/)

**stringr** &middot; # O stringr é um dos pacotes do Tidyverse e é voltado para a manipulação de strings textuais. Para mais detalhes, acesse: [stringr](https://stringr.tidyverse.org/)

**ggplot2** &middot; # O ggplot2 é um sistema para criação de gráficos, baseado em uma grámática própria e em camadas estéticas. Para mais detalhes, acesse: [ggplot2](https://ggplot2.tidyverse.org/)


# Programação

<details>
    <summary><strong>Quadro de Encontros e Atividades</strong></summary>

| Data | Discussão Conceitual | Prática Laboratorial | Leituras Recomendadas |
| -------- | -------- | -------- | -------- | 
| 17/03 | Definições Iniciais. Origens da Visualização de Dados | Instalação do R e R Studio. Apresentação e Primeiros Passos na Linguagem R | D’Ignazio; Aquino |
| 24/03 | Arquitetura da Informação. Formatos de Tabelas de Dados. Repositórios | Objetos e Estruturas de Dados (vetor, lista, dataframe). Instalação de Pacotes | Wurman, R.; Spiegelhalter, D. |
| 31/03 | Amostra e Amostragem. Tipos de Dados e Tipos de Variáveis |  Manipulação de Dados 1 (dplyr): select, filter, mutate, arrange, group_by, sommarise, count | Figueiredo Filho, D.; Wickham |
| 07/04 | Estatísticas Descritivas 1. Estatísticas de Frequência ou Posição | Manipulação de Dados 2 (dplyr, stringr): sample_n, between, case_when, str_ | Bruce, P. & Bruce, A.; Wickham |
| 14/04 | Estatísticas Descritivas 2. Estatísticas de Variabilidade ou Dispersão | Manipulação de Dados 3 (dplyr): joins, binds | Wickham |
| 21/04 | Feriado | Feriado | Feriado |
| 28/04 | Métodos Gráficos 1. Gráfico de Barras, Gráfico de Linha, Gráfico de Pizza | Manipulação de Dados 4 + Arrumação de Dados (tidyr): gather, spread, pivot_longer, pivot_wider, unite, separate | Cleveland; Knaflic |
| 05/05 | Métodos Gráficos 2. Histograma, Dispersão, Boxplot. Diagramas e Mapas Coropléticos | Visualização de Dados 1 (ggplot2) | Knaflic |
| 12/05 | Percepção Gráfica 1 | Visualização de Dados 2 (ggplot2) | Cleveland; Cairo |
| 19/05 | Percepção Gráfica 2 | Visualização de Dados 3 (ggplot2) | Krause, Rennie & Tarran; Wickham |
| 26/05 | Introdução à Correlação e Regressão 1 | Correlação de Pearson. Linear Models (LM) | Figueiredo Filho |
| 02/06 | Introdução à Correlação e Regressão 2 | Generalized Linear Models (GLM) |  |
| 09/06 | Introdução à Análise Lexical *OU* Introdução aos Testes de Hipóteses (Qui-Quadrado de Pearson, Teste t, ANOVA etc.) *OU* RMarkdown 1 | IramuteQ *OU* R + RMarkdown | Salviati *OU* Cervi |
| 16/06 | Introdução à Análise de Redes *OU* Mapas Coropléticos *OU* RMarkdown 2 | Gephi *OU* R + RMarkdown | Cherven |
| 23/06 | Encerramento | Definição de Trabalhos Finais |  |
| 30/06 | Livre | Livre | Livre |
| 07/07 | Livre | Livre | Livre |

</details>


# Referências Adicionais

* Aquino, J. A. (2014). R para Cientistas Sociais.

* Bruce, P., & Bruce, A. (2019). Estatística Prática para Cientistas de Dados.

* Cairo, A. (2016). Truthful Art Data: Charts, and Maps for Communication.

* Cervi, E. (2019). Manual de Métodos Quantitativos para Iniciantes em Ciência Política, vol. 1.

* Cervi, E. (2019). Manual de Métodos Quantitativos para Iniciantes em Ciência Política, vol. 2.

* Cherven, K. (2015). Mastering Gephi Network Visualization.

* Cleveland, W. S. (1985). The Elements of Graphing Data.

* D’Ignazio, C. (2020). Data Feminism.

* Figueiredo Filho, D. (2019). Métodos Quantitativos em Ciência Política.

* Knaflic, C. N. (2019). Storytelling com Dados: um Guia sobre Visualização de Dados para Profissionais de Negócios.

* Krause, A., Rennie, N., & Tarran, B. (2023). Best Practices for Data Visualisation Insights.

* Oliveira, P. F., Guerra, S., & McDonnell, R. (2018). Ciência de Dados com R: Introdução.

* Salviati, M. E. (2017). Manual do Aplicativo Iramuteq.

* Spiegelhalter, D. (2022). A arte da estatística: Como Aprender a Partir de Dados.

* Wickham, H. (2019). R para Ciência de Dados: importe, arrume, transforme, visualize e modele dados.

* Wickham, H. (2010). ggplot2: Elegant Graphics for Data Analysis.

* Wurman, R. S. (1999). Ansiedade De Informação: Como Transformar Informação em Compreensão.

