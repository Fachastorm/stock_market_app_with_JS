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
};

Watchlist.prototype.formatList = function() {
    let watchlistHTML = `
      <p>${this.name} - ${this.description}</p>
    `
    return watchlistHTML
  }



  // Build a comments controller and add comments to watchlist so we can use JS to render comments in DOM // 
  // Render the comments form and then submit comments to the watchlist // 