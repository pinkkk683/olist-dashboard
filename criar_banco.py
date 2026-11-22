import sqlite3
from pathlib import Path
import pandas as pd

pasta = Path("dados")
con = sqlite3.connect("olist.db")

for csv in pasta.glob("*.csv"):
    nome = csv.stem.replace("olist_", "").replace("_dataset", "")
    pd.read_csv(csv).to_sql(nome, con, if_exists="replace", index=False)
    print("carregado:", nome)

con.close()