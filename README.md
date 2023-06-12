# *Portuscript*

EBNF: [EBNF.md](./EBNF.md)


### Instalação

Em um ambiente node:

~~~
npm install @cicerotcv/portuscript
~~~

ou

~~~
yarn add @cicerotcv/portuscript
~~~


### Programa de Exemplo

~~~
const { Parser }  require("@cicerotcv/portuscript");

const source = `
funcao fib(n) {
  se ((n == 0) || (n == 1)) {
    retorne 1;
  }  
  retorne fib(n - 1) + fib(n - 2);
}

constante LIMITE = 15;
seja x = 0;
enquanto (x < LIMITE) {
  imprima("Fib:", fib(x));
  x = x + 1;
}
`

Parser.run(source)

~~~
