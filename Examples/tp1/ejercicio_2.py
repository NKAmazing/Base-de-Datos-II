import requests
import pandas as pd

r = requests.get("https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/Albert_Einstein/daily/20220101/20221229")
# Convertir JSON a diccionario

data = r.json()

df = pd.DataFrame(data)

print(df)