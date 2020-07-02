/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

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