import random, socket
from bottle import route, run, post, request, template, static_file

# Handle all POST routes
@route('/<setting>', method = 'post')
def check_vocabulary(setting):
    # The user's vocabulary input
    user_input = request.forms.get('user_input')
    # The solution and vocabulary which is first passed to ask_vocabulary.tpl and send via POST
    solution = request.forms.get('solution')
    vocabulary = request.forms.get('vocabulary')
    setting = setting
    
    # Check the user input
    if user_input == solution:
        result = "Correct"
    elif user_input == '':
        result = "Yet I can't guess your answer!"
    else:
        result = "Wrong, correct would be %s" % solution
    
    # If the user wants to retry show the ask_vocabulary.tpl with the same vocabulary again
    # Otherwise it's the first query which shows if the user input was correct in show_result.tpl
    if request.forms.get('retry'):
        return template('ask_vocabulary', vocabulary = vocabulary, solution = solution, setting = setting)
    else:
        return template('show_result', result = result, user_input = user_input, vocabulary = vocabulary, solution = solution, setting = setting)

@route('/')
@route('/<setting>', method = 'get')
def ask_for_vocabulary(setting = 'pl-de'):
    random_line = random.choice(open('dicts/de-pl.txt').readlines())
    words = random_line.split(' = ')
    
    # Set the vocabulary and the solution based on the language choice
    if setting == 'pl-de':
        vocabulary = words[0]
        solution = words[1]
    elif setting == 'de-pl':
        vocabulary = words[1]
        solution = words[0]
    else:
        vocabulary = random.choice(words)
        if vocabulary == words[1]:
            solution = words[0]
        else:
            solution = words[1]
    
    return template('ask_vocabulary', vocabulary = vocabulary, solution = solution, setting = setting)
    
@route('/version')
def show_version():
    words = open('dicts/de-pl.txt').readlines()
    
    return template('version', words = len(words))
    
@route('/static/<filename>')
def send_static(filename):
    return static_file(filename, root='static')

# determine whether the application is launched on the server. Otherwise use localhost settings. 
if socket.gethostname() == 'web150.webfaction.com':
    run(port = 59749, server = 'cherrypy')
else:
    run(host='localhost', port=8080, debug=True, reloader=True)
