# Poc_ts

Essa é uma api para guardar palpites dos jogos do grupo do Brasil na copa do mundo.

Esses jogos são:
<ul>
  <li> 1 - Brasil x Sérvia </li>
  <li> 2 - Brasil x Suíça </li>
  <li> 3 - Brasil x Camarões </li>
  <li> 4 - Sérvia x Suíça </li>
  <li> 5 - Sérvia x Camarões </li>
  <li> 6 - Suíça x Camarões </li>
</ul>

## Palpitar

Para marcar seu palpite, basta mandar um request post para a rota /palpites com o Body:

<p>
  { <br>
    "nome": --insira uma string com o seu nome <br>
    "jogoId": --insira o id do jogo no qual você quer palpitar* <br>
    "placarMandante": --insira um number descriminando o placar final da seleção mandante** <br>
    "placarVisitante": --insira um number descriminando o placar final da seleção visitante** <br>
    "marcadores": --insira uma string descriminando os marcadores e a quantidade de gols *** <br>
  } <br>
  * O id de cada jogo está descriminado na lista de jogos acima. <br>
  ** Mandante é a seleção que está na esquerda da lista e Visitante é a da direita <br>
  *** Caso o palpite seja 0 x 0, em marcadores deve ser enviada a string "sem marcadores" 
</p>

## Lista de palpites

Para receber uma lista com todos os palpites já registrados, mande uma requisição get para a rota /palpites


## Mudar palpite

<p>Para mudar um palpite já registrado, basta mandar uma requisição put para /palpites/id. Onde "id" é o id do palpite que se pretende modificar.<br>

Junto da requisição deve ser enviado um body com as mesma keys da requisição post (confira em <b>Palpitar</b>) mas com as alterações desejadas.<br>

<b>OBS:</b> Só é possivel alterar os placares e o campo marcadores. <br>
<b>OBS2:</b> Caso o id não esteja relacionado com nenhum palpite existente, será retornado um código 404. 

</p>

## Deletar Palpite

<p>Para deletar um palpite, basta enviar uma requisição delete para a rota /palpites/id onde id é o id do palpite que se deseja deletar<br>

<b>OBS:</b> Caso o id não esteja relacionado com nenhum palpite existente, será retornado um código 404. 
</p>




  
