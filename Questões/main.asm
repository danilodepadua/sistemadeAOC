# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1
# Descrição: O código tem a função de implementar as funções da questão 1

.data
str1: .asciiz "Danilo"
str2: .asciiz " padua"
str3: .space 20 # buffer
str4: .asciiz "Hello"
nl: .asciiz "\n"
n: .word 4 # guardando chars para strncmp

.text
.globl main
main:
	la $a0, str3 # carrega str3 como argumento
	la $a1, str1 # carrega str1 como argumento 
	jal strcpy # chama o strcpy
	move $a0, $v0 # move o que estava em v0 para a0
	li $v0, 4 # chama a função de printar string
	syscall

	la $a0, nl # o ascii da newline
	li $v0, 4 # printstring
	syscall

	la $a0, str3 # carrega str3 como argumento
	la $a1, str2 # carrega str2 como argumento 
	jal strcat # chama o strcat
	move $a0, $v0 # move o que estava em v0 para a0
	li $v0, 4 # chama a função de printar string
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	la $a0, str1 # carrega str1 como argumento
	la $a1, str4 # carrega str4 como argumento
	jal strcmp # chama o strcmp
	move $a0, $v0 # move o que estava em v0 para a0
	li $v0, 1 # chama a função de printar inteiro
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	la $a0, str1 # carrega str1 como argumento
	la $a1, str2 # carrega str2 como argumento 
	lw $a3, n # carrega o número de caracteres
	jal strncmp # chama o strncmp
	move $a0, $v0 # move o que estava em v0 para a0
	li $v0, 1 # chama a função de printar inteiro
	syscall

	la $a0, nl
	li $v0, 4
	syscall

	la $a0, str3 # carrega str3 como argumento
	la $a1, str1 # carrega str1 como argumento
	li $a2, 5 # carrega o número de bytes
	jal memcpy # chama o strncmp
	move $a0, $v0 # move o que estava em v0 para a0
	li $v0, 4 # chama a função de printar string
	syscall

	li $v0, 10 # chama a função de finalizar o programa
	syscall
