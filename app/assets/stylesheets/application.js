document.addEventListener("DOMContentLoaded", function (event) {
  /**--------------------------Validación de select de colores------------------------ */

  /**Variables de los inputs de colores*/
  const selectColorPrimario = document.querySelector(
    "#container_color_primario"
  );
  const selectColorSecundario = document.querySelector(
    "#container_color_secundario"
  );

  if (selectColorPrimario && selectColorSecundario) {
    let colorPrimario = selectColorPrimario.value;
    let colorSecundario = selectColorSecundario.value;

    /**Listener del select de color primario */
    selectColorPrimario.addEventListener("change", (event) => {
      if (event.target.value == colorSecundario) {
        alert("Los colores deben ser diferentes");
        selectColorPrimario.value = colorPrimario;
      } else colorPrimario = event.target.value;
    });

    /**Listener del select de color secundario*/
    selectColorSecundario.addEventListener("change", (event) => {
      if (event.target.value == colorPrimario) {
        alert("Los colores deben ser diferentes");
        selectColorSecundario.value = colorSecundario;
      } else colorSecundario = event.target.value;
    });
  }
});
