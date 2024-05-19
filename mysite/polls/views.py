from django.http import HttpResponse

import os 
import psutil 
from django.shortcuts import render 

def site_index(request):
    """The default view for our page."""
    template_data = {
        'user': os.environ.get('STUDENT_NAME', "(No Username)"),
        'host': os.environ.get('SITE_NAME', "localhost.localdomain"),
        'net_if_addrs': psutil.net_if_addrs(),
        'disk_usage': psutil.disk_usage('/'),
        'loadavg': psutil.getloadavg(),
    }
    return render(request, "index.html", template_data)

def index(request):
    return HttpResponse("I sort of did it")
