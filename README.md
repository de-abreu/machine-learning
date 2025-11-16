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

- Regressão Linear com _Curve Number_[^7];

- Regressão Linear com Uso da Terra[^8];

- Regressão Linear com kNN[^9].

Em seguida descrevemos em linhas gerais as análises que nestes encontra-se
detalhada.

### Pré-processamento de dados

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

  - **Uso da terra:** O dataset descreve uma variedade de usos da terra, os
    quais são passíveis de impactar a concentração de detritos no solo.

Quanto ao uso da terra, o autor reduziu este a uma única variável de valor
contínuo em um procedimento o qual não foi por este explicado. Dentre as
variáveis encontradas no dataset tem-se o **curve number** enquanto um parâmetro
empírico usado na hidrologia para prever o escoamento ou infiltração do excesso
de água da chuva em um dado terreno, dadas suas características. Por isso, em um
experimento tentamos usar esta variável enquanto indicativa do uso da terra,
enquanto em um segundo experimento utilizamos diretamente o percentual do uso da
terra para cada uma das categorias descritas com mais de um valor distinto.

Além das variáveis descritas no artigo, fazemos uso das seguintes variáveis para
informar a estratificação das observações em função do contexto em que foram
tiradas:

- **Zona de chuva EPA:** Classificação numérica que agrupa regiões geográficas
  dos Estados Unidos de acordo com o comportamento da chuva.

- **Estação:** a estação climática do ano. Frequentemente esta implica em
  alterações nos comportamentos das chuvas.

#### Carregamento do _dataset_

Nos notebooks

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
