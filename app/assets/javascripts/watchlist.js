$(() => { 
    bindEventListeners()
})


const bindEventListeners = () => {
    $('a.all_watchlists').on('click', e => {
        e.preventDefault();
        var href = $('.all_watchlists').attr('href')
        fetch(href + '.json')
        .then(res => res.json())
        .then(watchlist => {
        $('#app-container').html('')
    
    })
})
};


function Watchlist(attribute) { 
    this.id = attribute.id
    this.name = attribute.name 
    this.description = attribute.description
}