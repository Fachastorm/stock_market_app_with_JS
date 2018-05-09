$(() => { 
    bindEventListeners()
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


Watchlist.prototype.formatList = function() {
    let watchlistHTML = `
      <ul class="listStocks">
      <li>${this.name} - ${this.description}</li>
      </ul>
    `
    return watchlistHTML
  }


