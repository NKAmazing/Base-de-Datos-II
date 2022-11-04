import pandas as pd
import requests
import numpy as np
import os
import matplotlib.pyplot as plt
# %matplotlib inline
import seaborn as sns

# Leer Csv
df = pd.read_csv(r'sponge.data', delimiter = ",")

print(df)

# Ver tipo de atributos
print(df.dtypes)

# seleccionamos los faltantes, reemplazando los "?", utilizamos este metodo al encontrar missing values en Python.
faltantes =[]
# buscamos por columna
for column in df.columns:
    item = {}
    # igualamos las columnas
    item["column"] = column
    # pasamos a df el tipo como dato
    item["type"] = df[column].dtypes
    # sacamos el porcentaje de la columna faltante x 100
    item["percentage"] = np.mean(df[column] == "?")*100
    # sumamos la columna cantidad faltante
    item["quantity"] = np.sum(df[column] == "?")
    # agregamos los cambios
    faltantes.append(item)

# creamos el dataframe nuevo con pandas
faltantes_df = pd.DataFrame(faltantes)
# llamamos
print(faltantes_df)

# agrupamos los datos faltantes que tenga porcentaje mayor a 0
missing_df = faltantes_df.loc[faltantes_df["percentage"] > 0]
print(missing_df)