
import Foundation

func mostrarMenu() {
    var listaExterna: [String] = []
    while true {
        print("--------- Lista de Tarefas ---------")
        print("1. Listar Tarefas\n2. Adicionar Tarefa\n3. Remover Tarefa\n4. Editar Tarefa\n5. Mudar Prioridade\n0. Sair")
        print("Digite sua opção: ")
        let opcao = readLine()
        if let opcao = opcao {
            if let opcao = Int(opcao) {
                switch opcao {
                    case 1:
                        print("--------- Tarefas ---------")
                        if listaExterna.isEmpty {
                            print("Sua lista está vazia.")
                        } else {
                            listarTarefas(lista: listaExterna)
                        }
                    case 2:
                        print("--------- Adicionar Tarefa ---------")
                        print("Informe o nome da tarefa que deseja adicionar: ")
                        let nome = readLine()
                        if let nome = nome {
                            listaExterna = adicionarTarefas(nome: nome, lista: listaExterna)
                            print("Tarefa \(nome) adicionada com sucesso!")
                        } else {
                            print("Nome inválido.")
                        }
                    case 3:
                        print("--------- Remover Tarefa ---------")
                        if listaExterna.isEmpty {
                            print("Sua lista está vazia. Não há o que remover.")
                        } else {
                            listarTarefas(lista: listaExterna)
                            print("Informe o número da tarefa que deseja remover: ")
                            let indiceTarefa = readLine()
                            if let indiceTarefa = indiceTarefa {
                                if let indiceTarefa = Int(indiceTarefa) {
                                    if indiceTarefa >= 1 && indiceTarefa <= listaExterna.count {
                                        listaExterna = removerTarefa(indice: indiceTarefa, lista: listaExterna)
                                        print("Tarefa removida com sucesso!")
                                    } else {
                                        print("Não há uma tarefa no número informado!")
                                    }
                                } else {
                                    print("Indice inválido.")
                                }
                            } else {
                                print("Entrada inválida")
                            }
                        }
                    case 4:
                        print("--------- Editar Tarefa ---------")
                        if listaExterna.isEmpty {
                            print("Sua lista está vazia. Não há o que editar.")
                        } else {
                            listarTarefas(lista: listaExterna)
                            print("Informe o número da tarefa que deseja editar: ")
                            let indiceTarefa = readLine()
                            if let indiceTarefa = indiceTarefa {
                                if let indiceTarefa = Int(indiceTarefa) {
                                    if indiceTarefa >= 1 && indiceTarefa <= listaExterna.count {
                                        print("Informe o novo nome para a tarefa: ")
                                        let nomeEditado = readLine()
                                        if let nomeEditado = nomeEditado {
                                            listaExterna = editarTarefa(indice: indiceTarefa, novoNome: nomeEditado, lista: listaExterna)
                                            print("Tarefa editada com sucesso!")
                                        }
                                    } else {
                                        print("O número informado não corresponde a nenhuma tarefa.")
                                    }
                                } else {
                                    print("Indice inválido.")
                                }
                            } else {
                                print("Entrada inválida.")
                            }
                        }
                    case 5:
                        print("--------- Mudar Prioridade ---------")
                        if listaExterna.isEmpty {
                            print("Sua lista está vazia. Não há tarefas para reordenar.")
                        } else {
                            listarTarefas(lista: listaExterna)
                            print("Informe o número da tarefa que deseja mover: ")
                            let posicaoAtualStr = readLine()
                            print("Informe a nova posição desejada para essa tarefa: ")
                            let novaPosicaoStr = readLine()
                            if let posicaoAtualStr = posicaoAtualStr {
                                if let novaPosicaoStr = novaPosicaoStr {
                                    if let posicaoAtual = Int(posicaoAtualStr) {
                                        if let novaPosicao = Int(novaPosicaoStr) {
                                            if posicaoAtual >= 1 && posicaoAtual <= listaExterna.count {
                                                if novaPosicao >= 1 && novaPosicao <= listaExterna.count {
                                                    listaExterna = mudarPrioridade(posicaoAtual: posicaoAtual, novaPosicao: novaPosicao, lista: listaExterna)
                                                    print("Prioridade da tarefa alterada com sucesso!")
                                                } else {
                                                    print("Posição nova inválida.")
                                                }
                                            } else {
                                                print("Posição atual inválida.")
                                            }
                                        } else {
                                            print("Valor inválido para nova posição.")
                                        }
                                    } else {
                                        print("Valor inválido para posição atual.")
                                    }
                                } else {
                                    print("Entrada da nova posição inválida.")
                                }
                            } else {
                                print("Entrada da posição atual inválida.")
                            }
                        }
                    case 0:
                        print("Saindo...")
                        return
                    default:
                        print("Inválido")
                }
            } else {
                print("Número da opção inválido.")
            }
        } else {
            print("Formato inválido.")
        }
    }
}

func listarTarefas(lista: [String]) {
    var indice = 1
    for tarefa in lista {
        print("\(indice) - \(tarefa)")
        indice += 1
    }
}

func adicionarTarefas(nome: String, lista: [String]) -> [String] {
    var listaInterna = lista
    listaInterna.append(nome)
    return listaInterna
}

func removerTarefa(indice: Int, lista: [String]) -> [String] {
    var listaInterna = lista
    listaInterna.remove(at: indice - 1)
    return listaInterna
}

func editarTarefa(indice: Int, novoNome: String, lista: [String]) -> [String] {
    var listaInterna = lista
    listaInterna[indice - 1] = novoNome
    return listaInterna
}

func mudarPrioridade(posicaoAtual: Int, novaPosicao: Int, lista: [String]) -> [String] {
    var listaInterna = lista
    let tarefa = listaInterna.remove(at: posicaoAtual - 1)
    listaInterna.insert(tarefa, at: novaPosicao - 1)
    return listaInterna
}

mostrarMenu()