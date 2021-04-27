# Linked Lists

`Linked lists` (ou Listas Encadeadas) é uma estrutura de dados semelhantes às listas convencionais. A diferença se dá na forma em que os elementos são armazenados.

Em listas convencionais os elementos são armazenados de forma contínua, já nas `linked lists`, cada elemento é armazenado de forma separada, possuindo duas informações:

- Um valor .
- E um pointeiro para o próximo elemento da lista.

    - Ponteiro: é uma variável que armazena o endereço (ou referência) de outra variável.

A vantagem de se utilizar `Linked lists`, é que há um grande ganho de flexibilidade, pois a estrutura de dados é dinâmica, ou seja, ela pode aumentar e diminuir seu tamanho em tempo de execução. Desse modo, não é necessário informar o tamanho inicial da lista.

Antes de vermos as `Linked Lists` na prática, é necessário entender algumas nomenclaturas que compoem a estrutura de uma `Linked List`:

- Node: Seria um elemento na nossa `Linked List` (pode ser traduzido para nó)
    - Value: Seria o valor presente nesse nó.
    - Pointer: Seria o ponteiro que aponta para o próximo nó da `Linked List`.
- Head: Seria basicamente o início (ou cabeça) da nossa `Linked List`.
- Tail: Seria o final (ou rabo) da `Linked List`.
    - Uma observação interessante é que o pointer do Tail é sempre nulo

> Tanto o Head quanto o Tail também são Nodes!

Imagem representativa:

![imagem singly linked list](https://hackernoon.com/images/471bw32gl.jpg)

## Doubly-Linked List

O que apresentamos anteriormente, são as Listas Simplemente Encadeadas (ou `Singly-Linked List`).

Além dela temos as Listas Duplamente Encadeadas (ou `Doubly-Linked List`).

Basicamente, a diferença se dá por elas possuírem dois ponteiros, que apontam para ambas as direções, o que torna possivel a navegação inversa à convencional apresentada na `Singly-Linked List`.

Estrutura de uma `Doubly-Linked List`:

- Node
    - Value
    - Next: Ponteiro para o próximo nó da lista
    - Previous: Ponteiro para o nó anterior.
- Head
    - Observação importante, o Previous do Head será sempre nulo.
- Tail

> Tanto o Head quanto o Tail também são Nodes!

Imagem representativa:

![imagem doubly linked list](https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2014/03/DLL1.png)


## Exemplo prático
Nesse repositório temos o arquivo ``linked_lists.rb`` que contém todo código do exemplo abaixo.

> O exemplo foi desenvolvido utilizando a linguagem Ruby

O primeiro passo para criarmos uma `linked list`, é criarmos uma classe que represente a estrutura de dados:

```ruby
class LinkedList

end
```

Nessa classe vamos incluir um construtor para criar o `Head` da nossa linked list, onde inicialmente deixaremos ele nulo:

```ruby
def initialize
    @head = nil
end
```