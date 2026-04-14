## CRIANDO OS DATASETS

install.packages("devtools")
devtools::install_github("tbrugz/ribge")
populacao2022 <- ribge::populacao_municipios(2022)

install.packages("electionsBR")
candidato_brasil <- electionsBR::elections_tse(2022, type = "candidate") %>% filter(DS_CARGO == "DEPUTADO FEDERAL")


## EXERCÍCIO 1

# Considere os dados do IBGE sobre a população brasileira dividida em municípios em 2019
install.packages("devtools")
devtools::install_github("tbrugz/ribge")
populacao2022 <- ribge::populacao_municipios(2022)

# 1. Quais os cinco municípios com maior população no estado do Rio de Janeiro?
# 2. Qual a média populacional dos municípios do Rio de Janeiro?
# 3. Quantos municípios do Rio de Janeiro estão acima dessa média?

populacao2022 %>% 
  filter(uf == "RJ") %>% 
  arrange(desc(populacao))

populacao2022 %>% 
  group_by(uf) %>% 
  summarise(media = mean(populacao)) %>% 
  filter(uf == "RJ")

populacao2022 %>% 
  filter(uf == "RJ") %>% 
  filter(populacao >= mean(populacao)) %>% 
  count()

## EXERCÍCIO 2

# Considere os dados oficiais do TSE a respeito dos candidatos nas eleições de 2018
install.packages("electionsBR")
candidato_brasil <- electionsBR::elections_tse(2022, type = "candidate") %>% filter(DS_CARGO == "DEPUTADO FEDERAL")

# 1. Crie uma tabela somente com os dados dos nomes dos candidatos na urna, siglas dos partidos,
# estado por que se candidataram, estado em que nasceram, idade, sexo, raça e 
# grau de instrução, nessa ordem.
# 2. Quais partidos têm mais pretos ou pardos como candidatos?
# 3. Quais partidos têm mais mulheres como candidatas?
# 4. Quais partidos têm mais mulheres pretas como candidatas?
# 5. Quantos e quais candidatos se candidataram por um estado diferente daquele que nasceram?

candidato_resumo <- candidato_brasil %>% 
  select(NM_URNA_CANDIDATO, SG_PARTIDO, SG_UF, SG_UF_NASCIMENTO, NR_IDADE_DATA_POSSE,
         DS_GENERO, DS_COR_RACA, DS_GRAU_INSTRUCAO)

candidato_resumo %>% 
  filter(DS_COR_RACA == "PARDA" | DS_COR_RACA == "PRETA") %>% 
  group_by(SG_PARTIDO) %>% 
  reframe(DS_COR_RACA) %>% 
  count(SG_PARTIDO) %>% 
  arrange(desc(n))

candidato_resumo %>% 
  filter(DS_GENERO == "FEMININO") %>% 
  group_by(SG_PARTIDO) %>% 
  reframe(DS_GENERO) %>% 
  count(SG_PARTIDO) %>% 
  arrange(desc(n))

candidato_resumo %>% 
  filter(DS_COR_RACA == "PRETA" & DS_GENERO == "FEMININO") %>% 
  group_by(SG_PARTIDO) %>% 
  reframe(DS_COR_RACA, DS_GENERO) %>% 
  count(SG_PARTIDO) %>% 
  arrange(desc(n))

candidato_resumo %>% 
  filter(SG_UF != SG_UF_NASCIMENTO)

candidato_resumo %>% 
  filter(SG_UF != SG_UF_NASCIMENTO) %>% 
  count()
