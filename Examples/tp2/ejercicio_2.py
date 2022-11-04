import pandas as pd
import requests
import numpy as np
import os
import matplotlib.pyplot as plt
# %matplotlib inline
# inline hace que muestre los graficos en el notebook, sino se crearía un archivo aparte
import seaborn as sns

# Leer y obtener el dataset
df2 = pd.read_csv('data/echocardiogram.data', delimiter=",", header=None)
df2.columns = ["survival","still-alive","age-at-heart-attack","pericardial-effusion","fractional-shortening","epss","lvdd","wall-motion-score","wall-motion-index","mult","name","group","alive-at-1"]
print(df2)

# Analizar naturaleza y distribucion de los datos faltantes
print(df2.dtypes)

valor = ["?"]
faltantes = []  # lista
for columna in df2.columns:
    atributo = {}  # tupla
    atributo["columna"] = columna
    # Obtener promedio de valores nulos para la columna
    atributo["porcentaje"] = np.mean(df2[columna].isin(valor))*100  # multiplica x 100 porque es porcentje
    # Obtener cantidad de valores nulos para la columna
    atributo["cantidad"] = np.sum(df2[columna].isin(valor))
    faltantes.append(atributo)  

# Convertir lista de diccionarios en dataframe
faltantes_df2 = pd.DataFrame(faltantes)

print(faltantes_df2)

# Metodo para tratar los datos faltantes
df_sin_muestras = df2.copy(deep = False)
# Obtener índices de muestras con más de dos atributos faltantes
faltantes_index = df_sin_muestras[df_sin_muestras['alive-at-1'] == '?'].index
# Eliminar esos índices de el dataframe
df_sin_muestras = df_sin_muestras.drop(faltantes_index, axis=0)
# para columna mult
df_sin_muestras.drop("mult",inplace=True, axis=1)
print(df_sin_muestras)