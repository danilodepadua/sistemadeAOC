# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1.a (strcpy)
# Descrição: O código tem a função de implementar a função strcpy de C. para-
# isso assumimos que o destination será passado em $a0 e source será passado em-
# $a1. O destination será retornado em $v0

# Basicamente -> a função recebe um endereço para de strings com uma string ->-
# -> a função recebe um endereço para strings de uma string vazia ->-
# a função guarda o endereço da string

.text
.globl strcpy
strcpy:
	move $t0, $a0 # Move o que está no reg de argumento para um reg temporario
loop_strcpy:
	lb   $t1, 0($a1) # carrega um byte (letra da palavra de a1)
	sb $t1, 0($a0) # carrega um byte (letra da palavra de a0)
	beqz $t1, sair_strcpy # faz branch pra sair se o reg t1 é igual a 0
	addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a0
	addi $a1, $a1, 1 # vai adiante no ponteiro da palavra em a1
	j loop_strcpy # repete o loop até a palavra inteira
sair_strcpy:
	move $v0, $t0 # move o retorno do destination para v0 como requerido
	jr $ra # jump register, volta no endereço anterior
