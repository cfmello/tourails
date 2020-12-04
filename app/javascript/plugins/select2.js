import "select2";

const initSelect2 = () => {
    $( "#offer_city" ).select2();
    console.log('Passei por aqui');
}

export { initSelect2 }