$(() => { 
    onClickListener();
    addStockListener();
});

const onClickListener = () => {
$("#stock-form").on("submit", function(e) { 
    e.preventDefault();
    e.stopPropagation();
    $('#results').html('')
    $.ajax({ 
        type: "GET", 
        url: $(this).attr('action'), 
        data: $(this).serialize(),
    }).success(function(response) {
        var stock = new Stock(response)
        debugger
        const el = $(`<p>
        ${stock.name}
        ${stock.ticker}
        ${stock.last_price}
        <a rel="nofollow" class='add-stock' data-method="post" href="/users/${stock.user}/positions?stock_id=&amp;stock_ticker=${stock.ticker}">Add to my stocks</a>`);
    $('#results').html(el); //append the resulting stock to the page
})
});
};

const addStockListener = () => {
$('body').on('click', '.add-stock', function(e) {
    e.preventDefault();
    e.stopPropagation();
$.ajax({
    type:"POST",
    url: this.href, 
    data: this.innerHTML,
}).success(function(response){
    var stock = new StockResult(response)
   $('#stocklist').append(`<tbody>
   <tr>
       <td>
           ${stock.name}
       </td>
       <td>
           ${stock.ticker}
       </td>
       <td>
           ${stock.last_price} (Closing)
       </td>
           <td>
               <a rel="nofollow" data-method="delete" href="/users/${stock.user}/positions/${stock.id}">Delete</a>
           </td>
   </tr>

</tbody>`)
})
})
return false;
};



function Stock(stock) { 
    this.ticker = stock.ticker
    this.name = stock.name
    this.last_price = stock.last_price
}

function StockResult(stock) { 
    this.ticker = stock.stock.ticker
    this.name = stock.stock.name
    this.last_price = stock.stock.last_price
    this.user = stock.user.id
    this.id = stock.stock.id
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
// </tr>
// </tbody>`
//     return stockHTML
// //     // grab id of list item in order to delete with JSON. First get this to work.
// }

StockResult.prototype.formatItem = function() { 
    let stockResult = `<tbody>
    <tr>
    <td>
    ${this.name}
    </td>
    <td>
    ${this.ticker}
    </td>
    <td>
    ${this.last_price}
    </td>
</tr>
</tbody>`
    return stockResult
}
// // Need to append link to save then fire off the request to save this item in the positions create controller. 
// // ajax POST request and then append to table

// Link to post position and save it:
// <a rel="nofollow" data-method="post" href="/users/1/positions?stock_id=&amp;stock_ticker=MSFT">Add to my stocks</a> 
/* <a rel="nofollow" data-method="delete" href="/users/${this.user}/positions/${this.id}">Delete</a> */