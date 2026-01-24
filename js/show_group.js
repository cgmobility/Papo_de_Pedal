setTimeout(function () {
  
  const iframe = document.getElementById("leafmap_edicoes");
  
  iframe.contentWindow.postMessage(
    { type: "MAP_CMD", payload: { grupo: "GRUPO_ID", latitude: "LATITUDE", longitude: "LONGITUDE" } },
    "*"
  );
  
}, 1000);
