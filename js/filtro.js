document.addEventListener('DOMContentLoaded', function () {
  const select = document.getElementById('filtro');

  function getSelectedValues() {
    return Array.from(select.selectedOptions).map(o => o.value);
  }

  select.addEventListener('change', function () {
    const valores = getSelectedValues();
    console.log('Selecionados:', valores);

    // EXEMPLO: enviar para um htmlwidget
    // window.minhaFuncaoWidget(valores);
  });
})


function runfilter(){
  const select = document.getElementById('filtro');
  
  selected = Array.from(select.selectedOptions).map(o => o.value);
  
  console.log('Selecionado: ',selected[[0]])
}
