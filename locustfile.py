import os 

from locust import HttpUser, task

class HelloWorldUser(HttpUser):

    @task
    def hello_world(self):
        self.client.get("/admin/auth/user/")

    def on_start(self):
        response = self.client.get('/admin/login/?next=/admin/')
        csrftoken = response.cookies['csrftoken']
        self.client.post('/admin/login/?next=/admin/',
            {
            'username': os.environ.get('LOCUST_USER', 'admin'),
            'password': os.environ.get('LOCUST_PASSWORD', 'password')
            },
            headers={'X-CSRFToken': csrftoken})
