# EXERCÍCIO 1

### Considere o conjunto de dados abaixo:

### bbb21_mensagens <- read.csv("https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/bbb21_mensagens.csv")

## 1. Procure quantas vezes Juliette é mencionada nesse conjunto de mensagens.

### OPÇÃO A

bbb21_mensagens$text %>% 
  str_detect("Juliette|Juliete|juliette|juliete") %>% 
  sum(TRUE)

### OPÇÃO B

bbb21_mensagens %>% 
  mutate(new_text = str_detect(text, "Juliette|Juliete|juliette|juliete")) %>% 
  filter(new_text == "TRUE") %>% 
  count()

### OPÇÃO C

bbb21_mensagens %>% 
  filter(grepl("Juliette", text)) %>% count()


## 2. Substitua todas as menções a Bolsonaro (ou bolsonaro ou BOLSONARO) por Bozo

### OPÇÃO A

bbb21_mensagens$text <- bbb21_mensagens$text %>% 
  str_replace("Bolsonaro|bolsonaro|BOLSONARO", "Bozo")

### OPÇÃO B

bbb21_mensagens$text <- bbb21_mensagens$text %>% 
  str_replace("Bolsonaro", "Bozo") %>% 
  str_replace("bolsonaro", "Bozo") %>% 
  str_replace("BOLSONARO", "Bozo")

### OPÇÃO C

bozo <- bbb21_mensagens %>%
  #filter(grepl("Bolsonaro|bolsonaro|BOLSONARO", text)) %>% 
  mutate(text = gsub("Bolsonaro", "Bozo", text)) %>% 
  mutate(text = gsub("bolsonaro", "Bozo", text)) %>% 
  mutate(text = gsub("BOLSONARO", "Bozo", text))


## 3. Transforme todos os caracteres das mensagens nos tweets em minúsculas.

### OPÇÃO A

bbb21_mensagens %>% mutate(text = stringr::str_to_lower(text))

### OPÇÃO B

bbb21_mensagens$text <- bbb21_mensagens$text %>% 
  str_to_lower()

