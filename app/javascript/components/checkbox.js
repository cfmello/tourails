const initCheck = () => {
  const check = document.querySelector('#offer_active');
  if (check) {
    check.addEventListener('click',(event) => {
      // event.preventDefault()
      // console.log(event.target.value)
      if (!event.target.checked) {
        if(window.confirm('Está certo disso? Essa oferta ficará oculta para outros usuários')) {
          event.target.setAttribute('value',0)
          event.target.parentNode.querySelector('label').innerText = 'Reativar oferta'
        }
      }else{
        event.target.setAttribute('value',1)
        event.target.parentNode.querySelector('label').innerText = 'Desativar oferta'
      }
    })
  }
}

export { initCheck }