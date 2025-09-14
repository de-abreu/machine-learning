# Resenha de artigo abordando aprendizado de máquina no âmbito da hidrologia

No artigo
[Supervised Machine Learning for Estimation of Total Suspended Solids in Urban Watersheds](https://www.mdpi.com/2073-4441/13/2/147)
(ou "Aprendizado Supervisionado para Estimação do Total de Sólidos Suspensos em
Corpos de Água Urbanos") os autores Moeini, Shojaeizadeh e Geza avaliam a
capacidade preditiva de 8 diferentes abordagens de aprendizado de máquina
(_Machine Learning, ML_), buscando uma alternativa à modelos tradicionais
(empíricos e baseados em modelos físicos) para estimativa do valor da
Concentração Total de Sólidos Suspensos (_TSS concentration_), depositados em
corpos de água urbanos.

Este artigo foi escolhido por abordar comparativamente muitas das técnicas
descritas na ementa da disciplina e no contexto pertinente da hidrologia,
fazendo uso de um banco de dados no domínio público. São as abordagens
consideradas:

- _Linear Regression, LR_
- _k-Nearest Neighbor_
  - _Uniform Weighting, UWkNN_
  - _Variable Weighting, VWkNN_
- _Support Vector Regression, SVR_
- _Artificial Neural Network, ANN_
- _Regression Tree, RT_
- _Random Forest, RF_
- _Adaptive Boosting, AdB_

## Materiais e Métodos

### Fonte dos Dados

Foi utilizado o Banco de Dados (BD)
[_National Stormwater Quality Database (NSQD)_ em sua versão 4.02 de 2015](https://bmpdatabase.org/national-stormwater-quality-database)
para obtenção dos parâmetros de entrada dos modelos. Este trata-se de uma
compilação de outros BDs, construídos por 66 agências em 17 diferentes estados
dos Estados Unidos. Neste foram selecionados registros os quais descrevem, além
do TSS, os seguintes parâmetros a serem utilizados enquanto entradas dos
modelos:

- Área de dreno, em km²
- Uso da terra, dada em percentual de cada categoria descrita
- Impermeabilidade, dado no percentual da área avaliada que é impermeável
- Dias anteriores sem chuva
- Índice pluviométrico, dado em milímetros
- Volume de escoamento, dado em m³

## Estrutura do experimento

- Utilizou-se o software [Orange](https://orangedatamining.com) para manejo de
  todos os modelos;
- 2 terços dos registros válidos foram utilizados na fase de treinamento do
  modelos, enquanto demais amostras para teste do modelos;
- Utilizou-se as métricas R²,
  [Nash–Sutcliffe Efficiency coefficient(NSE)](https://en.wikipedia.org/wiki/Nash%E2%80%93Sutcliffe_model_efficiency_coefficient)
  e
  [Raiz do Erro Quadrático Médio](https://pt.wikipedia.org/wiki/Erro_quadr%C3%A1tico_m%C3%A9dio)
  para avaliar o resultados das predições dos modelos

- Ao final realiza-se uma análise de sensibilidade para se averiguar os
  parâmetros que mais impactam o resultado do modelo de melhor desempenho
