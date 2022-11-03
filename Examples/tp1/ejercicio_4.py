import requests
import pandas as pd

countryCode = "AR"
year = 2022

url = f"https://date.nager.at/api/v3/PublicHolidays/{year}/{countryCode}"

r = requests.get(url)
data = r.json()

df = pd.DataFrame(data)

print(df)