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
micro_nav: true

# Page navigation
page_nav:
    prev:
        content: Previous page
        url: '#'
    next:
        content: Next page
        url: '#'
---

# Proposta do Curso

Este é um curso de curta duração cujo principal objetivo é apresentar, em uma linguagem objetiva e instrumental, técnicas de extração e tratamento de dados obtidos a partir de chats do WhatsApp. A oficina não se propõe a introduzir princípios e fundamentos da linguagem R ou da ciência de dados, mas alguns desses tópicos podem ser discutidos ao longo das aulas. No geral, pretende-se trabalhar com a exportação nativa de chats do WhatsApp, a inserção desses dados no software R Studio como um dataframe, e subsequente modelagem, transformação e visualização desses dados. Os alunos serão levados a exercitar essas habilidades e produzir análises exploratórias dos dados com estatísticas descritivas.

# Requisitos e Funcionamento

O curso tem caráter de oficina. Serão ministradas duas aulas síncronas com 4h de duração cada. Os alunos receberão material de apoio, documentação e scripts com os principais comandos executados a cada aula, por meio de um grupo da oficina no próprio WhatsApp. É necessário ter um computador (desktop ou laptop) com acesso à internet para o curso. Solicita-se a instalação prévia dos seguintes softwares, todos opensource:

* [R <https://cran-r.c3sl.ufpr.br/>](https://cran-r.c3sl.ufpr.br/) *(versões para Linux, Mac OS e Windows disponíveis)* 
* [R Studio <https://www.rstudio.com/products/rstudio/download/#download>](https://www.rstudio.com/products/rstudio/download/#download) *(versões para Linux, Mac OS e Windows disponíveis)*

Instale sempre primeiro o software R e depois o R Studio. Usuários de Mac Os devem instalar também o [X Quartz <https://www.xquartz.org/>](https://www.xquartz.org/). Durante o curso, outros pacotes e plugins serão instalados, conforme orientação do(a) professor(a) responsável.

# Recursos da Oficina

* Google Meet

* Grupo do WhatsApp

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/shared_qr_code.png" width="400">



# Principais Pacotes a Serem Trabalhados no Curso

**rwhatsapp** &middot; # O rwhatsapp é um script desenvolvido por Johannes Gruber para manipulação e parse de dados exportados a partir de chats do WhatsApp. Para mais informações, consulte: https://github.com/JBGruber/rwhatsapp

**dplyr** &middot; # O dplyr é um dos pacotes do Tidyverse e é voltado especificamente para o trabalho de manipulação de dados. O dplyr se estrutura em torno de um conjunto de verbos, que operam como funções para a manipulação de grandes bancos de dados. Para mais detalhes, acesse: https://dplyr.tidyverse.org/


# Outras Referências Adicionais:

* Aquino, Jakson Alves de. [R para cientistas sociais](http://www.uesc.br/editora/livrosdigitais_20140513/r_cientistas.pdf). Ilhéus: Editora da UESC, 2014.

* Oliveira, Paulo Felipe de; Guerra, Saulo; McDonell, Robert. [Ciência de Dados com R: Introdução](https://ibpad.com.br/publicacoes/ciencia-de-dados-com-r-introducao/). Brasília: Editora IBPad, 2018.

* Wickham, Hadley; Grolemund, Garrett. [R para data science](https://r4ds.had.co.nz/). Rio de Janeiro: Alta Books, 2019.

* [R Graph Gallery](https://www.r-graph-gallery.com/).


# Formato de Exportação de Dados do WhatsApp

O WhatsApp possui uma ferramenta nativa de exportação individual de chats. Os arquivos resultantes possuem o formato TXT e não são parseados, isto é, não possuem uma estrutura lógica de banco de dados. É possível ler esses arquivos em qualquer software de bloco de notas, mas, para trabalhar com os seus dados de forma quantitativa, é preciso, antes de mais nada, converter o formato de arquivo em um CSV (comma-separated values).

O primeiro exercício do curso é, portanto, o de exportar os dados e convertê-los em formato CSV.

## Exportando Chats do WhatsApp

<div class="callout callout--warning">
    <p><strong>ATENÇÃO!</strong></p>
    <p>Todos os dados pessoais foram omitidos neste tutorial.</p>
</div>

Para exportar os chats, acesse o seu WhatsApp é siga o passo-a-passo:

* Clique no botão com ... no canto superior esquerdo do aplicativo para abrir o menu de opções.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/rwhatsapp01.jpg" width="400">

* Selecione a opção **Mais** e clique mais uma vez.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/rwhatsapp02.jpg" width="400">

* Em seguida, clique na opção **Exportar conversa**.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/rwhatsapp03.jpg" width="400">

* O WhatsApp perguntará sobre a opção de exportação. Para as finalidades deste curso, a opção **Sem Mídia** é suficiente.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/rwhatsapp04.jpg" width="400">

* Por fim, selecione o método de compartilhamento do arquivo, que pode ser por email, pelo Google Drive, ou pelo próprio WhatsApp.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/rwhatsapp05.jpg" width="400">

Com o arquivo TXT em mãos, a próxima etapa é a leitura dos dados.

Observe que o arquivo possui o seguinte formato:

```
dd/mm/aaaa hh:mm - +ddi ddd telefone: Mensagem.
```

A seguir, um extrato (com dados pessoais omitidos) de um grupo real:


```
01/11/2020 12:34 - +55 21 99**-****: <Arquivo de mídia oculto>
01/11/2020 12:35 - +55 77 98**-****: Excelente vídeo.
01/11/2020 12:36 - +55 77 99**-****: Também recebi de um outro grupo.
```




