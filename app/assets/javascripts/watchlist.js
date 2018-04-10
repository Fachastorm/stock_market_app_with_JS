$(() => { 
    bindEventListeners()
})


const bindEventListeners = () => {
    $('a.all_watchlists').on('click', e => {
        e.preventDefault();
        var href = $('.all_watchlists').attr('href')
        fetch(href + '.json')
        .then(res => res.json())
        .then(posts => {
        $('#app-container').html('')
    
    })
})
};
