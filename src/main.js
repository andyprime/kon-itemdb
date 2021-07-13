itemstorage = {
    fetch: function(updateMe) {
        fetch('/server/items/')
            .then(function(response) {
                return response.json();
                
            })
            // you need another layer here because response is also a promise
            .then(function(data) {
                updateMe.items = data;
            });

    },

    fetchTest: function () {
        return [{item_id: '1', description: 'ok'}, {item_id: 2, description: 'honky tonk'}];
    }
}


Vue.component('item', {
    props: ['item'],
    data: function() {return {};},
    template: `
        <div class="pure-g">
            <div class="pure-u-1-5">{{item.item_number}}</div>
            <div class="pure-u-3-5">{{item.description}}</div>
            <div class="pure-u-1-5">{{item.value}}</div>
        </div>`
});


var vm = new Vue({
    data: {
        items: []
    },
    mounted: function() {
        this.items = itemstorage.fetch(this)
    }
});

document.addEventListener('DOMContentLoaded', function(event) {
    vm.$mount('#app');
})