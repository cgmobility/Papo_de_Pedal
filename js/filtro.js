document.addEventListener('DOMContentLoaded', function () {
  const select = document.getElementById('filtro');

  function getSelectedValues() {
    return Array.from(select.selectedOptions).map(o => o.value);
  }

  select.addEventListener('change', function () {
    const valores = getSelectedValues();
    console.log('Selecionados:', valores);
    
  });
})


function runfilter(){
  const select = document.getElementById('filtro');
  
  selected = Array.from(select.selectedOptions).map(o => o.value);
  
  console.log('Selecionado: ',selected[[0]])
  
  frame = document.getElementById('results_frame');
  src_link = '../edicoes/'+ selected + '/' + selected + '.html';
  frame.setAttribute('src',src_link);
  
//  frame.onload = () => {
    // Ajusta a altura com base no scrollHeight do conteúdo interno
//    frame.style.height = frame.contentWindow.document.body.scrollHeight + 'px';
//  };
  
}

window.addEventListener("message", (event) => {
  
  console.log("--- NOVA MENSAGEM RECEBIDA ---");
  
  msg = event.data

  // 2. De onde veio? (URL do iframe)
  console.log("Origem:", msg);
  
  
  // Verifica se a mensagem enviada é o comando para executar sua função
  if (msg.action === "execute_go_to_edition") {
    console.log('aqui');
    go_to_edition(msg.edition_id);
  }
}, false);


function go_to_edition(edition){
  select = document.getElementById('filtro');
  options = select.querySelectorAll('option');
  let index;
  for (var i = 0; i < options.length; i++) {
    if(options[i].textContent.trim() === edition){
      index = i;
    }
  }
  select.selectedIndex = index;
  
  document.getElementById("filtro_btn").click();
  
}

