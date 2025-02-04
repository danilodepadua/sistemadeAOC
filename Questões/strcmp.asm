# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1.c (strcmp)
# Descrição: O código tem a função de implementar a função strcmp de C. para-
# isso assumimos que o str1 será passada em $a0 e str2 será passado em-
# $a1. O retorno de acordo com a tabela será colocado em $v0

.text
.globl strcmp
strcmp:
loop_strcmp:
	lb $t0, 0($a0) # carrega um byte (letra da palavra de a1)
	lb $t1, 0($a1) # carrega um byte (letra da palavra de a0)
	sub $v0, $t0, $t1 # tira a diferença entre t0 e t1 e guarda em v0
	bne $v0, $zero, sair_strcmp # confere que se a palavra em v0 for diferente de 0 da branch pra sair
	beq $t0, $zero, sair_strcmp # onfere que se a palavra em v0 for igual 0 da branch pra sair
	addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a0
	addi $a1, $a1, 1 # ai adiante no ponteiro da palavra em a1
	j loop_strcmp # repete o loop até a palavra inteira
sair_strcmp:
	jr $ra # jump register, volta no endereço anterior
