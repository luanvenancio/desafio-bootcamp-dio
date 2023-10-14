# -*- coding: utf-8 -*-
"""mercado_financeiro.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1ZYNf_E1D4nLzBZPm1aH1IyCEl0NWCi9S
"""

!pip install yfinance --upgrade --no-cache-dir

"""# 1. Extract

"""

import yfinance as yf

santander = yf.Ticker("SANB11.SA")

"""# 2. Transform"""

# Pega ações no periodo de apenas um ano, exclui as colunas 'Dividends' e 'Stock Splits' e remove qualquer coluna vazia
df = santander.history(period="1y")
df = df.drop(['Dividends', 'Stock Splits'], axis=1)
df = df.dropna()
df

# Commented out IPython magic to ensure Python compatibility.
# Cria Gráfico da cotação de fechamento das ações do Santander
from matplotlib import pyplot as plt

# %matplotlib inline
plt.plot(df['Close'], label= santander.info['symbol'])
plt.xlabel('Data')
plt.ylabel('Cotação de Fechamento ({0})'.format(santander.info['currency']))
plt.legend()
plt.show()

# Cria Gráfico Candlestick das ações do Santander
import plotly.graph_objects as go

fig = go.Figure(data=[go.Candlestick(x=df.index,
                                     open=df['Open'],
                                     high=df['High'],
                                     low=df['Low'],
                                     close=df['Close'])])

fig.show()

"""# 3. Load"""

pip install -U kaleido

# Salva Gráfico Candlestick em uma imagem .png
fig.write_image("santander_acoes_candlestick.png", engine="kaleido")