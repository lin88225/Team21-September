import sqlite3
import csv

csv_file = 'flights_full.csv'
db_file = 'data.db'

conn = sqlite3.connect(db_file)
cursor = conn.cursor()

with open(csv_file, 'r') as file:
    reader = csv.reader(file)
    header = next(reader)
    columns = ', '.join(header)
    placeholders = ', '.join(['?' for _ in header])
    create_table_query = f'CREATE TABLE IF NOT EXISTS data ({columns});'
    cursor.execute(create_table_query)

    for row in reader:
        insert_query = f'INSERT INTO data VALUES ({placeholders});'
        cursor.execute(insert_query, row)

conn.commit()
conn.close()

print("CSV data has been successfully converted to SQL database.")
