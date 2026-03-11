
### EXERCÍCIO 1

# Considere o conjunto de dados abaixo:

representatividade_2018 <- read.csv("https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/representatividade_2018.csv")

# Arrume os dados de modo a tornar a estrutura do banco tidy.
# DICA: Mantenha três colunas na tabela e transforme negros_pardos e mulheres em uma só variável.

### OPÇÃO A

representatividade_2018 %>% 
  gather(negros_pardos, mulheres, key = "candidatos_minorias", value = "quantidade") %>% 
  select(-X)

### OPÇÃO B

representatividade_2018 %>% 
  pivot_longer(cols = c("negros_pardos", "mulheres"), names_to = "candidatos_minorias", values_to = "quantidade") %>% 
  select(-X)


### EXERCÍCIO 2

# Considere o conjunto de dados abaixo:

bbb21_mensagens <- read.csv(
  "https://raw.githubusercontent.com/ombudsmanviktor/workshop_rstats/main/aula6/bbb21_mensagens.csv")

# A coluna métricas possui dois valores associados na mesma célula. Transforme esses dois
# valores em duas variáveis diferentes, considerando o primeiro valor como de RTs recebidos
# por um determinado tweet, e o segundo valor como o de vezes em que esse mesmo tweet foi
# favoritado.

bbb21_separate <- bbb21_mensagens %>% 
  separate(metricas, c("retweets", "favorites"), sep = "/")




