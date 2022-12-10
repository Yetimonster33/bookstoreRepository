import PySimpleGUI as sg
import datetime
from screeninfo import get_monitors

ownersU = []
ownersP = []
usersU = [""]
usersP = [""]
publishersU = []
publishersP = []

screenX = 1500
screenY = 800
  # for m in get_monitors():
  #   if (m.is_primary):
  #     screenX = m.width
  #     screenY = m.height

def main():
  sign_in = authentication()

  layout = [[sg.Column(generateBooksPage())],
            [sg.Button('Home'), sg.Button('Logout'), sg.Button('2', key=lambda:func("button 2")), sg.Button('3'), sg.Button('4')]]
  window = refreshWindow(layout, True)
  while True: 
    event, values = window.read()

    if("BOOK" in event):
      window.close()
      window = refreshWindow(getBookDataPage(findBook(event[4:])), True)

    if(event=="Logout"):
      window.close()
      main()

    if (event == sg.WIN_CLOSED):
      break
    
    if callable(event):
      # window.close()
      # window = refreshWindow(event())
      continue

    if (event == 'Home'):
      window.close()
      window = refreshWindow([[sg.Column(generateBooksPage())]], True)
  window.close()

def refreshWindow(replacement, renderBar):
  layout = [[sg.Column(replacement)]]
  if(renderBar): layout.append( [sg.Button('Home'), sg.Button('Logout'), sg.Button('2', key=lambda:func("button 2")), sg.Button('3'), sg.Button('4')])
  return sg.Window("Window", layout = layout, size = (screenX, screenY))          

def getBookDataPage(book):
  return [[sg.Text("ISBN: "), sg.Push(), sg.Text(book[0], size=(85,1))], [sg.Text("Title: "), sg.Push(), sg.Text(book[1], size=(85,1))], [sg.Text("Price: "), sg.Push(), sg.Text(f'${book[2]:.2f}', size=(85,1))], [sg.Text("Publication Date: "), sg.Push(), sg.Text(str(book[3].year) + "-" + str(book[3].month) + "-" + str(book[3].day), size=(85,1))], [sg.Text("Genre: "), sg.Push(), sg.Text(book[4], size=(85,1))], [sg.Text("Author: "), sg.Push(), sg.Text(book[5], size=(85,1))], [sg.Text("Publisher: "), sg.Push(), sg.Text(book[6], size=(85,1))], [sg.Text("Description: "), sg.Push(), sg.Multiline(book[7], size=(95,15))]]

def generateBooksPage():
  book1 = ["ISBN", "BOOK 1", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher", "THIS IS A description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description"]
  book2 = ["ISBN", "BOOK 2", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  book3 = ["ISBN", "BOOK 3", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  book4 = ["ISBN", "BOOK 4", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  books=[book1, book3, book2, book4]

  booksPage = []
  for i in books:
    booksPage.append([sg.Button(f'{i[1]}', key="BOOK"+f'{i[1]}')])
  return booksPage

def findBook(book):
  # eventually found with SQL
  book1 = ["ISBN", "BOOK 1", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher", "THIS IS A description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description"]
  book2 = ["ISBN", "BOOK 2", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  book3 = ["ISBN", "BOOK 3", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  book4 = ["ISBN", "BOOK 4", 25.5, datetime.datetime(2022, 12, 8), "genre", "author", "publisher","Description"]
  books=[book1, book3, book2, book4]
  for i in books:
    if(i[1] == book):
      return i

def func(message="default"):
  print(message)

def authentication():
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

def validateSignIn(username, password, type):
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