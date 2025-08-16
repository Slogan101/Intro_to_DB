import mysql.connector

# Replace with your connection details
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Papertrail1.",
    database="alx_book_store"
)

print(mydb.server_info)

cursor = mydb.cursor()


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Authors(
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        author_name VARCHAR(215)

    );
    """
)

cursor.execute("""
    CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
"""
)


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(215),
        email VARCHAR(215),
        address TEXT
    );
    """
)

cursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
    """
)


cursor.execute("""
    CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
        quantity DOUBLE,
        order_id INT,
        book_id INT,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
    );
    """
)