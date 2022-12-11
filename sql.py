import psycopg2

class sqlFunctions():
    
    def __init__ (self):
        self.con = psycopg2.connect(database="project", user="postgres")
        self.cur  = self.con.cursor()
        self.con.commit()

    def getUsers(self):
        print("get users")
        self.cur.execute("select * from user_account;")
        return self.cur.fetchall()

    def addUser(self, fName, lName, email, username, password):
        try: 
            self.cur.execute(f'insert into user_account (fname, lname, email, username, password) values (\'{fName}\', \'{lName}\', \'{email}\', \'{username}\',\'{password}\');')
            self.con.commit()
        except Exception as e:
            print("Value not succesfully posted to database: ")
            print(e)

    def usernamePasswordComboExists(self, username, password):
        self.cur.execute(f'select 1 from user_account where username = \'{username}\' and password = \'{password}\';')
        return self.cur.fetchall() != []

    def getBooks(self):
        self.cur.execute("select * from book;")
        return self.cur.fetchall()

    def getBookById(self, isbn):
        self.cur.execute(f'select * from book where isbn = {isbn};')
        return self.cur.fetchall()

    def getGenres(self):
        self.cur.execute('select distinct genre from book;')
        return self.cur.fetchall()

    def getBookstores(self):
        self.cur.execute('select * from bookstore;')
        return self.cur.fetchall()
    
    def getBookstore(self, id):
        # print(id)
        self.cur.execute(f'select * from bookstore where bookstore_id = {id}')
        return self.cur.fetchall()

    def bookInBookStore(self, bookstore, isbn):
        self.cur.execute(f'select 1 from sells where bookstore_id = {bookstore} and isbn = {isbn}')
        return self.cur.fetchall() != []