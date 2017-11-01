from django.shortcuts import render
from django.http import HttpResponse

from myadmin.models import Type
import time


def index(request):
	# 执行数据查询，并放置到模板中
    list = Type.objects.extra(select = {'_has':'concat(path,id)'}).order_by('_has')
    # 遍历查询结果，为每个结果对象追加一个pname属性，目的用于缩进标题
    for ob in list:
        ob.pname ='. . . '*(ob.path.count(',')-1)
        # print(list[0].__dict__)
    context = {"typelist":list}
    return render(request,'myadmin/type/index.html',context)
    # ob=Type.objects.all()
    # context={'typelist':ob}
    # return render(request,'myadmin/type/index.html',context)


def add(request):
	return render(request,'myadmin/type/add.html')



def insert(request):
	try:
		ob=Type()
		ob.name=request.POST['name']
		ob.pid=request.POST['pid']
		ob.path=request.POST['path']
		if ob.name and ob.pid and ob.path :
			ob.save()
			context={'info':'添加成功'}	
		else :
			context={'info':'信息不全'}

	except:
		context={'info':'添加失败'}

	return render(request,'myadmin/type/info.html',context)



def dels(request,uid):
	try:
		ob = Type.objects.get(id=uid)
		ob.delete()
		context={'info':'删除成功'}
	except:
		context={'info':'删除失败'}

	return render(request,'myadmin/type/info.html',context)

def typeadds(request,uid):
	ob=Type.objects.get(id=uid)

	if ob:
		ob = Type.objects.get(id=uid)
		context = {'pid':ob.id,'path':ob.path+str(ob.id)+',','name':ob.name}
		return render(request,'myadmin/type/adds.html',context)
	else:
		context={'info':'没有获取到值'}
	return render(request,'myadmin/type/info.html',context)


def addsinsert(request):
	ob=Type()
	ob.name=request.POST['name']
	ob.pid=request.POST['pid']
	ob.path=request.POST['path']
	ob.save()
	print(ob.name)
	context={'info':'添加成功'}
	return render(request,'myadmin/type/info.html',context)


def edit(request,uid):
	ob=Type.objects.get(id=uid)
	if ob:
		context={'type':ob}
		return render(request,'myadmin/type/edit.html',context)
	else:
		context={'info':'没有信息'}
	return render(request,'myadmin/type/edit.html')

def update(request,uid):
	ob=Type.objects.get(id=uid)
	ob.name=request.POST['name']
	ob.pid=request.POST['pid']
	ob.path=request.POST['path']
	ob.save()
	context={'info':'添加成功'}
	return render(request,'myadmin/type/info.html',context)