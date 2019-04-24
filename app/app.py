from flask import Flask, render_template

app = Flask(__name__)


# noinspection PyUnusedFunction
@app.route('/')
def index():
    app_description: str = render_template('description.txt')
    app_version: str = render_template('version.txt')
    return render_template('index.html', version=app_version, description=app_description)


# noinspection PyUnusedFunction
@app.route('/version/')
def version():
    return render_template('version.txt')


if __name__ == "__main__":
    # host='0.0.0.0' must be specified to have access from outside the container.
    app.run(host='0.0.0.0')
