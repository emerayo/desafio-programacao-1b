# Desafio de programação 1B

Desenvolvimento da solução do Desafio de Programação 1B.
O sistema deve receber um arquivo com vendas, tratá-lo e realizar a ingestão dos dados.

## Dependências

1. Ruby 2.3
2. Rails 5.1.3
3. SQlite 3

## Instruções para instalação e execução

1. Faça o clone do repositório
```
git clone https://github.com/emerayo/desafio-programacao-1b.git
```
2. Abra o diretório onde o clone se encontra
```
cd desafio-programacao-1b
```
3. Instale as dependências
```
bundle install
```
4. Crie o banco de dados com
```
rails db:create
```
5. Rode as migrações
```
rails db:migrate
```
6. Inicialize o servidor
```
rails s
```
7. Abra a página no navegador
```
http://localhost:3000/sales
```