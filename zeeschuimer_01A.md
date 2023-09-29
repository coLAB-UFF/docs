---
# Page settings
layout: default
keywords:
comments: false

# Hero section
title: zeeschuimer
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
    prev:
        content: Programa de Curso
        url: '/zeeschuimer'
    next:
        content: Exportação de Chats
        url: '/zeeschuimer_01B'
---

# Zeeschuimer

Zeeschuimer é uma extensão de navegador que monitora o tráfego da Internet enquanto você navega em um site de mídia social e coleta dados sobre os itens que você vê na interface da web de uma plataforma para análise sistemática posterior. Seu público-alvo são pesquisadores que desejam estudar sistematicamente o conteúdo em plataformas de mídia social que resistem ao scraping convencional ou à coleta de dados baseada em API. A extensão zeeschuimer é desenvolvida pelo laboratório Digital Methods Initiative (DMI) da Universidade de Amsterdam.

Atualmente, a extensão permite as raspagem de dados das seguintes plataformas:

* TikTok
* Instagram
* Twitter
* LinkedIn
* 9gag
* Imgur
* Douyin

# Raspando dados

Para raspar os dados, acesse seu navegador Mozilla Firefox, e, com a extensão Zeeschuimer instalada, clique no botão correspondente a ela na sua barra de navegação.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/zeeschuimer.png" width="400">

O navegador automaticamente abrirá uma nova tela de configuração da extensão.

<img src="https://raw.githubusercontent.com/coLAB-UFF/docs/main/images/zeeschuimer01.png" width="400">

Ative a plataforma cujos dados pretende raspar. E abra uma nova aba para navegar por essa plataforma. Conforme você navega, note que a extensão vai acumulando itens raspados. Ao final da operação, faça o download do arquivo .ndjson gerado. Em seguida, vamos importar esse arquivo no R Studio e convertê-lo em um dataframe.

Observe que o arquivo possui o seguinte formato:

```
{"nav_index":"23:1:0","item_id":"3172823077191193511_54045506848","timestamp_collected":1692473383763,"source_platform":"instagram.com","source_platform_url":"https://www.instagram.com/colab.uff/","source_url":"https://www.instagram.com/api/v1/feed/user/colab.uff/username/?count=12","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/114.0","data":{"taken_at":1692450007,"pk":"3172823077191193511","id":"3172823077191193511_54045506848","device_timestamp":1692450004,"client_cache_key":"MzE3MjgyMzA3NzE5MTE5MzUxMQ==.2","filter_type":0,"caption_is_edited":true,"like_and_view_counts_disabled":false,"is_reshare_of_text_post_app_media_in_ig":false,"is_post_live_clips_media":false,"shop_routing_user_id":null,"can_see_insights_as_brand":false,"is_organic_product_tagging_eligible":false,"has_liked":false,"like_count":19,"facepile_top_likers":[
...
```

Trata-se de um arquivo json, cujo formato de dados é aninhado. O json é um formato muito útil para compressão de dados em larga escala, mas pouco amigável para visualização direta. Por isso, vamos convertê-lo em um formato tabular.

O primeiro passo é importá-lo para o R.

```
db_tiktok <- ndjson::stream_in("/Volumes/repositorio/json/zeeschuimer-export-tiktok.com-2022-03-30T034532.ndjson")
```

Pronto, seu dataframe já está constituído. O passo seguinte é tratar as variáveis. Mas, antes, vamos aprender a manipular um banco de dados...


