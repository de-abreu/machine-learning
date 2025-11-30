# Aprendizado de Máquina

Exercícios desenvolvidos para a disciplina Aprendizado de Máquina aplicado a
Recursos Hídricos e Saneamento (SHS5984) ministrada pela Professora Doutora
Maria Mercedes Gamboa Medina.

## Autores

| Nome                       | nUSP     |
| :------------------------- | :------- |
| Débora da Silva Morais     | 15615790 |
| Guilherme de Abreu Barreto | 12543033 |

## Sumário

<!--toc:start-->

- [Resumo](#resumo)
- [Introdução](#introdução)
- [Configuração do ambiente e execução](#configuração-do-ambiente-e-execução)
  - [Carregamento dos dados](#carregamento-dos-dados)
  - [Instalação de dependências](#instalação-de-dependências)
    - [Usando DevEnv](#usando-devenv)
    - [Usando `pip`](#usando-pip)
  - [Execução](#execução)
- [Tarefas de Regressão](#tarefas-de-regressão)
  - [Pré-processamento dos dados](#pre-processamento-regressao)
    - [Seleção dos parâmetros](#seleção-dos-parâmetros)
    - [Carregamento do _dataset_](#carregamento-do-dataset)
  - [Aplicação das técnicas e resultados](#aplicacao-regressao)
    - [Regressão linear](#regressão-linear)
    - [kNN](#knn)
- [Tarefas de Classificação](#tarefas-de-classificação)
  - [Pré-processamento dos dados](#pre-processamento-classificacao)
  - [Aplicação das técnicas e resultados](#aplicacao-classificacao)
    - [Conjunto WDst1](#conjunto-wdst1)
    - [Conjunto WDst2](#conjunto-wdst2)
    - [Conjunto WDst3](#conjunto-wdst3)
    - [Conjunto WDst4](#conjunto-wdst4)
- [Conclusão](#conclusão)
- [Referências](#referências)
<!--toc:end-->

## Resumo

Neste relatório abordamos a exploração de técnicas de Aprendizado de Máquina
para a análise de um par de conjuntos de dados em tarefas de regressão e
classificação, no âmbito da hidrologia e da hidráulica. São abordadas as
técnicas: Regressão Linear, Regressão pelos k vizinhos mais próximos (_k-Nearest
Neighbors, kNN_), Árvore de Decisão, Classificador Naive Bayes, e Redes Neurais
Artificiais. A implementação destas técnicas, feita em linguagem Python com o
uso da biblioteca _sklearn_, dentre outras, encontra-se disponível em
repositório git [^1]. Aqui são explicadas em linhas gerais as implementações que
encontra-se detalhada nos notebooks presentes no referido repositório.

**Palavras-chave:** Aprendizado de Máquina, Regressão, Classificação,
Hidrologia, Rede de Distribuição de Água.

## Introdução

Conforme proposta de projeto para a disciplina, buscamos artigos no âmbito da
hidrologia ou hidráulica os quais houvessem abordado o uso de técnicas de
aprendizado de maquina, para que pudéssemos pautar nossos próprios experimentos
pelos resultados por estes descritos. Selecionamos a dois artigos, para abordar
tarefas de **regressão** e **classificação**, respectivamente.

O primeiro artigo selecionado foi _Supervised Machine Learning for Estimation of
Total Suspended Solids in Urban Watersheds_ [^2], o qual avalia a capacidade
preditiva de 8 diferentes abordagens de aprendizado de máquina buscando uma
alternativa à modelos tradicionais (empíricos e baseados em modelos físicos)
para estimativa do valor da Concentração Total de Sólidos Suspensos (_TSS
concentration_) depositados em corpos de água urbanos em decorrência de chuvas.
O conjunto de dados (_dataset_) utilizado por este artigo foi retirado a partir
do banco de dados _National Stormwater Quality Database (NSQD)_ [^3] em sua
versão 4.02 de 2015. Para este artigo, buscamos a reprodução da aplicação das
técnicas de Regressão Linear e Regressão kNN.

O segundo artigo selecionado foi _Novel approach for burst detection in water
distribution systems based on graph neural networks_ [^4], o qual busca
identificar a presença de vazamentos em séries temporais descritas em quatro
diferentes cenários simulados [^5] do funcionamento da rede de distribuição de
água _Modena_ [^6]. Para tal o autor explora o uso de uma técnica específica de
Rede Neural Artificial (RNA) denominada Rede Convolucional de Grafos (Graph
Convolucional Network, GCN). Para este artigo objetivamos o mesmo resultado, mas
utilizando-nos das técnicas de Árvore de Decisão, Classificador Naive Bayes, RNA
baseada em Perceptrons Multiníveis e Máquinas de Vetor Suporte (_Support Vector
Machines, SVM_).

Concluímos discutindo os resultados obtidos pelas diferentes técnicas, em
tarefas de regressão e classificação separadamente, e as dificuldades
encontradas para a reprodutibilidade dos experimentos tomados como referência.

## Configuração do ambiente e execução

### Carregamento dos dados

Usando o `git`, clone os arquivos de nosso repositório para seu computador:

```bash
git clone https://github.com/de-abreu/machine-learning.git
```

> [!TIP]
>
> [Instruções para a instalação do git](https://github.com/git-guides/install-git)

### Instalação de dependências

#### Usando DevEnv

> Recomendado

Para instalar as dependências deste projeto de forma isolada e temporária,
utilize o seguinte comando a partir da raiz do projeto:

```bash
devenv shell
```

Para acessar um ambiente virtual com todas as dependências instaladas.

> [!TIP]
>
> [Instruções para a instalação do DevEnv](https://devenv.sh/getting-started/)

#### Usando `pip`

Instale o gerenciador de pacotes python `pip` conforme as instruções para sua
distribuição e então execute a seguinte sequência de comandos:

```bash
# Criar ambiente virtual
python -m venv .venv

# Ativar ambiente virtual
# Linux/macOS:
source .venv/bin/activate
# Windows:
# .venv\Scripts\activate

# Instalar dependências
pip install -r requirements.txt
```

> [!TIP]
>
> Para desativar o ambiente virtual posteriormente, use:
>
> ```bash
> deactivate
> ```

### Execução

Execute o seguinte comando

```bash
jupyter notebook
```

E navegue para um dos _notebooks_ descritos neste relatório.

## Tarefas de Regressão

No artigo _Supervised Machine Learning for Estimation of Total Suspended Solids
in Urban Watersheds_ [^2] buscamos a realização de tarefas de regressão.
Inicialmente, na tentativa da reprodução dos experimentos abordados no artigo e,
em um segundo momento, com experimentos buscando melhorar o potencial preditivo
dos métodos descritos. Os _notebooks_ produzidos com esta finalidade foram:

1. [Regressão Linear com Uso da Terra](https://github.com/de-abreu/machine-learning/blob/main/01%20-%20Regress%C3%A3o%20Linear/Regress%C3%A3o%20Linear%20com%20Uso%20da%20Terra.ipynb);

2. [Regressão Linear com _Curve Number_](https://github.com/de-abreu/machine-learning/blob/main/01%20-%20Regress%C3%A3o%20Linear/Regress%C3%A3o%20Linear%20com%20Curve%20Number.ipynb);

3. [Regressão kNN](https://github.com/de-abreu/machine-learning/blob/main/02%20-%20Regress%C3%A3o%20kNN/Regress%C3%A3o%20com%20kNN.ipynb);

4. [Regressão kNN com kMeans Clustering](https://github.com/de-abreu/machine-learning/blob/main/07%20-%20kNN%20Clustering/kNN%20Clustering.ipynb).

E os critérios que utilizamos para avaliar a adequação do modelo foram:

- O uso de um gráfico _ y previsto versus. y real_, para inspeção visual do
  ajuste.

- O uso das métricas de desempenho

  - **coeficiente de determinação (R²)** para avaliar a proporção da variação
    vista nos dados que encontra-se representada no modelo preditivo. Possui
    intervalo (-∞, 1] e não possui unidade, onde:

    - 1 indica que a variância encontra-se representada completamente pelo
      modelo;

    - 0.75 indica que 75% da variância encontra-se representada no modelo;

    - 0 indica que o modelo é tão preciso quando seria consistentemente prever o
      valor médio;

    - Valores menores que 0 indicam que o modelo tem desempenho pior que sempre
      prever o valor médio.

  - **Raiz do Erro Médio Quadrado (_RMSE, Root Mean Squared Error_)** para
    avaliar a divergência (o erro), em média, entre os valores previstos e
    reais. Possui a mesma escala da variável dependente e possui intervalo [0, ∞
    ).

  - **Eficiência Nash-Sutcliffe (NSE)**, proposta pelo artigo, esta métrica
    possui mesma finalidade que o R², mas é mais amplamente usada no âmbito da
    hidrologia e modelos hidrológicos.

<h3 id="pre-processamento-regressao">Pré-processamento dos dados</h3>

#### Seleção dos parâmetros

Objetivamos estimar o valor da concentração total de sólidos suspensos em
miligramas por litro (TSS mg/L) na água da chuva captada pelos sistemas de
drenagem de diferentes centros urbanos nos Estados Unidos. O dataset fornecido
contém uma diversidade de dados hidrológicos dos quais apenas uma parte são
relevantes para esta análise. Conforme os autores, estes são:

- Fatores hidrológicos

  - **Nível da chuva:** Um dos principais fatores determinantes. Chuvas mais
    intensas tipicamente produzem maior escoamento e possuem maior energia para
    desprender e transportar sedimentos.

  - **Nível do escoamento:** Os sólidos suspensos são carregados pelo
    escoamento. O nível do escoamento combinado a área de drenagem nos permite
    calcular o volume do escoamento, que é um indicativo da energia disponível
    para carregar os sólidos

  - **Dias desde a última chuva:** Maiores intervalos entre chuvas permitem
    maior acúmulo de detritos e sedimentos passiveis de serem desprendidos na
    chuva seguinte.

- Fatores de drenagem

  - **Área de Drenagem**

  - **Impermeabilidade do solo:** superfícies impermeáveis são importantes
    contribuintes para o TSS, estas não absorvem poluentes e são um conduto
    pelos quais poluentes podem ser carregados ao sistema de drenagem.

  - **Uso da terra:** O _dataset_ descreve uma variedade de usos da terra, os
    quais são passíveis de impactar a concentração de detritos no solo.

Quanto ao uso da terra, o autor reduziu este a uma única variável de valor
contínuo em um procedimento o qual não foi por este explicado. Dentre as
variáveis encontradas no _dataset_ tem-se o **curve number** enquanto um
parâmetro empírico usado na hidrologia para prever o escoamento ou infiltração
do excesso de água da chuva em um dado terreno, dadas suas características. Por
isso, em um experimento tentamos usar esta variável enquanto indicativa do uso
da terra, enquanto nos demais experimentos utilizamos diretamente o percentual
do uso da terra para cada uma das categorias descritas com mais de um valor
distinto.

Além das variáveis descritas no artigo, fazemos uso das seguintes variáveis para
informar a estratificação das observações em função do contexto em que foram
tiradas:

- **Zona de chuva EPA:** Classificação numérica que agrupa regiões geográficas
  dos Estados Unidos de acordo com o comportamento da chuva.

- **Estação:** a estação climática do ano. Frequentemente esta implica em
  alterações nos comportamentos das chuvas.

#### Carregamento do _dataset_

Carregamos os dados em um _Data Frame_ em memória principal para análise. Neste,
todas as observações as quais possuíam valores faltantes foram descartadas,
restando apenas 536 amostras, um número ainda superior àquele declarado pelo
autor para seus experimentos: 530 amostras.

Nos notebooks 1 a 3, fizemos uso das variáveis categóricas **Zona de chuva** e
**Estação** para descartar a 3 amostras localizadas em regiões e climas onde
estas amostras eram as únicas observações tidas. Depois, removemos mais 3
observações que tinham um valor de TSS excessivamente alto.

No notebook 4, fizemos uso de uma abordagem mais sistemática, eliminando 6
_outliers_ conforme o critério da _distância de Mahalanobis_.

<h3 id="aplicacao-regressao">Aplicação das técnicas e resultados</h3>

Nos notebooks 1 a 3, buscamos a reprodução do experimento conforme este foi
descrito pelo artigo, ainda que sem fazer uso da ferramenta **Orange**[^11],
descrita pelos autores. Desta forma obtemos índices de desempenho para nossas
previsões piores que os mesmos relataram em seus experimentos, comparadas as
mesmas técnicas. No notebook 4 repetimos a aplicação da técnica kNN, entretanto,
fazendo antes o uso do PCA para redução de dimensionalidade e _kMeans_ para a
formação de Clusters. Desta maneria realizamos a aplicação do kNN sobre um
número reduzido de parâmetros e com hiperparâmetros ótimos locais, resultando em
significativo ganho de desempenho; ainda que sem alcançar as métricas descritas
no artigo. Tal ganho sugere que a ferramenta utilizada pelos autores
provavelmente dispõe de otimizações as quais não são especificadas no artigo,
por serem detalhes de implementação.

Outra mudança que adotamos dos notebooks 1 a 3 para o 4 se deu na forma de
relatar os resultados. Antes, relatamos as métricas em seus valores médio e
desvio padrão considerando os diferentes _folds_ na validação cruzada. Em
seguida, passamos a exibir o resultado agregado, considerando o resultado total
de todos os _folds_.

#### Regressão linear

| Métrica | Artigo\* | Com Uso da Terra | Com _Curve Number_ |
| :------ | -------: | ---------------: | -----------------: |
| R²      |     0.29 |  0.0441 ± 0.0665 |    0.0568 ± 0.0414 |
| RMSE    |      210 |  9.1132 ± 0.3954 |   15.9987 ± 0.0414 |
| NSE     |     0.27 |  0.0441 ± 0.0665 |    0.0568 ± 0.0414 |

> \*: Considerando o desempenho descrito para a etapa de teste

#### kNN

| Métrica | Artigo\* | Sem Clustering ou PCA | Com Clustering e PCA |
| :------ | -------: | --------------------: | -------------------: |
| R²      |     0.77 |       0.1970 ± 0.0522 |                0.455 |
| RMSE    |      110 |     111.0659 ± 5.5551 |               266.54 |
| NSE     |     0.75 |       0.1970 ± 0.0522 |                0.455 |

> \*: Considerando o desempenho descrito para a etapa de teste e a aplicação do
> kNN com pesos variáveis (_variable weighting_) [^1]:

## Tarefas de Classificação

Para o artigo _Novel approach for burst detection in water distribution systems
based on graph neural networks_[^4], objetivamos a realização de tarefas de
classificação. Os notebooks referentes a cada uma destas tarefas são:

5. [Classificação (referente ao pré-processamento dos dados)](https://github.com/de-abreu/machine-learning/blob/main/03%20-%20Classifica%C3%A7%C3%A3o/Modena.ipynb)

6. [Árvore de Decisão](https://github.com/de-abreu/machine-learning/blob/main/04%20-%20%C3%81rvore%20de%20Decis%C3%A3o/%C3%81rvore_de_Decis%C3%A3o.ipynb)

7. [Naive Bayes](https://github.com/de-abreu/machine-learning/blob/main/05%20-%20Naive%20Bayes/Classificador%20Naive%20Bayes.ipynb)

8. [Redes Neurais Artificiais](https://github.com/de-abreu/machine-learning/blob/main/06%20-%20Redes%20Neurais%20Artificiais/Redes%20Neurais%20Artificiais.ipynb)

9. [Máquinas de Vetor Suporte](https://github.com/de-abreu/machine-learning/blob/main/08%20-%20Support%20Vector%20Machines/M%C3%A1quinas%20de%20Vetor%20Suporte.ipynb)

Os critérios que utilizamos para avaliar a adequação do modelo foram:

- **Matriz de confusão:** Dado o modelo melhor ajustado, exibe a taxa percentual
  de suas predições que correspondem às categorias de verdadeiro positivo (_True
  Positive, TP_), verdadeiro negativo (_True Negative, TN_), falso positivo e
  falso negativo.

- **Curva ROC:** Dada a probabilidade de classificação de cada amostra como
  sendo da classe verdadeira (neste caso para a presença de vazamentos) e um
  limiar de decisão que vai de 0% a 100% para aceitar a classificação como sendo
  verdadeira, desenha uma curva que representa a relação entre a taxa de
  verdadeiros positivos versus a taxa de verdadeiros negativos para os
  diferentes limiares (pontos na curva).

- E o uso das métricas de desempenho

  - **F1 score:** trata-se de uma métrica otimizada para classificações
    binárias, a qual apresenta correção para conjuntos de dados cujas classes
    encontram-se desbalanceadas.

  - **Área sob a Curva ROC (Area Under Curve, AUC):** Representa a taxa de
    verdadeiros positivos versus falsos positivos para os diversos limiares de
    decisão.

<h3 id="pre-processamento-classificacao">Pré-processamento dos dados</h3>

Tido que os dados deste artigo são em sua totalidade sintéticos, não houve a
necessidade de filtragem dos mesmos. Buscamos mesmo conferir a possibilidade de
outros dados serem proveitosos, os quais não estivessem inclusos na seleção de
parâmetros feita pelos autores. Não obstante, encontramos que os nós da rede no
modelo de Modena seguia uma indexação diferente daquela usada pelos autores, de
tal forma não ser possível correlacionar as leituras com os nós da rede para os
quais estas foram simuladas. Assim sendo, tivemos de recorrer a usar a mesma
seleção de leituras que os autores. Senão pelo notebook 9, onde aplicamos o PCA
para a redução de dimensionalidade, as leituras dos nós são utilizadas
diretamente enquanto parâmetros para o treinamento e teste dos diferentes
modelos.

<h3 id="aplicacao-classificacao">Aplicação das técnicas e resultados</h3>

O conjunto de dados descrito pelo artigo de referência encontra-se separado em
quatro "cenários" numerados de 1 a 4 com amostras crescentemente heterogêneas.
Para cada modelo, a seleção de hiperparâmetros em cada um destes cenários foi
feita de maneira independente. Em sua maioria, utilizamo-nos do recurso
[`GridSearchCV`](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.GridSearchCV.html)
para testar a todas as possíveis combinações de hiperparâmetros dentre uma
seleção destes. As exceções a esta regra foram as técnicas Naive Bayes, que não
possui hiperparâmetros a serem configurados e a técnica Máquina de Vetor Suporte
(SVM), que possuia tantas combinações de hiperparâmetros ao ponto de ser
impraticável testar a todas elas. Para tal, fizemos uso do recurso
[`HalvingGridSearchCV`](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.HalvingGridSearchCV.html#sklearn.model_selection.HalvingGridSearchCV)
que trata-se de uma heurística para encontrar uma configuração de
hiperparâmetros com relativo bom desempenho, mas que não é necessariamente a
configuração ótima. Também é importante destacar que apenas para a técnica SVM
foi feito uso de redução de dimencionalidade com o PCA.

Ao final atestou-se uma gradação do desempenho entre as técnicas, como se vê nas
tabelas abaixo (note a falta da métrica F1 para o método MLP, isso se deve ao
fato deste valor não ter sido armazenado no respectivo notebook). Tem-se também
que técnicas de maior desempenho necessitaram de maior tempo de processamento,
onde o resultado para a técnica Naive Bayes é quase instantâneo, enquanto para a
técnica MLP toma quase duas horas para ser produzido.

#### Conjunto WDst1

| Métrica  | Naive Bayes |    SVM | Árvore de Decisão |    MLP |
| :------- | ----------: | -----: | ----------------: | -----: |
| F1 score |      0.1382 | 0.3758 |            0.7965 |      - |
| AUC      |      0.5539 | 0.8523 |            0.8837 | 0.9916 |
| TP (%)   |       44.54 |  67.91 |             76.08 |  83.97 |
| TN (%)   |       68.33 |  87.79 |             99.06 |  99.92 |

#### Conjunto WDst2

| Métrica  | Naive Bayes |    SVM | Árvore de Decisão |    MLP |
| :------- | ----------: | -----: | ----------------: | -----: |
| F1 score |      0.1211 | 0.3221 |            0.7523 |      - |
| AUC      |      0.5562 | 0.8386 |            0.8729 | 0.9945 |
| TP (%)   |       24.24 |  59.09 |             73.33 |  87.50 |
| TN (%)   |       85.06 |  88.65 |             99.13 |  99.73 |

#### Conjunto WDst3

| Métrica  | Naive Bayes |    SVM | Árvore de Decisão |    MLP |
| :------- | ----------: | -----: | ----------------: | -----: |
| F1 score |      0.1263 | 0.2520 |            0.6982 |      - |
| AUC      |      0.5617 | 0.8071 |            0.8356 | 0.9971 |
| TP (%)   |       36.73 |  55.58 |             66.92 |  92.31 |
| TN (%)   |       73.74 |  86.15 |             98.58 | 100.00 |

#### Conjunto WDst4

| Métrica  | Naive Bayes |    SVM | Árvore de Decisão |    MLP |
| :------- | ----------: | -----: | ----------------: | -----: |
| F1 score |      0.1083 | 0.2244 |            0.6805 |      - |
| AUC      |      0.5353 | 0.7809 |            0.8348 | 0.9963 |
| TP (%)   |       41.57 |  52.41 |             65.45 |  88.74 |
| TN (%)   |       63.92 |  84.81 |             98.49 |  99.92 |

## Conclusão

O presente trabalho explorou a aplicação de técnicas de Aprendizado de Máquina
em problemas de recursos hídricos e saneamento, abrangendo tarefas de regressão
para qualidade da água e classificação para detecção de falhas em redes de
distribuição.

Nas tarefas de regressão, voltadas à estimativa de Sólidos Suspensos Totais
(TSS), constatou-se a dificuldade em reproduzir exatamente as métricas de
desempenho do artigo de referência utilizando apenas as técnicas básicas
descritas. Entretanto, a evolução dos experimentos demonstrou que o
pré-processamento refinado dos dados é crucial; a aplicação conjunta de redução
de dimensionalidade (PCA) e clusterização (kMeans) antes da regressão KNN
resultou em ganhos significativos de desempenho preditivo, sugerindo que o
sucesso dos modelos depende tanto da escolha do algoritmo quanto do tratamento
das variáveis.

Nas tarefas de classificação, focadas na detecção de vazamentos em redes de
distribuição, observou-se uma gradação clara de desempenho entre as técnicas.
Houve um _trade-off_ evidente entre custo computacional e acurácia: o método
Naive Bayes provou-se extremamente rápido, mas com métricas de avaliação
inferiores, enquanto as Redes Neurais Artificiais (MLP) apresentaram o melhor
desempenho global em todos os cenários simulados, custando, contudo, um tempo de
processamento significativamente maior.

Por fim, o estudo evidencia a desafios práticos na reprodutibilidade científica
no âmbito da hidrologia, e as trocas entre desempenho e computabilidade das
diferentes técnicas de aprendizado de máquina.

## Referências

[^1]:
    ABREU, G.; MORAIS. de-abreu/machine-learning. , 20 out. 2025. Disponível em:
    <https://github.com/de-abreu/machine-learning>. Acesso em: 9 nov. 2025

[^2]:
    MOEINI, M.; SHOJAEIZADEH, A.; GEZA, M. Supervised Machine Learning for
    Estimation of Total Suspended Solids in Urban Watersheds. Water, v. 13, n.
    2, p. 147, 10 jan. 2021.

[^3]:
    National Stormwater Quality Database. Disponível em:
    <https://bmpdatabase.org/national-stormwater-quality-database>. Acesso em: 9
    nov. 2025.

[^4]:
    ZANFEI, A. et al. Novel approach for burst detection in water distribution
    systems based on graph neural networks. Sustainable Cities and Society, v.
    86, p. 104090, 1 nov. 2022.

[^5]:
    ARIELEZANFEI.
    ArieleZanfei/generated-datasets-for-burst-detection-in-water-distribution-systems.
    , 11 nov. 2025. Disponível em:
    <https://github.com/ArieleZanfei/generated-datasets-for-burst-detection-in-water-distribution-systems>.
    Acesso em: 30 nov. 2025

[^6]: HALL, Ashley. Modena. International Systems, 1 jan. 2021.
