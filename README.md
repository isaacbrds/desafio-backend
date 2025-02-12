# Ranking dos gastos dos Deputados

Estamos muito felizes que você tenha chegado nessa etapa do nosso processo seletivo, para essa fase, desejamos que você resolva um desafio. Nosso desafio consiste em analisar alguns dados disponibilizados pelo Câmara dos Deputados relativos aos gastos dos parlamentares. A ideia é descobrir quem, do seu estado, está gastando mais e exibir de forma resumida esses principais gastos.

## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Base de dados e explicações complementares

- [Fonte de dados (pegar o referente ao ano 2021 em formato CSV)](https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)
- [Explicação dos campos do arquivo CSV](https://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml)
- Ignorar linhas que não tenham no campo `sgUF` o estado que você mora. O objetivo do trabalho é focar apenas no seu estado;
- Considerar para fins de cálculos de despesa, o campo `vlrLiquido`. Esse é o valor que de fato foi debitado da cota do candidato;
- Dica para pegar a foto do político: **http://www.camara.leg.br/internet/deputado/bandep/{ideCadastro}.jpg**


## Requisitos Obrigatórios
- Possibilitar o upload do arquivo;
- Organizar os dados extraidos do arquivo em tabelas no banco de dados;
- Listagem dos deputados do seu estado;
- Mostrar o somatório dos seus gastos;
- Listar as despesas, mostrando a data(`datEmissao`), estabelecimento(`txtFornecedor`), valor(`vlrLiquido`), e link para a nota(`urlDocumento`);
- Destacar a maior despesa do candidato;
- Usar o framework Rails (utilize esse repositório como base);
- Ter uma cobertura de código;

# Requisitos bônus
Esses requisitos não são obrigatórios, mas serão levados em consideração como pontos extras no momento da avaliação.

- Exibir gráficos para melhorar a visualização dos gastos;
- Aplicação hospedada no Heroku, AWS ou similares;
- Evitar N + 1 nas queries;
- Organizar estrutura do projeto utilizando padrões de projetos;

# Critérios de avaliação

- Organização do projeto: Avalia a estrutura do projeto, documentação e uso de controle de versão;
- Coerência: Avalia se os requisitos foram atendidos;
- Boas práticas: Avalia se o projeto segue boas práticas de desenvolvimento, incluindo segurança e otimização;
- Criatividade: Avalia o quanto você "pensou fora da caixa", levando em conta soluções criativas para os problemas levantados;

O desafio deve ser entregue nos passando a URL de seu repositório. Fique a vontade caso queira incrementar o projeto com outras features não listadas aqui, iremos levar em consideração também!

Qualquer dúvida em relação ao desafio, responderemos por e-mail.

Bom trabalho!

#Trechos alterados
- A aplicação está hospedada no Heroku no seguinte endereço: https://desafio-backend-agenda.herokuapp.com/ 
- Utilizei um worker junto ao sidekiq e ao redis para fazer a importação das tabelas
- Traduzei algumas partes do sistema utilizando o locale do próprio Rails
- Tive que atualizar o ruby pois a versão 2.6.5 não é mais suportada pelo Heroku
- Há como acessar a interface de gerenciamento do sidekiq porém está com uma senha por razões de segurança
- Utilizei o bootrap para dar uma aparência melhor ao aplicativo
- Utilizei o google chart para gerar os gráficos de gastos do Deputado
- Testei algumas funcionalidades do projeto apenas para demonstrar o uso do rspec, se fosse uma aplicação real tudo ou praticamente tudo teria que ser testado
- Configurei o Heroku para salvar os arquivos no S3 da AWS

#Tecnologias Utilizadas
- Ruby 3.0.0
- Rails 6.0.5
- Postgresql 12
- Sidekiq 6.4
- Redis 4.0
- RSpec 5.0
- FactoryBot 6.2
- Faker 2.22
- Kaminari 4.0
- AWS S3
- Bootstrap 5.0

