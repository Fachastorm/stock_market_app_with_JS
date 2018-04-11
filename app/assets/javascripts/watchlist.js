$(() => { 
    bindEventListeners()
})


const bindEventListeners = () => {
    $('.all_watchlists').on('click', e => {
        e.preventDefault();
        var data = {}
        $.ajax({
            data: data,
            dataType: 'application/json',
            url: 'http://localhost:3000/watchlists.json',
            type: 'GET',
            success: function (watchlists) {
                $('#app-container').html('')
                watchlists.forEach(watchlist => {
                let newWatchlist = new Watchlist(watchlist)

                let watchlistHTML = newWatchlist.formatIndex()

                $('#app-container').append(watchlistHTML);
            },
            failure: function (errMsg) {
                alert(errMsg);
            }
        });
        
    })
};



function Watchlist(attribute) { 
    this.id = attribute.id
    this.name = attribute.name 
    this.description = attribute.description
}