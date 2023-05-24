const cartQuantity = document.getElementById('cartQuantity')
const alertPlaceholder = document.getElementById('liveAlertPlaceholder')


function addToCart(id) {
    const cart_form = document.getElementById(id);

    fetch(cart_form.action, {
        method: 'POST',
        body: new FormData(cart_form),
    }).then(response => {
        let json = response.json()
        if (response.status === 201) {
            json.then(data => {
                console.info('add to cart');
                createMessage(data)

                cartQuantity.innerText = data.quantity
            });
        } else {
            json.then(data => {
                createMessage(data)
            });
        }
    })
}

function createMessage(data) {
    alertPlaceholder.innerHTML = ''

    const wrapper = document.createElement('div')

    wrapper.innerHTML = [
        `<div class="alert alert-${data.type} alert-dismissible" role="alert">`,
        `   <div>${data.message}</div>`,
        '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
        '</div>'
    ].join('')

    alertPlaceholder.append(wrapper)
}