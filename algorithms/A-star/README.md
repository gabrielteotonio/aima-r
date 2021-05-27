# A* Algorithm for 8-puzzle

Class: IN 1100
Created: May 26, 2021 9:03 PM
Materials: https://github.com/gabrielteotonio/aima-r
Reviewed: No
Student: Gabriel Teotonio
Type: Question

# Implementação do algoritmo A* para resolução do problema 8-puzzle

## Definições:

- **Espaço de estados**

    Todas as possíveis configurações do tabuleiro

- **Estado inicial**

    Qualquer um dos estados possíveis (com números fora de ordem)

- **Estado final**

    Números em ordem crescente com espaço em branco na posição [3,3]

- **Ações/operadores**

    Mover espaço em branco (esquerda, direita, acima e abaixo)

- **Custos**

    Número de passos até a solução (estado final)

- **Função heurística**

    Considere a função heurística $h(n)$, em que

    $$h(n) = \text{Número de quadrados em locais errados}$$

    Essa função não superestima o custo até a solução pois, no mínimo, todos os números em quadrados errados precisaram mudar de posição. Ou seja, terá uma ação para cada.

- Função de avaliação

    Considere a função de avaliação $f(n)$, em que

    $$f(n) = g(n) + h(n),$$

    na qual

    $$g(n) = \text{Custo do caminho até o nó atual}$$