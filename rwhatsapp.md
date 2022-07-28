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

```SINTAXE
dd/mm/aaaa hh:mm - +ddi ddd telefone: Mensagem.
```

A seguir, um extrato (com dados pessoais omitidos) de um grupo real:


```EXEMPLO DE CHAT EXPORTADO
01/11/2020 12:34 - +55 21 99**-****: <Arquivo de mídia oculto>
01/11/2020 12:35 - +55 77 98**-****: Excelente vídeo.
01/11/2020 12:36 - +55 77 99**-****: Também recebi de um outro grupo.
```




