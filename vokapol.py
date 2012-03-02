from bottle import route, run

@route('/')
def ask_vocabulary():
    list = open('list.txt')
    vocabulary = list.read()
    #return vocabulary + "hallo"
    return vocabulary, "<br><input type=\"text\"><br><input type=\"submit\" value=\"Prove\">"

@post('/<vocabulary>')
def prove_vocabulary(vocabulary):
    
    
run(host='localhost', port=8080, debug=True, reloader=True)
    
    