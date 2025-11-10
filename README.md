# Aprendizado de Máquina

> Exercícios desenvolvidos para a disciplina Aprendizado de Máquina aplicado a
> Recursos Hídricos e Saneamento (SHS5984) ministrada pela Professora Doutora
> Maria Mercedes Gamboa Medina.

## Autores

| Nome                       | nUSP     |
| :------------------------- | :------- |
| Débora da Silva Morais     | 15615790 |
| Guilherme de Abreu Barreto | 12543033 |

## Sumário

## Resumo

Neste relatório abordamos a exploração de técnicas de Aprendizado de Máquina
para a análise de um par de conjuntos de dados em tarefas de regressão e
classificação, no âmbito da hidrologia e da hidráulica. São abordadas as
técnicas: Regressão Linear, Regressão pelos k vizinhos mais próximos (_k-Nearest
Neighbors, kNN_), Árvore de Decisão, Classificador Naive Bayes, e Redes Neurais
Artificiais. A implementação destas técnicas, feita em linguagem Python com o
uso da biblioteca _sklearn_, dentre outras, encontra-se disponível em
repositório git [^1].

**Palavras-chave:** Aprendizado de Máquina, Regressão, Classificação,
Hidrologia, Rede de Distribuição de Água.

## Introdução

Conforme proposta de projeto para a disciplina, buscamos artigos no âmbito da
hidrologia ou hidráulica os quais houvessem abordado o uso de técnicas de
aprendizado de maquina, para que pudéssemos pautar nossos próprios experimentos
pelos resultados por estes descritos. Selecionamos a dois artigos, para abordar
tarefas de regressão e classificação, respectivamente.

O primeiro artigo selecionado foi _Supervised Machine Learning for Estimation of
Total Suspended Solids in Urban Watersheds_ [^2], o qual avalia a capacidade
preditiva de 8 diferentes abordagens de aprendizado de máquina buscando uma
alternativa à modelos tradicionais (empíricos e baseados em modelos físicos)
para estimativa do valor da Concentração Total de Sólidos Suspensos (_TSS
concentration_) depositados em corpos de água urbanos em decorrência de chuvas.
Os dados utilizados por este foram retirados a partir do banco de dados
_National Stormwater Quality Database (NSQD)_ [^3] em sua versão 4.02 de 2015
para obtenção dos parâmetros de entrada dos modelos. Para este, buscamos a
reprodução da aplicação das técnicas de Regressão Linear e Regressão kNN.

O segundo artigo selecionado foi _Novel approach for burst detection in water
distribution systems based on graph neural networks_ [^4], o qual busca
identificar a presença de vazamentos em séries temporais descritas em quatro
diferentes cenários simulados do funcionamento da rede de distribuição de água
_Modena_ [^5]. Para tal o autor explora o uso de uma técnica específica de Rede
Neural Artificial (RNA) denominada Rede Convolucional de Grafos (Graph
Convolucional Network, GCN). Para este artigo objetivamos o mesmo resultado, mas
utilizando-nos das técnicas de Árvore de Decisão, Classificador Naive Bayes e
uma RNA baseada em Perceptrons Multiníveis.

Concluímos discutindo os resultados obtidos pelas diferentes técnicas, em
tarefas de regressão e classificação separadamente, e as dificuldades
encontradas para a reprodutibilidade dos experimentos tomados como referência.

## Configuração do ambiente e execução

Para todos nossos experimentos fizemos uso das bibliotecas python descritas em
nosso repositório [^6]

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

[^5]: HALL, Ashley. Modena. International Systems, 1 jan. 2021.

[^6]:
    machine-learning/requirements.txt at main · de-abreu/machine-learning.
    Disponível em:
    <https://github.com/de-abreu/machine-learning/blob/main/requirements.txt>.
    Acesso em: 10 nov. 2025.
