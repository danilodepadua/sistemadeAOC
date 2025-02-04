# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1.b (memcpy)
# Descrição: O código tem a função de implementar a função memcpy de C. para-
# isso assumimos que o destination será passado em $a0, source será passado em-
# $a1 e o num será passado em $a2. O destination será retornado em $v0

.text
.globl memcpy
memcpy:
	move $t0, $a0 # move o que está no reg de argumento para um reg temporario
loop_memcpy:
	beq $a2, $zero, sair_memcpy # Se num (em $a2) for zero, branch para sair
	lb $t2, 0($a1) # arrega um byte (letra da palavra de a1)
	sb $t2, 0($a0) # carrega um byte (letra da palavra de a0)
	addi $a1, $a1, 1 # vai adiante no ponteiro da palavra em a0
	addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a1
	addi $a2, $a2, -1 # Decrementa o contador de bytes
	j loop_memcpy # repete o loop até a palavra inteira
sair_memcpy:
	move $v0, $t0 # move o retorno do destination para v0 como requerido
	jr $ra # jump register, volta no endereço anterior
