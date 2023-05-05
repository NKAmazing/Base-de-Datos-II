import requests
import pandas as pd

url = "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/Albert_Einstein/daily/20220101/20221229"
header = {'user-agent': "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"}


r = requests.get(url, headers=header)

# Convertir JSON a diccionario

data = r.json()

df = pd.DataFrame(data["items"])

print(df)