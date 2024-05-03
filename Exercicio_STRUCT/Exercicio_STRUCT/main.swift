//
//  main.swift
//  Exercicio_STRUCT
//
//  Created by Matheus  Torres on 03/05/24.
//

import Foundation

//Struct do Campeao com as caracteristicas

struct Campeao {
    var nome: String
    var role: String
    var dificuldade: String
}

// Função para cadastrar um novo campeão
func cadastrarCampeao() -> Campeao {
    print("Cadastro de Novo Campeão:")
    
    print("Nome:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return cadastrarCampeao()
    }
    
    print("Role:")
    guard let role = readLine(), !role.isEmpty else {
        print("Role inválida.")
        return cadastrarCampeao()
    }
    
    print("Dificuldade:")
    guard let dificuldade = readLine(), !dificuldade.isEmpty else {
        print("Dificuldade inválida.")
        return cadastrarCampeao()
    }
    
    return Campeao(nome: nome, role: role, dificuldade: dificuldade)
}

// Função para atualizar as informações de um campeão
func atualizarCampeao(campeoes: inout [Campeao]) {
    if campeoes.isEmpty {
        print("Nenhum campeão cadastrado.")
        return
    }
    
    print("\n--- Campeões Cadastrados ---")
    for (index, campeao) in campeoes.enumerated() {
        print("\(index + 1). \(campeao.nome)")
    }
    
    print("Digite o número do campeão que deseja atualizar:")
    guard let escolha = readLine(), let indice = Int(escolha), indice > 0 && indice <= campeoes.count else {
        print("Escolha inválida.")
        return
    }
    
    let novoCampeao = cadastrarCampeao()
    campeoes[indice - 1] = novoCampeao
    print("Campeão atualizado com sucesso.")
}

// Função para excluir um campeão da lista
func deletarCampeao(campeoes: inout [Campeao]) {
    if campeoes.isEmpty {
        print("Nenhum campeão cadastrado.")
        return
    }
    
    print("\n--- Campeões Cadastrados ---")
    for (index, campeao) in campeoes.enumerated() {
        print("\(index + 1). \(campeao.nome)")
    }
    
    print("Digite o número do campeão que deseja excluir:")
    guard let escolha = readLine(), let indice = Int(escolha), indice > 0 && indice <= campeoes.count else {
        print("Escolha inválida.")
        return
    }
    
    let campeaoExcluido = campeoes.remove(at: indice - 1)
    print("Campeão \(campeaoExcluido.nome) excluído com sucesso.")
}

// Função principal
func main() {
    var campeoes: [Campeao] = []
    
    while true {
        print("\n--- Menu ---")
        print("1. Cadastrar novo campeão")
        print("2. Visualizar campeões cadastrados")
        print("3. Atualizar campeão")
        print("4. Excluir campeão")
        print("5. Sair")
        print("Escolha uma opção:")
        
        if let escolha = readLine(), let opcao = Int(escolha) {
            switch opcao {
            case 1:
                let novoCampeao = cadastrarCampeao()
                campeoes.append(novoCampeao)
                print("Campeão cadastrado com sucesso.")
            case 2:
                if campeoes.isEmpty {
                    print("Nenhum campeão cadastrado.")
                } else {
                    print("\n--- Campeões Cadastrados ---")
                    for (index, campeao) in campeoes.enumerated() {
                        print("Nome: \(index + 1). \(campeao.nome) | Role: \(campeao.role) | Dificuldade: \(campeao.dificuldade)")
                    }
                }
            case 3:
                atualizarCampeao(campeoes: &campeoes)
            case 4:
                deletarCampeao(campeoes: &campeoes)
            case 5:
                print("Fim do programa.")
                return
            default:
                print("Opção inválida. Por favor, escolha uma opção válida.")
            }
        } else {
            print("Opção inválida. Por favor, escolha uma opção válida.")
        }
    }
}

// Chamada da função principal
main()
