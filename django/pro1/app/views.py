from django.contrib.auth.decorators import login_required
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User

import os
from django.conf import settings
from app.models import NewData, UserTable


# from ..pro1 import settings

def log(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        if 'log' in request.POST:
            usr = request.POST['user']
            pas = request.POST['pas']
            user = authenticate(request, username=usr, password=pas)
            if user is not None:
                login(request, user)
                return redirect('/')
            elif user is None:
                return HttpResponse("No user found")
        elif 'register' in request.POST:
            return render(request, 'signup.html')
    return render(request, 'login.html')


def reg(request):
    if request.method == 'POST':
        if 'signup' in request.POST:
            usr = request.POST['user']
            pas = request.POST['pas']
            em = request.POST['em']
            u = User.objects.create_user(username=usr,
                                         password=pas,
                                         email=em,
                                         is_active=True)
            u.save()
            return redirect('/login')
        else:
            return HttpResponse("Username not available")
    # return render(request, 'signup.html')


def logo(request):
    logout(request)
    return redirect('/login')


@login_required
def todo(request):
    if request.method == 'POST':
        user = request.user
        if 'add' in request.POST:
            pr = request.POST['pr']
            tk = request.POST['tk']
            dt = request.POST['dt']
            NewData.objects.create(priority=pr, task=tk, due=dt, user=user)
        elif 'delete' in request.POST:
            todo_del_id = request.POST['s_id']
            todo_del = NewData.objects.get(pk=todo_del_id)
            todo_del.delete()
        elif 'task_id' in request.POST:
            comp_id = request.POST['task_id']
            comp = NewData.objects.get(pk=comp_id)
            comp.completed = not comp.completed
            comp.save()
        return redirect('todo')
    todos = NewData.objects.filter(user=request.user)
    sort_by = request.GET.get('sort', 'priority')
    if sort_by == 'completed':
        sorted_todos = todos.order_by('completed')
    elif sort_by == 'task':
        sorted_todos = todos.order_by('task')
    elif sort_by == 'priority':
        sorted_todos = todos.order_by('priority')
    else:
        sorted_todos = todos.order_by('completed')
    # sorted_todos = todos.order_by('pk')
    return render(request, "tem.html", {'todos': sorted_todos, })
