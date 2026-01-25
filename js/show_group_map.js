function getLeafletMap(){
  const el = document.querySelector(".leaflet.html-widget");
  if (!el) return null;
  const widget = HTMLWidgets.find("#" + el.id);
  if (!widget || !widget.getMap) return null;
  return widget.getMap();
}


function showGroup (groupnm,latitude,longitude){
  layers = document.querySelectorAll("div.leaflet-control-layers-overlays>label");
  layers.forEach(function(obj){
    nm = obj.querySelector("span").textContent.trim();
    if (nm === groupnm.trim()) {
        obj.click()
    }
})
  const map = getLeafletMap();
  map.flyTo([Number(latitude), Number(longitude)], 14);
    // alternativa suave:
    // map.flyTo([lat, lon], zoom ?? map.getZoom());
};

function tryShow(group,latitude,longitude) {
  const layers = document.querySelectorAll("div.leaflet-control-layers-overlays>label");
  if (!layers || layers.length === 0) {
    setTimeout(() => tryShow(group,latitude,longitude), 100);
    return;
  }
  showGroup(group,latitude,longitude);
}

window.addEventListener("message", (event) => {
  
  console.log("--- NOVA MENSAGEM RECEBIDA ---");

  // 2. De onde veio? (URL do iframe)
  console.log("Origem:", event.data);
  
  const msg = event.data;
  if (!msg || msg.type !== "MAP_CMD") return;   // filtro

  const payload = msg.payload || {};

  tryShow(payload.grupo, payload.latitude, payload.longitude)
});

setTimeout(function(){
    const elem = document.querySelector("div.leaflet-control-layers-overlays");
    elem.style.visibility = "hidden";
    elem.style.height = "0px";
  },1000)


function go_to_edition_son(edition){
  console.log("Enviando edição para o topo:", edition);
  window.parent.parent.postMessage(
    { action: "execute_go_to_edition", edition_id: edition},
    "*"
    );
}
