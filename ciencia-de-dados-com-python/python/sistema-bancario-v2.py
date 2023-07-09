import textwrap

def menu():
    menu = """
    ================ MENU ================
    [d]\tDepositar
    [s]\tSacar
    [e]\tExtrato
    [nc]\tNova conta
    [lc]\tListar contas
    [rc]\tRemover conta
    [nu]\tNovo usuário
    [lu]\tLista usuário
    [q]\tSair
    =======================================
    -> """
    return input(textwrap.dedent(menu))

def depositar(saldo, valor, extrato, /):
    if valor > 0:
        saldo += valor
        extrato += f"Depósito:\tR$ {valor:.2f}\n"
        print("\n[Sucesso] Depósito realizado com sucesso!")
    else:
        print("\n[Erro] Operação falhou! O valor informado é inválido.")

    return saldo, extrato

def sacar(*, saldo, valor, extrato, limite, numero_saques, limite_saques):
    excedeu_saldo = valor > saldo
    excedeu_limite = valor > limite
    excedeu_saques = numero_saques >= limite_saques

    if excedeu_saldo:
        print("\n[Erro] Operação falhou! Você não tem saldo suficiente.")

    elif excedeu_limite:
        print("\n[Erro] Operação falhou! O valor do saque excede o limite.")

    elif excedeu_saques:
        print("\n[Erro] Operação falhou! Número máximo de saques excedido.")

    elif valor > 0:
        saldo -= valor
        extrato += f"Saque:\t\tR$ {valor:.2f}\n"
        numero_saques += 1
        print("\n[Sucesso] Saque realizado com sucesso!")

    else:
        print("\n[Erro] Operação falhou! O valor informado é inválido.")

    return saldo, extrato

def exibir_extrato(saldo, /, *, extrato):
    print("\n================ EXTRATO ================")
    print("Não foram realizadas movimentações." if not extrato else extrato)
    print(f"\nSaldo:\t\tR$ {saldo:.2f}")
    print("==========================================")

def filtrar_usuario(cpf, usuarios):
    usuarios_filtrados = [usuario for usuario in usuarios if usuario["cpf"] == cpf]
    return usuarios_filtrados[0] if usuarios_filtrados else None

def filtrar_conta(numero_conta, contas):
    contas_filtrados = [conta for conta in contas if conta["numero_conta"] == numero_conta]
    return contas_filtrados[0] if contas_filtrados else None

def criar_conta(agencia, numero_conta, usuarios):
    cpf = input("Informe o CPF do usuário: ")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        print("\n[Sucesso] Conta criada com sucesso!")
        return {"agencia": agencia, "numero_conta": numero_conta, "usuario": usuario}

    print("\n[Erro] Usuário não encontrado.")

def listar_contas(contas):

    if not contas:
        print("\n[Erro] Nenhuma conta cadastrada.")

    for conta in contas:
        linha = f"""\
            Agência:\t{conta['agencia']}
            C/C:\t\t{conta['numero_conta']}
            Titular:\t{conta['usuario']['nome']}
        """
        print("=" * 100)
        print(textwrap.dedent(linha))

def remove_conta(contas):
    conta_removida = int(input("Número da conta a ser removida: "))

    contaExiste = filtrar_conta(conta_removida, contas)
    if not contaExiste:
        print("\n[Erro] Conta a ser removida não existe.")
        return

    contas.remove(contaExiste)

    if filtrar_conta(conta_removida, contas): 
        print("\n[Erro] Conta não pode ser removida.")
    else:
        print("\n[Sucesso] Conta removida!")

def criar_usuario(usuarios):
    cpf = input("Informe o CPF (somente número): ")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        print("\n[Erro] Já existe usuário com esse CPF!")
        return

    nome = input("Informe o nome completo: ")
    data_nascimento = input("Informe a data de nascimento (dd-mm-aaaa): ")
    endereco = input("Informe o endereço (lusuariosogradouro, nro - bairro - cidade/sigla estado): ")

    usuarios.append({"nome": nome, "data_nascimento": data_nascimento, "cpf": cpf, "endereco": endereco})

    print("[Sucesso] Usuário criado com sucesso!")

def listar_usuarios(usuarios):

    if not usuarios:
        print("\n[Erro] Nenhum usuário cadastrado.")

    for usuario in usuarios:
        aux = f"""\
            CPF:\t\t\t{usuario['cpf']}
            Nome Completo:\t\t{usuario['nome']}
            Data de Nascimento:\t{usuario['data_nascimento']}
            Endereço:\t\t{usuario['endereco']}
        """
        print("=" * 100)
        print(textwrap.dedent(aux))

def main():
    LIMITE_SAQUES = 3
    AGENCIA = "0001"

    saldo = 0
    limite = 500
    extrato = ""
    numero_saques = 0
    usuarios = []
    contas = []

    while True:
        opcao = menu()

        if opcao == "d":
            valor = float(input("Valor do depósito: "))

            saldo, extrato = depositar(saldo, valor, extrato)

        elif opcao == "s":
            valor = float(input("Valor do saque: "))

            saldo, extrato = sacar(
                saldo=saldo,
                valor=valor,
                extrato=extrato,
                limite=limite,
                numero_saques=numero_saques,
                limite_saques=LIMITE_SAQUES,
            )

        elif opcao == "e":
            exibir_extrato(saldo, extrato=extrato)

        elif opcao == "nc":
            numero_conta = len(contas) + 1
            conta = criar_conta(AGENCIA, numero_conta, usuarios)

            if conta:
                contas.append(conta)

        elif opcao == "lc":
            listar_contas(contas)
        
        elif opcao =="rc":
            remove_conta(contas)

        elif opcao == "nu":
            criar_usuario(usuarios)
        
        elif opcao == "lu":
            listar_usuarios(usuarios)

        elif opcao == "q":
            break

        else:
            print("[Erro] Operação inválida, por favor selecione novamente a operação desejada.")

main()