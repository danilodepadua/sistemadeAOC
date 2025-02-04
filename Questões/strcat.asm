# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1.e (strcat)
# Descrição: O código tem a função de implementar a função strcat e C. para-
# isso assumimos que o destination será passado em $a0 e source será passado em-
# $a1. O destination será retornado em $v0

.text
.globl strcat
strcat:
	move $t0, $a0 # Move o que está no reg de argumento para um reg temporario
strcataofim:
	lb $t1, 0($a0) # carrega um byte (letra da palavra de a0)
	beq $t1, $zero, copia_strcat # se t1 for igual a 0 branch para strcatcopia
	addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a0
	j strcataofim # repete o loop
copia_strcat:
	lb $t2, 0($a1) # carrega um byte (letra da palavra de a1)
	sb $t2, 0($a0) # carrega um byte (letra da palavra de a0)
	addi $a1, $a1, 1 # vai adiante no ponteiro da palavra em a0
	addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a1
	bnez $t2, copia_strcat  # se t2 não for igual a zero repete o loop
	move $v0, $t0 # move o retorno do destination para v0 como requerido
	jr $ra # jump register, volta no endereço anterior
