itemstorage = {
    fetch: function () {
        return [{item_id: '1', thing: 'ok'}];
    }
}


Vue.component('item', {
    props: ['item'],
    data: function() {return {};},
    template: `
        <div class="pure-g">
            <div class="pure-u-2-5">{{item.item_id}}</div>
            <div class="pure-u-3-5">B</div>
        </div>`
});


var vm = new Vue({
    data: {
        items: []
    },
    mounted: function() {
        this.items = itemstorage.fetch()
    }
});

document.addEventListener('DOMContentLoaded', function(event) {
    vm.$mount('#app');
})