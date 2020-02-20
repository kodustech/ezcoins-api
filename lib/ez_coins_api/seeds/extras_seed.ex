defmodule EzCoinsApi.Seeds.ExtrasSeed do
  alias Ecto.{Changeset, Multi}
  alias EzCoinsApi.Finances
  alias Finances.{Donation, Wallet}

  import Changeset, only: [change: 2, put_change: 3]
  import Donation, only: [changeset: 2]
  import Enum, only: [map: 2]
  import Multi, only: [insert: 3, update: 3]

  def seed_extras(repo) do
    extras = [
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 15,
        reason: "Realizar o ez.talks na ez para o pessoal da empresa. - Por que Vue.js?"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Kanban - origem e conceitos"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - Serverless"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Quanto custa um aplicativo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 5,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 500 palavras. - O que é Node.js"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Mulheres na T.I"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Mulheres na T.I"
      },
      %{
        inserted_at: ~N[2019-07-19 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 5,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 500 palavras. - O que é um Roadmap"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - STATIK - O que é e como funciona?"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "22",
        quantity: 15,
        reason:
          "Realizar o ez.talks na ez para o pessoal da empresa. - Por que você deve se aventurar em Flutter?"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 10,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR submetido, mas não aceito. - PR submetido atualizando lodash do vue-json-csv"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 5,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR tem sido aceito pelo owner do projeto. - PR aceito atualizando lodash do vue-json-csv"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 10,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR submetido, mas não aceito. - PR submetido atualizando documentação do adonisjs"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "34",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Meetup - Elastic Search"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "44",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Meetup - Elastic Search"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Vuetify e seus benefícios"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Vuetify e seus benefícios"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Por que Vue.js?"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Por que Vue.js?"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Por que Vue.js?"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - 6 dicas para se dar bem no trabalho remoto"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "18",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Escopo Aberto"
      },
      %{
        inserted_at: ~N[2019-08-04 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason: "Responder comentários nas redes sociais da empresa. - Vuetify e seus benefícios"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "22",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Hack'n Tell"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "10",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Hack'n Tell"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "34",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Hack'n Tell"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 15,
        reason:
          "Realizar alguma palestra relacionada a sua área de atuação na empresa. - Hack'n Tell"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Hack'n Tell"
      },
      %{
        inserted_at: ~N[2019-08-13 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 5,
        reason:
          "Fazer um curso completo, com carga horário de no mínimo 30h que tenha a ver com sua área de atuação na empresa. - Web Design Completo - Origamid "
      },
      %{
        inserted_at: ~N[2019-08-14 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - Como escrever tarefas para o seu time"
      },
      %{
        inserted_at: ~N[2019-08-14 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "23",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Solução Agnóstica de Serveless"
      },
      %{
        inserted_at: ~N[2019-08-14 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "16",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Solução Agnóstica de Serveless"
      },
      %{
        inserted_at: ~N[2019-08-14 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "44",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Solução Agnóstica de Serveless"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 10,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR submetido, mas não aceito. - https://github.com/Volst/react-native-honeywell-scanner/pull/4"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "23",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "22",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "44",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "34",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 10,
        reason:
          "Realizar dojo na empresa, que esteja alinhado com sua área de atuação ou necessidade da empresa. - Dojo - Primeiros passos após criar um servidor na cloud"
      },
      %{
        inserted_at: ~N[2019-08-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Modelo de gestão: como desenhamos nosso processo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "23",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "16",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "44",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Dev Talks - Construindo serviços a partir de um Monolito"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "27",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Papo de Mulher - Cores "
      },
      %{
        inserted_at: ~N[2019-09-05 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Entenda mais sobre OSINT"
      },
      %{
        inserted_at: ~N[2019-09-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Feira de Profissoes da USC - oficina de scripit em Bash"
      },
      %{
        inserted_at: ~N[2019-09-13 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Papo de Mulher - O que é UX?"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 15,
        reason:
          "Realizar o ez.talks na ez para o pessoal da empresa. - #eztalks - React Native com Hooks"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 15,
        reason: "Realizar o ez.talks na ez para o pessoal da empresa. - Boas práticas com GraphQL"
      },
      %{
        inserted_at: ~N[2019-09-23 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "43",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - Formulários com Formik"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 10,
        reason:
          "Gravar um vídeo de conteúdo para o canal da ez. - Entenda a importância de monitorar o vazamento de informações"
      },
      %{
        inserted_at: ~N[2019-09-25 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "43",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Internacionalização com React Native"
      },
      %{
        inserted_at: ~N[2019-10-02 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "43",
        quantity: 5,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 500 palavras. - React com styled-components"
      },
      %{
        inserted_at: ~N[2019-10-03 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "43",
        quantity: 15,
        reason: "Realizar o ez.talks na ez para o pessoal da empresa. - Redux"
      },
      %{
        inserted_at: ~N[2019-10-07 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Alcançando novos usuários através da acessibilidade do IFood"
      },
      %{
        inserted_at: ~N[2019-10-07 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Scrum na prática: Introdução"
      },
      %{
        inserted_at: ~N[2019-10-07 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Alcançando novos usuários através da acessibilidade do IFood"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Jogos sérios na saúde"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - O profissional que o mercado precisa"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Jogos sérios na saúde"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - O profissional que o mercado precisa"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Fractais e Teoria dos Números"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Jogos sérios na saúde"
      },
      %{
        inserted_at: ~N[2019-10-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - O profissional que o mercado precisa"
      },
      %{
        inserted_at: ~N[2019-10-09 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Modelagem numérica de ciclone extratropical"
      },
      %{
        inserted_at: ~N[2019-10-09 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 2,
        reason:
          "Membros da empresa que forem assistir palestras ou workshops de outros colegas da própria ez, ou eventos menores como dev talks e participações em eventos de até 2h - Palestra - Tecnologia na educação: Processos de desenvolvimento e CS"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Scrum na prática: Entendendo o fluxo"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacktoberfest"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacktoberfest"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "16",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacktoberfest"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "23",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacktoberfest"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "44",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacktoberfest"
      },
      %{
        inserted_at: ~N[2019-10-12 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 10,
        reason:
          "Gravar um vídeo de conteúdo para o canal da ez. - Papo de Mulher - (Bate papo Ana Laura feat. Ana Laura)"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hack@day - USC"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 30,
        reason: "Artigos de 1000 palavras durante a semana de promoção. - UX "
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 30,
        reason: "Artigos de 1000 palavras durante a semana de promoção. - Introdução ao Docker"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 30,
        reason:
          "Artigos de 1000 palavras durante a semana de promoção. - Prospectando clientes ou alvos"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 10,
        reason:
          "Pontos extras para quem escrever 2 artigos ou mais na semana de promoção de artigos. - Escreveu 2 ou mais artigos na semana da promoção"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "32",
        quantity: 30,
        reason:
          "Artigos de 1000 palavras durante a semana de promoção. - Construindo uma API GraphQL"
      },
      %{
        inserted_at: ~N[2019-10-22 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - feira de projetos unip"
      },
      %{
        inserted_at: ~N[2019-10-24 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 30,
        reason:
          "Vencedor do concurso de tema da camiseta 2020 - Concurso do tema de camiseta 2020"
      },
      %{
        inserted_at: ~N[2019-10-26 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 5,
        reason:
          "Participar de eventos relacionados a área de TI, negócios, startups e etc. Neste caso, eventos com maior tempo de duração, como 4h, 6h ou 8h - Hacker to hackers conference"
      },
      %{
        inserted_at: ~N[2019-10-27 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 15,
        reason:
          "Realizar alguma palestra relacionada a sua área de atuação na empresa. - OSINT Village - https://github.com/greenmind-sec/palestra-ligth-talk"
      },
      %{
        inserted_at: ~N[2019-10-27 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 15,
        reason:
          "Realizar alguma palestra relacionada a sua área de atuação na empresa. - OSINT Village - https://github.com/greenmind-sec/h2hc-talk-village"
      },
      %{
        inserted_at: ~N[2019-10-28 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 5,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 500 palavras. - Scrum no dia a dia"
      },
      %{
        inserted_at: ~N[2019-10-28 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 5,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR tem sido aceito pelo owner do projeto. - https://github.com/adonisjs/docs/pull/369"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Artigo: Tutorial de como construir uma API GraphQL com NodeJS e ExpressJS"
      },
      %{
        inserted_at: ~N[2019-11-02 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Artigo: Tutorial de como construir uma API GraphQL com NodeJS e ExpressJS (parte 2)"
      },
      %{
        inserted_at: ~N[2019-11-04 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Como medir os resultados do Kanban"
      },
      %{
        inserted_at: ~N[2019-11-08 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 15,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 1000 palavras. - Como melhorar a gestão de projetos?"
      },
      %{
        inserted_at: ~N[2019-11-13 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 10,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 700 palavras. - Health Check Board: O que é?"
      },
      %{
        inserted_at: ~N[2019-11-19 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 10,
        reason:
          "Gravar um vídeo de conteúdo para o canal da ez. - Papo de Mulher - SImone Laborda"
      },
      %{
        inserted_at: ~N[2019-11-21 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 10,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR submetido, mas não aceito. - https://github.com/apollographql/apollo-client/pull/5605"
      },
      %{
        inserted_at: ~N[2019-11-28 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Gravar um vídeo de conteúdo para o canal da ez. - Papo de Mulher - Débora "
      },
      %{
        inserted_at: ~N[2019-12-13 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "28",
        quantity: 5,
        reason:
          "Escrever um artigo relevante para o blog da ez, que esteja alinhado com os objetivos de negócio da empresa. Mínimo de 500 palavras. - Upstream kanban"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: 100,
        reason: "EZ.coins comemorativos de final de ano - O que mais recebeu ez.coins"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: 100,
        reason: "EZ.coins comemorativos de final de ano - O que mais produziu ez.coins"
      },
      %{
        inserted_at: ~N[2020-02-05 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: 10,
        reason:
          "Contribuir de forma relevante com algum projeto open source da comunidade. PR submetido, mas não aceito. - https://github.com/vertcitron/vue-google-api/pull/15"
      }
    ]

    map(
      extras,
      fn %{inserted_at: inserted_at} = attrs ->
        receiver_wallet = repo.get_by!(Wallet, owner_user_id: attrs.receiver_user_id)

        donation =
          changeset(%Donation{}, attrs)
          |> put_change(:inserted_at, inserted_at)

        Multi.new()
        |> insert(:donation, donation)
        |> update(
          :receiver_wallet,
          change(
            receiver_wallet,
            balance: receiver_wallet.balance + attrs.quantity
          )
        )
        |> repo.transaction()
        |> IO.inspect()
      end
    )

    repo
  end
end
