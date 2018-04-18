$(() => { 
    $("#new_stock").on("click", e => { 
        e.preventDefault();
        $.ajax({ 
            type: "GET", 
            url: this.action, 
            data: $(this).serialize(),
        }).success(function(response) {
            var stock = new Stock(response)
            var stockHTML = stock.formatItem()
            $('#results').append(stockHTML);
        })
})
});


function Stock(stock) { 
    this.ticker = stock.ticker
    this.name = stock.name
    this.last_price = stock.last_price
}

Stock.prototype.formatItem = function() { 
    let stockHTML = `<p>${this.name} - ${this.last_price}`
}