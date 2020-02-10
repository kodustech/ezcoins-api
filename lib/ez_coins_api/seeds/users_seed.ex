defmodule EzCoinsApi.Seeds.UsersSeed do
  alias EzCoinsApi.{Accounts, Finances}
  alias Accounts.User
  alias Finances.Wallet
  alias Ecto.Multi

  import Accounts, only: [create_user: 1, get_user!: 1, update_user: 2]
  import Enum, only: [map: 2]
  import Map, only: [put: 3]

  def seed_users(repo) do
    password = password_confirmation = "1234567890A"

    users = [
      %{
        name: "ez.devs",
        email: "admin@ezdevs.com.br",
        avatar: "https://ezdevs.com.br/wp-content/uploads/2019/04/logo_ez-1.png",
        hired_at: ~D[2017-01-01],
        password: "Ez@c01z",
        password_confirmation: "Ez@c01z"
      },
      %{
        name: "Kaku",
        email: "adrianakdefende@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "43726791817",
        password_confirmation: "43726791817"
      },
      %{
        name: "Alan Abreu",
        email: "alan.abreu99@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "41639386807",
        password_confirmation: "41639386807"
      },
      %{
        name: "Alef Barbeli",
        email: "alefbarbeli@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UR0F7T9BR-76c108e16a23-512",
        hired_at: ~D[2019-11-25],
        password: "42184114847",
        password_confirmation: "42184114847"
      },
      %{
        name: "Alexander Yokogawa",
        email: "alexanderyokogawa@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-USCF3PZ5Z-73673375ed5f-512",
        hired_at: ~D[2020-01-01],
        password: "78093759972",
        password_confirmation: "78093759972"
      },
      %{
        name: "Ana Laura",
        email: "anynnha.laureca@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UDM3LANBE-ba00306eae6f-512",
        hired_at: ~D[2018-10-24],
        password: "39041767819",
        password_confirmation: "39041767819"
      },
      %{
        name: "Tonhao Santos",
        email: "ahssantos1@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UP2UV7TNX-g8c0e2f6d538-512",
        hired_at: ~D[2019-10-16],
        password: "39464386878",
        password_confirmation: "39464386878"
      },
      %{
        name: "Aylon Muramatsu",
        email: "aylon.muramatsu@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UPLNZBNP6-a32588cc8579-512",
        hired_at: ~D[2019-10-22],
        password: "42911009819",
        password_confirmation: "42911009819"
      },
      %{
        name: "Bia Ereno",
        email: "beatriz.ereno@ezdevs.com.br",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UQY4CDXV2-e1b3984d6d6e-512",
        hired_at: ~D[2019-11-25],
        password: "46495748892",
        password_confirmation: "46495748892"
      },
      %{
        name: "Bianca Dias",
        email: "bianca.dias@ezdevs.tech",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2018-03-08],
        password: "86502538061",
        password_confirmation: "86502538061"
      },
      %{
        name: "Bruna Castellani",
        email: "brunacastellania@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-USFRCAL0H-07b4156ffe3b-512",
        hired_at: ~D[2020-01-01],
        password: "42513735889",
        password_confirmation: "42513735889"
      },
      %{
        name: "Bruno Gervazio",
        email: "brunogervasio23@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UPJTZRZCJ-d3181feaae3c-512",
        hired_at: ~D[2019-10-30],
        password: "44509663846",
        password_confirmation: "44509663846"
      },
      %{
        name: "Denis Ibanez",
        email: "denis.ibanez@outlook.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UPF91GUMN-g8b3f3839319-512",
        hired_at: ~D[2019-10-16],
        password: "35060864804",
        password_confirmation: "35060864804"
      },
      %{
        name: "Dimi Antoni",
        email: "antonivargas@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UQ0QAG5S9-8cfe4c2c777f-512",
        hired_at: ~D[2019-11-04],
        password: "1394534078",
        password_confirmation: "1394534078"
      },
      %{
        name: "Ed Freitas",
        email: "edvaldo.freitas@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UJCDKC74M-15045a110414-512",
        hired_at: ~D[2019-05-02],
        password: "41117202852",
        password_confirmation: "41117202852"
      },
      %{
        name: "Gabriel Cardoso",
        email: "gabriel.cardoso010@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UAR7USW9L-4fe3f6f27ccf-512",
        hired_at: ~D[2018-03-08],
        password: "40317514865",
        password_confirmation: "40317514865"
      },
      %{
        name: "Grippado",
        email: "grippado@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UQ2HEJ2LT-adf019c96d1e-512",
        hired_at: ~D[2019-11-18],
        password: "7148296684",
        password_confirmation: "7148296684"
      },
      %{
        name: "Gabriel Malinosqui",
        email: "gabriel.malinosqui@ezdevs.com.br",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-U65SG3XKQ-8eaf39a6e606-512",
        hired_at: ~D[2017-10-14],
        password: "41890305898",
        password_confirmation: "41890305898"
      },
      %{
        name: "Gabriel Carvalho",
        email: "gabrilrc@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "22820378803",
        password_confirmation: "22820378803"
      },
      %{
        name: "Guilherme Silva",
        email: "covisque13@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UN0640G94-3def65d03deb-512",
        hired_at: ~D[2019-09-02],
        password: "37282032890",
        password_confirmation: "37282032890"
      },
      %{
        name: "Guilherme Ferreira",
        email: "guiponsoni@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UG9KAGKRP-8e31b4efc2d9-512",
        hired_at: ~D[2019-02-18],
        password: "45544193800",
        password_confirmation: "45544193800"
      },
      %{
        name: "Henrique Marciano",
        email: "henrique.marciano@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UFT1BE831-5356e37bacc3-512",
        hired_at: ~D[2019-01-21],
        password: "42353258840",
        password_confirmation: "42353258840"
      },
      %{
        name: "Ítalo Peruchi",
        email: "italo.peruchi@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-U64FXL9PT-1086f95f29d8-512",
        hired_at: ~D[2017-11-11],
        password: "44027019881",
        password_confirmation: "44027019881"
      },
      %{
        name: "Jonatan Santos",
        email: "jonatandahora@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "41390690822",
        password_confirmation: "41390690822"
      },
      %{
        name: "Júlio César",
        email: "julio.cesar@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UDTDCG52R-35b190947518-512",
        hired_at: ~D[2018-10-31],
        password: "83674228050",
        password_confirmation: "83674228050"
      },
      %{
        name: "Leonardo Carminatti",
        email: "leocarminatti@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-USRUV2XL6-bc1f424f3a92-512",
        hired_at: ~D[2020-01-01],
        password: "32734283840",
        password_confirmation: "32734283840"
      },
      %{
        name: "Lost",
        email: "lost@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UDPANMWR0-a655aa11ab13-512",
        hired_at: ~D[2018-09-18],
        password: "67436685082",
        password_confirmation: "67436685082"
      },
      %{
        name: "Junior Sartori",
        email: "junior.sartori@ezdevs.com.br",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-U655LRX1B-aa7649e53ce5-512",
        hired_at: ~D[2017-12-11],
        password: "41826901841",
        password_confirmation: "41826901841"
      },
      %{
        name: "Ender",
        email: "luizimbroisi@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UT7RFBGR0-90aa36fc8751-512",
        hired_at: ~D[2020-01-01],
        password: "37445537791",
        password_confirmation: "37445537791"
      },
      %{
        name: "Maykon Michel",
        email: "maykonmichelpalma@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UD00K941Y-1133b5e55af8-512",
        hired_at: ~D[2018-09-24],
        password: "47182036860",
        password_confirmation: "47182036860"
      },
      %{
        name: "Nadia Hassegawa",
        email: "nadia.hk2@hotmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-USAQLPMCK-363d35a9d7ca-512",
        hired_at: ~D[2020-01-01],
        password: "37930163822",
        password_confirmation: "37930163822"
      },
      %{
        name: "Paulo Rodrigues",
        email: "pcqrodrigues@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2019-10-11],
        password: "70060300132",
        password_confirmation: "70060300132"
      },
      %{
        name: "Poti Catalan",
        email: "potiguar@potiguar.net",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UQ60RAKB2-372b53a278d4-512",
        hired_at: ~D[2019-11-11],
        password: "26732286838",
        password_confirmation: "26732286838"
      },
      %{
        name: "Rafael Bentivenha",
        email: "bentivenha@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UCV1FGT2Q-131eba56d311-512",
        hired_at: ~D[2018-09-18],
        password: "32109386878",
        password_confirmation: "32109386878"
      },
      %{
        name: "Rafael Sartori",
        email: "rafael.sartori.vantin@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "38363067865",
        password_confirmation: "38363067865"
      },
      %{
        name: "Rafaela Ramos",
        email: "rafaela.ramos@ezdevs.com.br",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UJQ05PARL-26e7f555117b-512",
        hired_at: ~D[2019-01-01],
        password: "63447874066",
        password_confirmation: "63447874066"
      },
      %{
        name: "PH",
        email: "raphaelsantos.j@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "45094655809",
        password_confirmation: "45094655809"
      },
      %{
        name: "Rodrigo Coffani",
        email: "rodrigo.coffani@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UN5TP5MJA-56b5ec308c7d-512",
        hired_at: ~D[2019-09-06],
        password: "44868682857",
        password_confirmation: "44868682857"
      },
      %{
        name: "Rogério Junior",
        email: "rogeriosandrojunior@hotmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "10289469961",
        password_confirmation: "10289469961"
      },
      %{
        name: "Sidney Lima",
        email: "sidneylimafilho@gmail.com",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-UP2FH0YKC-g13c12ed8bb0-512",
        hired_at: ~D[2019-10-21],
        password: "8918661754",
        password_confirmation: "8918661754"
      },
      %{
        name: "Sandro Menezes",
        email: "valksandro@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-01],
        password: "95624716168",
        password_confirmation: "95624716168"
      },
      %{
        name: "Vinicius Brito",
        email: "vbbritodepaulo@gmail.com",
        avatar: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/ce/Aang.png/250px-Aang.png",
        hired_at: ~D[2020-01-06],
        password: "40184004896",
        password_confirmation: "40184004896"
      },
      %{
        name: "Vinícius Carra",
        email: "vinicius.carra@ezdevs.tech",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-U7MKGJPA7-8167ad998e2c-512",
        hired_at: ~D[2017-11-01],
        password: "49537843831",
        password_confirmation: "49537843831"
      },
      %{
        name: "Wellington Santana",
        email: "wellington.santana@ezdevs.com.br",
        avatar: "https://ca.slack-edge.com/T65SG3XGE-U6540FR60-39cbab5e223c-512",
        hired_at: ~D[2017-10-29],
        password: "37127973890",
        password_confirmation: "37127973890"
      },
    ]

    map(
      users,
      fn user ->
        Multi.new()
        |> Multi.insert(
             :user,
             User.changeset(
               %User{},
               user
             )
           )
        |> Multi.run(
             :wallet,
             fn repo, %{user: user} ->
               repo.insert(Wallet.changeset(%Wallet{}, %{owner_user_id: user.id}))
             end
           )
        |> repo.transaction()
        |> IO.inspect()
      end
    )

    resigned_users = [
      %{
        id: 6,
        resigned_at: ~D[2020-01-06]
      },
      %{
        id: 10,
        resigned_at: ~D[2019-08-12]
      },
      %{
        id: 27,
        resigned_at: ~D[2019-11-01]
      },
      %{
        id: 36,
        resigned_at: ~D[2019-08-20]
      }
    ]

    map(
      resigned_users,
      fn %{id: id, resigned_at: resigned_at} ->
        repo.get!(User, id)
        |> User.changeset(%{resigned_at: resigned_at})
        |> repo.update()
        |> IO.inspect()
      end
    )

    repo
  end
end
