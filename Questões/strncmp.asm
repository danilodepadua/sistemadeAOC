# Nome: Danilo de Pádua Walfrido Aguiar
# Atividade 1va
# Disciplina: Arquitetura e Organização de Computadores
# Semestre letivo: 2024.2
# Questão: 1.d (strncmp)
# Descrição: O código tem a função de implementar a função strcmp de C. para-
# isso assumimos que o str1 será passado em $a0 e str2 será passado em-
# $a1. O destination será retornado em $v0

.text
.globl strncmp
strncmp:
    move $t2, $a3 # move o que está em a3 para reg temporário t2
strncmp_loop:
    beq $t2, $zero, sair_strncmp # se t2 for igual a zero, sai da função
    lb $t0, 0($a0) # carrega um byte (letra da palavra de a1)
    lb $t1, 0($a1) # carrega um byte (letra da palavra de a0)
    sub $v0, $t0, $t1 # tira a diferença entre t0 e t1 e guarda em v0
    bne $v0, $zero, sair_strncmp #   sai da função se v0 é igual a zero
    beq $t0, $zero, sair_strncmp # sai da função se t0 é igual a zero
    addi $a0, $a0, 1 # vai adiante no ponteiro da palavra em a0
    addi $a1, $a1, 1 # vai adiante no ponteiro da palavra em a1
    addi $t2, $t2, -1 # diminui o contador
    j strncmp_loop # continua o loop
sair_strncmp:
    jr $ra # jump register, volta no endereço anterior
