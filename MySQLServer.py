import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server (without specifying a database)
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Papertrail1."  
    )

    if connection.is_connected():
        cursor = connection.cursor()

        # Create the database (if it doesn't already exist)
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print(f"Error connecting to MySQL or creating database: {e}")

finally:
    # Clean up and close connection
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
