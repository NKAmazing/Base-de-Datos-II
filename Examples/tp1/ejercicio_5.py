import pandas as pd

url = "https://es.wikipedia.org/"

tables = pd.read_html(url, header=0, index_col=0)

print(tables)