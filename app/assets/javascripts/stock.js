$(() => { 
    onClickListener();
});

const onClickListener = () => {
$("#stock-form").on("submit", function(e) { 
        
    $.ajax({ 
        type: "GET", 
        url: $(this).attr('action'), 
        data: $(this).serialize(),
    }).success(function(response) {
        var stock = new Stock(response)
        var el = $(`<tbody>
        <tr>
        <td>
        ${stock.name}
        </td>
        <td>
        ${stock.ticker}
        </td>
        <td>
        ${stock.last_price}
        </td>
        <td>
        <a rel="nofollow" id='add-stock' data-method="post" href="/users/${stock.user}/positions?stock_id=&amp;stock_ticker=${stock.ticker}">Add to my stocks</a>
        </td>
    </tr>
    </tbody>`);
    $(el).on("click", function(e) {
    $.ajax({
        type:"POST",
        url: $(this).attr('href'), 
        data: $(this).serialize(),
    }).success(function(response){
        debugger
        console.log(response)
        e.preventDefault();
    })
})
        $('#results').append(el); //append the resulting stock to the list.
    });
    e.preventDefault();
})
};

function Stock(stock) { 
    this.ticker = stock.ticker
    this.name = stock.name
    this.last_price = stock.last_price
    this.user = stock.users[0].id
}

// Stock.prototype.formatItem = function() { 
//     let stockHTML = `<tbody>
//     <tr>
//     <td>
//     ${this.name}
//     </td>
//     <td>
//     ${this.ticker}
//     </td>
//     <td>
//     ${this.last_price}
//     </td>
//     <td>
//     <div class="add">
//     <a rel="nofollow" id='add-stock' data-method="post" href="/users/${this.user}/positions?stock_id=&amp;stock_ticker=${this.ticker}">Add to my stocks</a>
//     </div>
//     </td>
// </tr>
// </tbody>`
//     return stockHTML
// //     // grab id of list item in order to delete with JSON. First get this to work.
// }

// // Need to append link to save then fire off the request to save this item in the positions create controller. 
// // ajax POST request and then append to table

// Link to post position and save it:
// <a rel="nofollow" data-method="post" href="/users/1/positions?stock_id=&amp;stock_ticker=MSFT">Add to my stocks</a> 
/* <a rel="nofollow" data-method="delete" href="/users/${this.user}/positions/${this.id}">Delete</a> */