```
# A tibble: 17 × 1,146
   data.accessibility_caption          data.can_see_insight…¹ data.can_view_more_p…² data.can_viewer_resh…³ data.can_viewer_save data.caption.bit_flags data.caption.content…⁴
   <chr>                               <lgl>                  <lgl>                  <lgl>                  <lgl>                                 <dbl> <chr>                 
 1 Photo by coLAB on August 19, 2023.… FALSE                  FALSE                  TRUE                   TRUE                                      0 comment               
 2 Photo by coLAB on August 18, 2023.… FALSE                  FALSE                  TRUE                   TRUE                                      0 comment               
 3 Photo by coLAB on August 16, 2023.… FALSE                  TRUE                   TRUE                   TRUE                                     NA NA                    
 4 NA                                  FALSE                  FALSE                  TRUE                   TRUE                                      0 comment               
 5 NA                                  FALSE                  TRUE                   TRUE                   TRUE                                      0 comment               
 6 Photo by coLAB in UFF - Universida… FALSE                  TRUE                   TRUE                   TRUE                                      0 comment               
 7 NA                                  FALSE                  TRUE                   TRUE                   TRUE                                      0 comment               
 8 Photo by coLAB on July 05, 2022.    FALSE                  TRUE                   TRUE                   TRUE                                      0 comment               
```

Para selecionar algumas variáveis interessantes para análise no TikTok, use:

```
db_tiktok <- db_tiktok_original %>% 
  mutate(author = author) %>% 
  mutate(author.signature = data.author.signature) %>% 
  mutate(author.verified = data.author.verified) %>% 
  mutate(author.id = data.author.id) %>% 
  mutate(author.followingCount = data.authorStats.followingCount) %>% 
  mutate(author.followerCount = data.authorStats.followerCount) %>% 
  mutate(author.heartCount = data.authorStats.heartCount) %>% 
  mutate(author.videoCount = data.authorStats.videoCount) %>% 
  mutate(avatar = data.author.avatarLarger) %>%
  mutate(data.id = data.video.id) %>% 
  mutate(data.url = data.video.downloadAddr) %>% 
  mutate(description = data.desc) %>% 
  mutate(tag0 = data.challenges.0.title) %>% 
  mutate(tag1 = data.challenges.1.title) %>% 
  mutate(tag2 = data.challenges.2.title) %>% 
  mutate(tag3 = data.challenges.3.title) %>% 
  mutate(tag4 = data.challenges.4.title) %>% 
  mutate(tag5 = data.challenges.5.title) %>% 
  mutate(tag6 = data.challenges.6.title) %>% 
  mutate(tag7 = data.challenges.7.title) %>% 
  mutate(createDateTime = as.numeric(data.createTime)) %>% 
  mutate(createDateTime = as.POSIXct(createDateTime, origin = "1970-01-01")) %>% 
  mutate(createTime = format(createDateTime, format = "%H:%M:%S")) %>% 
  mutate(createDate = as.Date(createDateTime)) %>% 
  #mutate(createTime = lubridate::as_datetime(data.createTime)) %>% 
  #mutate(createDate = as.Date(data.createTime)) %>% 
  mutate(data.heartCount = data.stats.diggCount) %>% 
  mutate(data.commentCount = data.stats.commentCount) %>% 
  mutate(data.playCount = data.stats.playCount) %>% 
  mutate(data.shareCount = data.stats.shareCount) %>% 
  mutate(video.duration = data.video.duration) %>% 
  mutate(is.Ad = data.isAd) %>% 
  mutate(music.id = data.music.id) %>% 
  mutate(music.title = data.music.title) %>% 
  mutate(music.album = data.music.album) %>% 
  mutate(music.author = data.music.authorName) %>% 
  mutate(music.duration = data.music.duration) %>% 
  mutate(music.url = data.music.playUrl) %>% 
  mutate(music.cover = data.music.coverLarge) %>% 
  mutate(music.isOriginal = data.music.original) %>% 
  #mutate(author.nickname = author) %>% 
  select(author, author.followingCount,
         author.followerCount, author.heartCount, author.videoCount,
         data.id, data.url, description,
         tag0, tag1, tag2, tag3, tag4, tag5, tag6, tag7,
         createDate, createTime, createDateTime, data.heartCount, data.commentCount, 
         data.playCount, data.shareCount, video.duration,
         is.Ad, music.id, music.title, music.title,
         music.album, music.author, music.duration, music.url,
         music.cover, music.isOriginal)
```
