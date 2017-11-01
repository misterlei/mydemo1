a={'a':1,'b':2}
print(a['b'])


def lists(request,uid=1):
    typesa=Type.objects.filter()
    #获取类别表中的父id为0的
    types=Type.objects.filter(pid=0)
    
    lists=Goods.objects.filter()

    c=uid
    for i in typesa:
        # print(i)
        # print(i.path,'path值')
        typesb=i.path.split(',')
        # print(typesb,'切割后的值')
        # print(len(typesb))
        # c+=1
        print(typesb,'qie')
        print(i.id,'id',c,'uid=',uid)
        if i.id==int(uid):
            d=Goods()
            a=i.path
            print(a,'aa')
            
            print(typesb)
            if uid not in typesb:
                c=uid;
                print(c,'c')
                types1=Type.objects.filter(pid=uid)
                print(type(types1),'类型1')
                lists1=Goods.objects.filter(typeid=uid)

                print(Type.objects.filter(id=uid).values('path'),'nihao')
                print(lists1,'哈哈')
                # print(Type.objects.filter(id=uid)['path'],'nihao')
                ld=Type.objects.filter(id=uid).values('path')
                for i in ld:
                    for o,k in i.items():

                        print(o,'zhi',k,'jie0000')
                        jie=k.split(',')
                        print(Goods.objects.filter().values('typeid'),'999999')
                        ldd=Goods.objects.filter().values('typeid')
                        for p in ldd:
                            for x,y in p.items():
                                print(y,'yyyyyyyyy')
                        if str(d.typeid) in jie:
                            print(2222)
                            lists2=Goods.objects.filter()
                        # lists2=Goods.objects.filter(d.typeid in (Type.objects.filter(id=uid)['path']))
                            lists1=dict(lists1+lists2)

                context={'types':types1,'lists':lists1}
                return render(request,'myweb/lists/shangpin.html',context)

    context={'types':types,'lists':lists}

            

    
    # if uid in typesb:
    #     typeid=uid
    #     context={'types':types,'lists':lists}
    # context={'types':types,'lists':lists}
        # else:
            # context={'types':types,'lists':lists}
            # print('有错')
    return render(request,'myweb/lists/shangpin.html',context)
    
