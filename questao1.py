import sys

if len(sys.argv) != 2:
	print("USO %s [foo.txt]" % sys.argv[0])
	quit()

arq = open(sys.argv[1], 'r')

Lista = arq.readlines()

print("quantidade de linhas: ", len(Lista))

num = 0
for linha in Lista:
    num = num + linha.count(' ')

print("quantidade de espaços: ", num)