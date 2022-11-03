# Importar conector mysql
import mysql.connector as connection
# Crear conexión a la db
db = connection.connect(host="localhost", database = 'database_ej3',user="root", passwd="",use_pure=True)
# Consulta
query = "SELECT * from table;"
# Realizar consulta y convertir el resultado en dataframe
df = pd.read_sql(query,db)
# Cerrar conexión
db.close()
df