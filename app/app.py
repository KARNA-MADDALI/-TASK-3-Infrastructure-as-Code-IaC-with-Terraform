from flask import Flask, jsonify, render_template, request
import socket, os, time

app = Flask(__name__, static_folder='static', template_folder='templates')

@app.route('/')
def index():
    return render_template('index.html', message="Welcome — Deployed with Terraform & Docker")

@app.route('/api/hello')
def hello():
    return jsonify({"message": "Hello from a recruiter-ready app!", "env": os.environ.get("APP_ENV", "dev")})

@app.route('/health')
def health():
    return jsonify({"status": "healthy", "time": int(time.time())})

@app.route('/info')
def info():
    return jsonify({
        "hostname": socket.gethostname(),
        "container_id_env": os.environ.get("HOSTNAME"),
        "remote_addr": request.remote_addr
    })

@app.route('/metrics')
def metrics():
    # simple custom metrics example (not Prometheus lib) to demo observability
    return "app_requests_total 42\napp_uptime_seconds 1234\n", 200, {'Content-Type': 'text/plain; version=0.0.4'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
