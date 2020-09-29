#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#-----------------------------EXPRESSION CONVERTOR   

def top(stackop):
    return stackop[-1]

def empty(stackop):
    return len(stackop)

def priority(c):
    if(c=='+'):
        return 1
    elif(c=='.'):
        return 2
    elif(c=='!'):
        return 3
   
    return 0

def infixtopostfix(exp_list):
    expfinal=[]
    stackop=[]
    exp_list.append(')')
    exp_list.insert(0,'(')
    print("REVERSE EXP: ", end=" ") 
    print(exp_list)
    for i in range(len(exp_list)):
        if(exp_list[i]=='('):
            stackop.append(exp_list[i])
        elif(exp_list[i]==')'):
            while(top(stackop)!='(' and empty(stackop)!=0 ):
                expfinal.append(top(stackop))
                stackop.pop()
            if(empty(stackop)!=0):
                stackop.pop()
        elif(exp_list[i]=='.' or exp_list[i]=='+' or exp_list[i]=='!'):
                while(empty(stackop)!=0 and (priority(exp_list[i]) <=  priority(top(stackop)))):
                    expfinal.append(top(stackop))
                    stackop.pop()
                stackop.append(exp_list[i])
        else:
            expfinal.append(exp_list[i])
    
    for j in range (len(stackop)):
        if(top(stackop)!='(' ):
          expfinal.append(stackop.pop())
           
    return expfinal
                

def infixtoprefix(exp_list):
        exp_list.reverse()
        for i in range(len(exp_list)):
            if(exp_list[i]=='('):
                exp_list[i]=')'
            elif(exp_list[i]==')'):
                exp_list[i]='('
            
        expfinal=infixtopostfix(exp_list)
        return expfinal
            
#-----------------------------IRSIM FILE GENERATOR        
        
count=0
irsim=open(input("\nEnter the simulator filename with .sim extension in the end:\n"),"w")

            
def AND(a,b):
    global count
    inter=a+"_nand_"+b
    p1="p %s %s %s 2 4\n"%(a,"vdd","nand"+str(count))
    p2="p %s %s %s 2 4\n"%(b,"vdd","nand"+str(count))
    n1="n %s %s %s 2 4\n"%(a,"nand"+str(count),inter)
    n2="n %s %s %s 2 4\n\n"%(b,inter,"gnd")
    NOT("nand"+str(count))
    irsim.write(p1)
    irsim.write(p2)
    irsim.write(n1)
    irsim.write(n2)
    
    
def OR(a,b):
    global count
    inter=a+"_nor_"+b
    p1="p %s %s %s 2 4\n"%(a,"vdd",inter)
    p2="p %s %s %s 2 4\n"%(b,inter,"nor"+str(count))
    n1="n %s %s %s 2 4\n"%(a,"nor"+str(count),"gnd")
    n2="n %s %s %s 2 4\n\n"%(b,"nor"+str(count),"gnd")
    NOT("nor"+str(count))
    irsim.write(p1)
    irsim.write(p2)
    irsim.write(n1)
    irsim.write(n2)
   

def NOT(a):
    global count
    p1="p %s vdd %s 2 4\n"%(a,"out"+str(count))
    n1="n %s %s gnd 2 4\n"%(a,"out"+str(count))
    irsim.write(p1)
    irsim.write(n1)

def irsim_generator(exp_list):
    circuit=[]
    global count
    for i in range(len(exp_list)):
        if(exp_list[i]=='.'):
            AND(circuit.pop(),circuit.pop())
            circuit.append("out"+str(count))
            count+=1
        elif(exp_list[i]=='+'):
            OR(circuit.pop(),circuit.pop())
            circuit.append("out"+str(count))
            count+=1
        elif(exp_list[i]=='!'):
            NOT(circuit.pop())
            circuit.append("out"+str(count))
            count+=1
        else:
            circuit.append(exp_list[i])
        
#-------------main------------------------     

exp_list=[]
exp_list=[x for x in input("\nEnter the boolean expression (Leave space in between each character):\n").split()]
print("");
print("GIVEN EXP:   ", end=" ") 
print(exp_list)
exp_list=infixtoprefix(exp_list)
print("POSTFIX EXP: ", end=" ") 
print(exp_list)
print("\nIn the sim file, the out(number) with max number is the final OUTPUT.\n")
irsim_generator(exp_list)
irsim.close()
