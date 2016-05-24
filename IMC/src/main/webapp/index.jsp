<html>
	<meta charset="UTF-8">
	<title>Cálculo do IMC</title>
	<head>
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/custom.css"  media="screen,projection"/>

		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
          
	</head>

	<body style="background-position: center; background-repeat: no-repeat;background-attachment: fixed;" background="img/blue_background.jpg">
		
		<div class="row section">
            <div class="mytitle">
                IMCalc
            </div>
            <p class="introtext">Cálculo do Índice de Massa Corporal</p>
        </div>

		<div class="row section">
	        <div class="card defaultCard default-page-margin-top col s6 offset-s3">
			    <div class="card-content">

					<div class="row">
						<form name="imc_form" id="imc_form" action="#" class="col s12">
							<div class="row">
						        <div class="input-field col s12">
						        	<input id="height" name="height" type="number" class="validate" step="0.01">
						        	<label for="number" data-error="Altura inválida" data-success="Altura válida">Altura (em metros)</label>
						        </div>
						     </div>

						     <div class="row">
						        <div class="input-field col s12">
						        	<input id="weight" name="weight" type="number" class="validate" step="0.01">
						        	<label for="number" data-error="Peso inválido" data-success="Peso válido">Peso (em kilogramas)</label>
						        </div>
						     </div>

						     <div class="row">
							     <div class="input-field col s12">
								    <select>
								      <option value="" disabled selected>Escolha seu gênero</option>
								      <option value="1">Masculino</option>
								      <option value="2">Feminino</option>
								    </select>
								    <label>Seleção de gênero</label>
								  </div>
							</div>

							<div class="input-field col s12">
								<button class="btn waves-effect waves-yellow col s12 orange" id="resultButton" onclick="openingModal();">Resultado
								    <i class="material-icons right">send</i>
								</button>
							</div>
						</form>
					</div>
			     


				</div>
		    </div>
	    </div>


		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('select').material_select();
			  });
			  
			  $(document).ready(function() {
			  	var params = location.search.split('height=')[1]
			    if( typeof params != 'undefined' ) $('#result').openModal();
			  });
		</script>
		<%
			String heightStr = request.getParameter("height");
			String weightStr = request.getParameter("weight");
			
			float height = heightStr == null ? 0 : Float.parseFloat(heightStr);
			float weight = weightStr == null ? 0 : Float.parseFloat(weightStr);
			
			float calculation = (weight/(height * height));
			
			String result = "";
			if(calculation < 16){
				result = "Seu IMC indica -> Baixo peso muito grave: " + calculation;
			}
			else if(calculation >= 16 && calculation < 17){
				result = "Seu IMC indica -> Baixo peso grave: " + calculation;
			}

			else if(calculation >= 17 && calculation < 18.50) {
				result = "Seu IMC indica -> Baixo peso: " + calculation;
			}
			else if(calculation >= 18.50 && calculation < 25) {
				result = "Seu IMC indica -> Peso normal: " + calculation;
			}
			else if(calculation >= 25 && calculation < 30) {
				result = "Seu IMC indica -> Sobrepeso: " + calculation;
			}
			else if(calculation >= 30 && calculation < 35) {
				result = "Seu IMC indica -> Obesidade grau I: " + calculation;
			}
			else if(calculation >= 35 && calculation < 40) {
				result = "Seu IMC indica -> Obesidade grau II: " + calculation;
			}
			else if (calculation >= 40)
				result = "Seu IMC indica -> Obesidade grau III: " + calculation;
		
		%>
		
		
								
		  <!-- Modal Structure -->
		  <div id="result" class="modal">
		    <div class="modal-content">
		      <h4>Índice de Massa Corporal</h4>
		      <p><% out.print(result); %></p>
		    </div>
		    <div class="modal-footer">
		      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">OK</a>
		    </div>
		  </div>
	</body>
</html>