const cartInfo = document.getElementById('cart-info')
const alertPlaceholder = document.getElementById('liveAlertPlaceholder')


function addToCart(product_form_id) {
    const cartForm = document.getElementById(product_form_id);

    fetch(cartForm.action, {
        method: 'POST',
        body: new FormData(cartForm),
    }).then(response => {
        if (response.ok) {
            response.text().then(text => {
                cartInfo.innerHTML = text
            })
        } else {
            alertPlaceholder.innerText = 'Something went wrong'
        }
    })
}

function updateQuantityCartTable(form_id) {
    const cartTable = document.getElementById('cart-table');
    const cartTableForm = document.getElementById(form_id);

    fetch(cartTableForm.action, {
        method: 'POST',
        body: new FormData(cartTableForm),
    }).then(response => {
        if (response.ok) {
            response.text().then(text => {
                cartTable.innerHTML = text
            })
        } else {
            alertPlaceholder.innerText = 'Something went wrong'
        }
    })
}

function removeProductFromCart(path) {
    const cartTable = document.getElementById('cart-table')

    fetch(path, {
        method: 'DELETE',
    }).then(response => {
        if (response.ok) {
            response.text().then(text => {
                cartTable.innerHTML = text
            })
        } else {
            alertPlaceholder.innerText = 'Something went wrong'
        }
    })
}