from bottle import static_file, route, run, template, error

@route('/')
def main():
    return template('index')

@route('/<filename:path>')
def send_static(filename):
    return static_file(filename, root='static/')

@route('/figures/<filename:path>')
def send_static(filename):
    return static_file(filename, root='static/figures/')

@route('/images/<filename:path>')
def send_static(filename):
    return static_file(filename, root='static/images/')
#@get('/<filename:re:.*\.css>')
#def stylesheets(filename):
#    return static_file(filename, root='static/')

@error(404)
def error404(error):
    return 'Nothing here, sorry'

run(host='0.0.0.0', port=8080, debug=False);
