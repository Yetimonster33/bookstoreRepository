import PySimpleGUI as sg
import datetime
import sql
from screeninfo import get_monitors

connection = sql.sqlFunctions()

screenX = 1000
screenY = 600
for m in get_monitors():
  if (m.is_primary):
    screenX = m.width - 100
    screenY = m.height - 100

def main():
  # print(connection.usernamePasswordComboExists('', ''))
  # runAuthenticationPage()
  # runSignUpPage("")
  runSearchPage("", "None", -1)

def runAuthenticationPage():
  window = refreshWindow([[sg.Text("Username: ", size=(15,1)), sg.Input("", key="UserName", size=(50,1)), sg.Text("Password: ", size=(15, 1)), sg.Input("", key="Password", size=(50,1))],
                          [sg.Text("", size=(15,1)), sg.Button("Sign in as user", key="UserSignIn", size = (49,1)), sg.Text("",size=(15,1)), sg.Button("Sign in as owner", key="OwnerSignIn", size=(49,1)), sg.Push()],
                          [sg.Text("", size=(15,1)), sg.Button("Sign Up", key="UserSignUp", size = (119,1))]], [], -1)

  while True: 
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      window.close()
      exit()
    if(event=="UserSignIn"):
      if(connection.usernamePasswordComboExists(window["UserName"].get(), window["Password"].get())): break
    if(event=="UserSignUp"):
      window.close()
      runSignUpPage("")
      break

  window.close()

def runSignUpPage(type):
  if(type == "user"):
    window = refreshWindow([[sg.Text("First Name: "), sg.Push(), sg.Input("1", key="fname", size = (50,1))],
                          [sg.Text("Last Name: "), sg.Push(), sg.Input("1", key="lname", size = (50,1))],
                          [sg.Text("Email: "), sg.Push(), sg.Input("abc@gmail.com", key="email", size = (50,1))],
                          [sg.Text("Username: "), sg.Push(), sg.Input("un", key="uname1", size = (50,1))],
                          [sg.Text("Username(verify): "), sg.Push(), sg.Input("un", key="uname2", size = (50,1))],
                          [sg.Text("Password: "), sg.Push(), sg.Input("asdfgH123$", key="password1", size = (50,1))],
                          [sg.Text("Password(verify): "), sg.Push(), sg.Input("asdfgH123$", key="password2", size = (50,1))],
                          [sg.Button("Sign Up: ", key="Sign Up"), sg.Button("Go Back", key="Go Back"), sg.Button("Switch to owner sign up", key="ownersu")]], [])
  elif(type == "owner"):
    window = refreshWindow([[sg.Text("Location: "), sg.Push(), sg.Input("1", key="fname", size = (50,1))],
                          [sg.Text("First Name: "), sg.Push(), sg.Input("1", key="lname", size = (50,1))],
                          [sg.Text("Last Name: "), sg.Push(), sg.Input("abc@gmail.com", key="email", size = (50,1))],
                          [sg.Text("email: "), sg.Push(), sg.Input("un", key="uname1", size = (50,1))],
                          [sg.Text("Username: "), sg.Push(), sg.Input("un", key="uname1", size = (50,1))],
                          [sg.Text("Username(verify): "), sg.Push(), sg.Input("un", key="uname2", size = (50,1))],
                          [sg.Text("Password: "), sg.Push(), sg.Input("asdfgH123$", key="password1", size = (50,1))],
                          [sg.Text("Password(verify): "), sg.Push(), sg.Input("asdfgH123$", key="password2", size = (50,1))],
                          [sg.Button("Sign Up: ", key="Sign Up"), sg.Button("Go Back", key="Go Back"), sg.Button("Switch to user sign up", key="usersu")]], [])
  else: 
    window = refreshWindow([[sg.Button("Go Back", key="Go Back"), sg.Button("User Sign Up", key="usersu"), sg.Button("Owner Sign Up", key="ownersu")]], [])
    

  while(1):
    event, results = window.read()

    if (event == sg.WIN_CLOSED):
      window.close()
      exit()
    if(event == "usersu"):
      window.close()
      runSignUpPage("user")
    if(event == "ownersu"):
      window.close()
      runSignUpPage("owner")
    if (event == "Sign Up" and type == "user "):
      if(validatePassword(results["password1"], results["password2"]) and validateUsername(results["uname1"], results["uname2"])):
        connection.addUser(results["fname"], results["lname"], results["email"], results["uname1"], results["password1"])
        if(not connection.usernamePasswordComboExists(results["password1"], results["uname1"])):
          print("Server side error or rejection of values, likely duplicate entry")
      else: 
        print("Local username and password validation failed (check that both inputs are equivelant and password > 8 character, containing a special char and capital letter)")
    if (event == "Sign Up" and type == "owner"):
      continue

    if(event == 'Go Back'):
      window.close()
      runAuthenticationPage()
      
def runOrderPage(bookstore):
  layout = [[sg.Button("Enter Order Number", size=(20,1)), sg.Input("",key="enterOrder")]]
  window = refreshWindow(layout, [generateMenuBar(bookstore)])
  while True:
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      break

def runCartPage(bookstore):
  layout = []
  window = refreshWindow(layout, [generateMenuBar(bookstore)])
  while True:
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      break

