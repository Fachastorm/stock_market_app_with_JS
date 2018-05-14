$(() => { 
    bindEventListeners()
    sortList()
})


const bindEventListeners = () => {
    $('.all_watchlists').on('click', e => {
        e.preventDefault(); 
        fetch('/watchlists.json')
        .then(res => res.json())
        .then(watchlists => {
            $('#app-container').html('')    
            watchlists.forEach(watchlist => { 
                // debugger
                    let newWatchlist = new Watchlist(watchlist)
                    let watchlistHTML = newWatchlist.formatList()
                    $('#app-container').append(watchlistHTML)
            })
        })
    })
}
function Watchlist(watchlist) { 
    this.id = watchlist.id
    this.name = watchlist.name 
    this.description = watchlist.description
    this.amount = watchlist.amounts[0].quantity
};
 
const sortList = () => { 
    var $divs = $("div.listStocks");

$('#sort').on('click', function () {
    console.log('clicked')
    var numericSort = $divs.sort(function (a, b) {
        return $(a).find("h2").text() > $(b).find("h2").text();
    });
    $("#app-container").append(numericSort);
});
}
 

Watchlist.prototype.formatList = function() {
    let watchlistHTML = `
      <div class="listStocks">
      <h1>${this.name} - ${this.description}</li>
      <h2>${this.amount}</li>
      </div>
      <button id="sort" onClick="sortList()">Sort</button>

    `
  return watchlistHTML
  }

