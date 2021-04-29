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
Nesse repositório temos o arquivo ``singly_linked_lists.rb`` que contém todo código do exemplo abaixo.

> O exemplo foi desenvolvido utilizando a linguagem Ruby
### Singly Linked List - Example

O primeiro passo para criarmos uma `singly linked list`, é criarmos uma classe que represente a estrutura de dados:

```ruby
class SinglyLinkedList

end
```

Nessa classe vamos incluir um construtor para criar o `Head` da nossa linked list, que iniciará como `nulo`:

```ruby
def initialize
    @head = nil
end
```

Também criaremos um método para nos auxiliar a encontrar o `Tail`:

```ruby
def find_tail
  node = @head

  return node if !node.next
  return node if !node.next while (node = node.next)
end
```

Em seguida vamos definir a estrutura de um `Node`, que será bem simples, ele terá dois atributos: 
- `value` (valor do nó) 
- `next` (ponteiro para o próximo nó)

Segue o exemplo:

```ruby
class Node
    attr_accessor :next
    attr_reader   :value

    def initialize(value)
        @value = value
        @next  = nil
    end
end
```

Por fim podemos incluir métodos para `inserção`, `exclusão` e `busca` na nossa classe `SinglyLinkedList`:

- Busca por um value:

```ruby
  def find(value)
    node = @head
    
    return false if !node.next
    return node  if node.value == value

    while (node = node.next)
      return node if node.value == value
    end
  end
 ``` 

- Inserção no final da linked list:

```ruby
  def append(value)
      if @head
          find_tail.next = Node.new(value)
      else
          @head = Node.new(value)
      end
  end
 ```  
- Inserção após um nó alvo:
```ruby
  def append_after(target, value)
      node = find(target)

    return unless node

    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end
  ```

- Para auxiliar a exclusão, criamos esse método, que basicamente encontra o nó anterior a um determinado value:

 ```ruby
  def find_before(value)
    node = @head

    return false if !node.next
    return node  if node.next.value == value

    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end
```  

- Exclusão:

  ```ruby
  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end

    node = find_before(value)
    node.next = node.next.next
  end
```

E é basicamente isso, podemos fazer o teste criando uma instância da nossa linked list e adicionando aguns valores para testar:

> Obs: Sobreescrevemos o método print em nossa linked list e o método to_s em nosso Node pra melhorar a visualização.

ruby
linked_list = SinglyLinkedList.new

linked_list.append(10)
linked_list.append(20)
linked_list.append(30)

linked_list.append_after(10, 15)
linked_list.append_after(20, 25)

linked_list.print


Output:

bash
Node with value: 10
Node with value: 15
Node with value: 20
Node with value: 25
Node with value: 30