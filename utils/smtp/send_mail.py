import smtplib
from colorama import Fore
import webbrowser

def sendGmail(from1, from2, to, content):
	server = smtplib.SMTP('smtp.gmail.com', 587)
	server.ehlo()
	server.starttls()
	server.login(from1, from2)
	server.sendmail(from1, to, content)
	server.close()
try:
	from1 = input(Fore.RED + '[' + Fore.GREEN + '*' + Fore.RED + '] From (' + Fore.WHITE + 'without \'@gmail.com\'' + Fore.RED + ')' + Fore.WHITE + ': ')
	from2 = input(Fore.RED + '[' + Fore.GREEN + '*' + Fore.RED + '] Password' + Fore.WHITE + ': ')
	to = input(Fore.RED + '[' + Fore.GREEN + '*' + Fore.RED + '] To (' + Fore.WHITE + 'without \'@gmail.com\'' + Fore.RED + ')' + Fore.WHITE + ': ') + '@gmail.com'
	content = input(Fore.RED + '[' + Fore.GREEN + '*' + Fore.RED + '] what to send' + Fore.WHITE + ': ')
	sendGmail(from1, from2, to, content)
except:
	print('There may be an incorrect spelling')
