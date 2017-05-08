# Inventory (vlab for [http://globo.com/](http://globo.com/))

Um pequeno projeto para testar minhas habilidades.

![frontend-scshot](../master/scshot/frontend-scshot.png)

## Desafio

Construir um sistema CRUD (create, read, update, delete) da maneira que se sentir mais confortável, apenas seguindo os seguintes pré-requisitos:
- **(√)** Banco de dados (**preferencialmente NoSQL**)
- **(√)** As operações que manipulam dados devem ser autenticadas
- **(√)** Testes do código (**livre escolha**)
- **(√)** Deploy em um PAAS, ou em algum outro serviço na nuvem
- **(√)** O código deve ser publicado no Github
A análise do código é com foco na segurança, não se preocupe com UX!

## Solução

### Instalação

#### Pré-requisitos

Ter instalado localmente (apenas p/ Desenvolvimento e Teste):
- [Git](https://git-scm.com/)
- [Ruby](https://ruby-lang.org)
- [Bundle](http://bundler.io/)
- [RubyGems](https://rubygems.org/)
- [Rake](https://github.com/ruby/rake)
- [Rails](http://rubyonrails.org/)

#### Instalando dependências

```bash
$ git clone https://github.com/raulpereira/inventory.git
$ cd inventory
$ bundle install --without production
```

### Subir & Rodar

#### Ambiente de desenvolvimento

```bash
$ bin/rails db:environment:set RAILS_ENV=development
$ rake db:migrate RAILS_ENV=development
$ rails s
```
![dsv-scshot](../master/scshot/dsv-scshot.png)

#### Ambiente de teste

```bash
$ bin/rails db:environment:set RAILS_ENV=test
$ rake db:migrate RAILS_ENV=test
$ rspec .
```
![tst-scshot](../master/scshot/tst-scshot.png)

#### Ambiente de produção

Acesse => *[https://inventory-rp.herokuapp.com/](https://inventory-rp.herokuapp.com/)* :clap:

### Considerações

#### Plataforma

**[Rails](http://rubyonrails.org/)**: Escolhido para continuar a estudar o potencial da plataforma e por acreditar que conseguiria finalizar o máximo das requisições necessárias para o teste em menos tempo.

#### Backend

##### Web Server

**[Puma.io](http://puma.io/)**: É a escolha padrão da plataforma, na versão utilizada ([5.0.2](http://weblog.rubyonrails.org/2017/3/1/Rails-5-0-2-has-been-released/)), além de ser indicado pelo local que será hospedado em produção.

##### Banco de dados

**[SQLite](https://sqlite.org/)**: Utilizado por já vir embarcado na plataforma e facilitar o desenvolvimento local. 

**[PostgreSQL](https://www.postgresql.org/)**: Escolhido por ser indicado pelo local que será hospedado em produção.

##### Segurança

**[Devise](https://github.com/plataformatec/devise)**: Foi utilizado esta biblioteca de módulos para solucionar questões de segurança aos serviços que a aplicação possui. Hoje a aplicação permite o cadastro de novos usuários e apenas o usuário autenticado pode acessar o cadastro de materiais, além disso somente ele tem acesso aos materiais cadastrados por ele na aplicação.

#### Frontend

**[HTML](https://w3.org/html/)** + **[CSS](https://w3.org/Style/CSS/)** (c/ **[Bootstrap](http://getbootstrap.com/)**) + **[JS](https://developer.mozilla.org/en-US/docs/Web/JavaScript)** (c/ **[CoffeeScript](http://coffeescript.org/)** + **[jQuery](https://jquery.com/)**): Não usei nenhuma plataforma para implementar esta camada, apenas bibliotecas facilitadoras.

#### Testes

**[RSpec](http://rspec.info/)**: Toda a estrutura do modelo e controle foi coberta, backend), ficou pendente realizar os testes para os helpers e os cenários para os features, frontend. A finalização de todos os testes é mais do que necessária para orquestrar todo processo de implantação em ambiente de produção com mais segurança.

#### Servidores de produção

**[Heroku](https://heroku.com)** (PAAS): Escolhido por ter suporte grátis para aplicações [Rails](http://rubyonrails.org/), além de ter uma boa integração com o [GitHub](https://github.com/).

## Conclusão

Continuo feliz com a produtividade desta plataforma, o maior tempo para construção desta solução foi dedicado à construção dos testes, o foco foi cobrir toda parte backend possível. Mas ficou pendente cobrir todos os cenários possíveis do frontend, o que é bastante importante para segurança e evolução da aplicação.

Além disso ficou faltando utilizar um banco de dados não relacional, porém, como este quesito não era obrigatório, a construção da aplicação foi feita de maneira que esta mudança seja menos problemática possível, apenas sendo necessário plugar este tipo de banco caso seja obrigatório.

Fica como melhoria desta solução, acabar de cobrir com teste o restante da aplicação e substituir o banco de produção por um NoSQL, a princípio será o [MongoDB](https://mongodb.com/).

**ADIANTE!** :muscle:
