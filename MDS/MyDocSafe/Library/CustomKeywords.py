import random, string

def randomword():
   letters = string.ascii_lowercase
   Text = 'Test' + ''.join(random.choice(letters) for i in range(6))
   return Text

def randomemail():
   letters = string.ascii_lowercase
   Text = 'Test' + ''.join(random.choice(letters) for i in range(6))
   Text = Text + '@gmail.com'
   return Text