def runSearchPage(search, genre, bookstore):
  curr_bookstore = bookstore
  layout = [[sg.Text("Search By Author, ISBN, or Title: "), sg.Push(), sg.Input("",size=(40,1), key=("-SearchBar-")), sg.Push(), sg.Button("Search: ", key=("Search"))], 
  [sg.Column(generateBooks(search, genre, curr_bookstore),scrollable=True,vertical_scroll_only=True, size=(400, screenY/2)), sg.Push(), sg.VerticalSeparator(), 
  sg.Column(generateRadioOptions())  ]]

  # RENDER HERE
  window = refreshWindow(layout, [generateMenuBar(curr_bookstore), generateBookstores()])
  while True: 
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      break

    if("BOOK" in event):
      page = getBookDataPage(event[4:])
      if (page == None): continue
      window.close()
      # RENDER HERE
      window = refreshWindow(page, [generateMenuBar(curr_bookstore), generateBookstores()])
   
    if("BookstoreButton" in event):
      key=event[15:]
      window.close()
      if(key=="All"):key=-1
      runSearchPage("", "None", int(key))

    if(event == "Order Status"):
      window.close()
      runOrderPage(curr_bookstore)
   
    if(event == "Cart"):
      window.close()
      runCartPage(curr_bookstore)
   
    if(event=="Logout"):
      window.close()
      main()

    if (event == "Home"):
      window.close()
      runSearchPage("", "None", curr_bookstore)

    if (event == "Search"):
      genre = "None"
      search=window["-SearchBar-"].get()
      genres = connection.getGenres()
      for i in genres:
        if (window[f'GenreButton{i[0]}'].get()):
          genre=i[0]
      window.close()
      runSearchPage(search, genre, curr_bookstore)

  window.close()

def refreshWindow(replacement, topElements):
  layout = [[sg.Column(replacement)]]
  place = 0
  for i in topElements:
    layout.insert(place, i)
    place = place + 1
  return sg.Window("Window", layout = layout, size = (screenX, screenY))          

def getBookDataPage(isbn):
  book = connection.getBookById(isbn)
  if (book == [] or book == None or book[0] == None): return None
  book=book[0]
  if(book[3] == None): date = ""
  else: date = str(book[3].year) + "-" + str(book[3].month) + "-" + str(book[3].day)
  return [[sg.Text("ISBN: "), sg.Push(), sg.Text(book[0], size=(85,1))], [sg.Text("Title: "), sg.Push(), sg.Text(book[1], size=(85,1))], [sg.Text("Price: "), sg.Push(), sg.Text(f'${book[2]:.2f}', size=(85,1))], [sg.Text("Publication Date: "), sg.Push(), sg.Text(date, size=(85,1))], [sg.Text("Genre: "), sg.Push(), sg.Text(book[4], size=(85,1))], [sg.Text("Author: "), sg.Push(), sg.Text(book[5], size=(85,1))], [sg.Text("Publisher: "), sg.Push(), sg.Text(book[7], size=(85,1))], [sg.Text(book[6], size=(85,15))]]

def generateMenuBar(bookstore):
  bookstore_info = connection.getBookstore(bookstore)
  return [sg.Button('Home'), sg.Button('Logout'), sg.Button('Cart'), sg.Button('Order Status'), sg.Text(f'Current Location: {"None" if  bookstore_info == [] else bookstore_info[0][2]}')]

def generateBooksPage():
  books=connection.getBooks()
  booksPage = []
  for i in books:
    booksPage.append([sg.Button(f'{i[1]} by {i[5]}' , key="BOOK"+f'{i[0]}')])
  return booksPage

def generateBooks(search, genre, bookstore):
  books=connection.getBooks()
  booksPage = []
  for i in books:
    if((search in i[1] or search in i[5] or search in str(i[0])) and (i[4] == genre or genre == "None") and (bookstore == -1 or connection.bookInBookStore(bookstore, i[0]))):
      booksPage.append([sg.Button(f'{i[1]} by {i[5]}' , key="BOOK"+f'{i[0]}')])
  return booksPage

def generateRadioOptions():
  buttons = [[sg.Text("Search by genre: ")]]
  genres = connection.getGenres()
  for i in genres:
    buttons.append([sg.Radio(i[0], "Genre", default="False", key=f'GenreButton{i[0]}')])
  buttons.append([sg.Radio("None", "Genre", default="True")])
  return buttons

def generateBookstores():
  buttons = [sg.Text("Choose a different location: "), sg.Button("All", key=f'BookstoreButtonAll')]
  bookstores = connection.getBookstores()
  for i in bookstores:
    buttons.append(sg.Button(i[2], key=f'BookstoreButton{i[0]}'))
  return buttons

def validateSignIn(username, password, type):
  return True

def validateUsername(username, copy):
  return username == copy

def validatePassword(password, copy):
  if(password != copy): return False
  if(len(password) < 8): return False
  chars = "!@#$%^&*()~`:;<,>.?/\|+=[]"
  caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  hasChar = False
  hasCap = False
  for i in password:
    if i in chars: hasChar = True
    if i in caps: hasCap = True 
  return hasChar and hasCap


if __name__ == "__main__":
  main()