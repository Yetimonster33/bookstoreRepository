import PySimpleGUI as sg
import datetime
import sql
from screeninfo import get_monitors

connection = sql.sqlFunctions()

screenX = 1000
screenY = 600
# for m in get_monitors():
#   if (m.is_primary):
#     screenX = m.width
#     screenY = m.height

def main():
  # runAuthenticationPage()
  runSearchPage("")

def runAuthenticationPage():
  window = refreshWindow([[sg.Text("Username: "), sg.Input("", key="UserName"), sg.Text("Password: "), sg.Input("", key="Password")],
                          [sg.Text("Sign In As: "), sg.Button("User", key="UserSignIn", size = (40,1)), sg.Push(), sg.Button("Owner", "OwnerSignIn"), sg.Push(), sg.Button("Publisher", "PublisherSignIn")],
                          [sg.Button("Sign Up", key="UserSignUp", size = (100,1))]], False)

  while True: 
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      window.close()
      exit()
    if(event=="UserSignIn"):
      if(validateSignIn(window["UserName"].get(), window["Password"].get(), "user")): break
    if(event=="UserSignUp"):
      validateSignUp(window["UserName"].get(), window["Password"].get(), "user")
      window.close()
      userSignUp()
      break
    if(event=="OwnerSignIn"):
      break
    if(event=="OwnerSignUp"):
      validateSignUp()
    if(event=="PublisherSignIn"):
      break
    if(event=="PublisherSignUp"):
      validateSignUp()
  window.close()

def runSearchPage(search, genre):
  layout = [[sg.Text("Search By Author, ISBN, or Title: "), sg.Push(), sg.Input("",size=(40,1), key=("-SearchBar-")), sg.Push(), sg.Button("Search: ", key=("Search"))], 
  [sg.Column(generateBooksBySearch(search, genre),scrollable=True,vertical_scroll_only=True, size=(400, screenY/2)), sg.Push(), sg.VerticalSeparator(), 
  sg.Column(generateRadioOptions())  ]]

  window = refreshWindow(layout, True)
  while True: 
    event, values = window.read()

    if (event == sg.WIN_CLOSED):
      break

    if("BOOK" in event):
      page = getBookDataPage(event[4:])
      if (page == None): continue
      window.close()
      window = refreshWindow(page, True)

    if(event=="Logout"):
      window.close()
      main()

    if (event == "Home"):
      window.close()
      runSearchPage("")

    if (event == "Search"):
      search=window["-SearchBar-"].get()
      window.close()
      runSearchPage(search)

  window.close()

def refreshWindow(replacement, renderBar):
  layout = [[sg.Column(replacement)]]
  if(renderBar): layout.insert(0, [sg.Button('Home'), sg.Button('Logout'), sg.Button('2', key=lambda:func("button 2")), sg.Button('3'), sg.Button('4')])
  return sg.Window("Window", layout = layout, size = (screenX, screenY))          

def getBookDataPage(isbn):
  book = connection.getBookById(isbn)
  if (book == [] or book == None or book[0] == None): return None
  book=book[0]
  if(book[3] == None): date = ""
  else: date = str(book[3].year) + "-" + str(book[3].month) + "-" + str(book[3].day)
  return [[sg.Text("ISBN: "), sg.Push(), sg.Text(book[0], size=(85,1))], [sg.Text("Title: "), sg.Push(), sg.Text(book[1], size=(85,1))], [sg.Text("Price: "), sg.Push(), sg.Text(f'${book[2]:.2f}', size=(85,1))], [sg.Text("Publication Date: "), sg.Push(), sg.Text(date, size=(85,1))], [sg.Text("Genre: "), sg.Push(), sg.Text(book[4], size=(85,1))], [sg.Text("Author: "), sg.Push(), sg.Text(book[5], size=(85,1))], [sg.Text("Publisher: "), sg.Push(), sg.Text(book[7], size=(85,1))], [sg.Text(book[6], size=(85,15))]]

def generateBooksPage():
  books=connection.getBooks()
  booksPage = []
  for i in books:
    booksPage.append([sg.Button(f'{i[1]} by {i[5]}' , key="BOOK"+f'{i[0]}')])
  return booksPage

def generateBooksBySearch(search, genre):
  books=connection.getBooks()
  booksPage = []
  if(genre == "None"):
    for i in books:
      if(search in i[1] or search in i[5] or search in str(i[0])):
        booksPage.append([sg.Button(f'{i[1]} by {i[5]}' , key="BOOK"+f'{i[0]}')])
  else: 
    for i in books:
      if(search in i[1] or search in i[5] or search in str(i[0]) and i[4] = genre):
        booksPage.append([sg.Button(f'{i[1]} by {i[5]}' , key="BOOK"+f'{i[0]}')])
  return booksPage

def generateRadioOptions():
  buttons = [[sg.Text("Search by genre: ")], [sg.Radio("None", "Genre", default="True")]]
  genres = connection.getGenres()
  for i in genres:
    buttons.append([sg.Radio(i, "Genre", default="False")])
  return buttons

def validateSignIn(username, password, type):
  return True
  u = []
  p = []
  if(type == "owner"): 
    u = ownersU
    p = ownersP
  elif(type == "user"):
    u = usersU
    p = usersP
  elif(type == "publisher"):
    u = publishersU
    p = publishersP
  
  for i in range(len(u)):
    if(username == u[i] and password == p[i]):
      return True
  return False

def validateSignUp(username, password, type):
  if(type == "owner"): 
    ownersU[len(ownersU)] = username
    ownersP[len(ownersP)] = password
  elif(type == "user"):
    usersU.append(username)
    usersP.append(password)
  elif(type == "publisher"):
    publishersU[len(publishersU)] = username
    publishersP[len(publishersP)] = password

def userSignUp():
  window = refreshWindow([[sg.Text("First Name: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Last Name: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Email: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Username: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Username(verify): "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Country: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Region: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("City: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Address: "), sg.Push(), sg.Input("", key="", size = (50,1))],
                          [sg.Text("Postal Code: "), sg.Push(), sg.Input("", key="", size = (50,1))]], False)
  while(1):
    event, results = window.read()

    if (event == sg.WIN_CLOSED):
      window.close()
      exit()


if __name__ == "__main__":
  main()