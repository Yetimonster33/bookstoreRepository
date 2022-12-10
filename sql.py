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

    def getBooks(self):
        self.cur.execute("select * from book;")
        return self.cur.fetchall()

    def getBookById(self, isbn):
        self.cur.execute(f'select * from book where isbn = {isbn};')
        return self.cur.fetchall()

    def getGenres(self):
        self.cur.execute('select distinct genre from book;')
        return self.cur.fetchall()