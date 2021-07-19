ItemModel = {
    allRecords: {},

    fetch: function(updateMe) {
        return fetch('/server/items/')
            .then(function(response) {
                return response.json();
            })
            // you need another layer here because response is also a promise
            .then(function(data) {
                data.forEach(item => ItemModel.allRecords[item.item_id] = item);
            });
    },

    all: function() {
        return Object.values(ItemModel.allRecords);
    },

    find: function(id) {
        // by default we want to return a shallow copy so components (the edit form mainly) can't change the original
        // via form bindings
        return Object.assign({}, ItemModel.allRecords[id]);
    },

    create: function(workingItem) {

    },

    update: function(workingItem) {

        itemJson = JSON.stringify(workingItem);
        // url = '/server/items/' + workingItem.item_id;
        url = '/server/items/ham';
        return fetch(url, {method: 'PUT', body: itemJson})
            .then(function(response) {
                if (!response.ok) {
                    // we don't have access to the error message here, so we can't specify :\
                    // It might be worthwhile to make a wrapper for fetch that rejects on 404s so you can get the body
                    // but adding client-side validation might realistically cover all expected problems
                    return Promise.reject('Something went wrong');
                }
                return response.json();
            })
            .then(function(data) {
                // on success the PUT end point returns the item post change, so get that new shit into the records
                ItemModel.allRecords[data.item_id] = data;
            });
    }
}

WorkingDefaults = {
    type: 'm',
    include_in_lists: 'y'
}

Vue.component('item', {
    props: ['item'],
    data: function() {return {};},
    template: `
        <div class="pure-g">
            <div class="pure-u-1-5">{{item.item_number}}</div>
            <div class="pure-u-2-5">{{item.description}}</div>
            <div class="pure-u-1-5">{{item.value}}</div>
            <div class="pure-u-1-5"><button class="" v-on:click.prevent="$emit('edit-item', item.item_id)" >Edit</button></div>
        </div>`
});

Vue.component('control-panel', {
    props: [],
    data: function() {return {};},
    template: `
        <div id="control-panel" class="pure-menu pure-menu-horizontal pure-menu-fixed">
            <ul class="pure-menu-list">
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link" v-on:click.prevent="$emit('change-page', 'work')">New Item</a>
            </li>
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">Export</a>
            </li>
          </ul>
        </div>`
});

Vue.component('work-form', {
    props: ['target'],
    data: function() {return {
        workingItem: {}
    };},
    created: function() {
        if (this.target > 0) {
            this.workingItem = ItemModel.find(this.target);
        } else {
            this.workingItem = WorkingDefaults;
        }
    },
    methods: {
        doASubmit: function() {
            console.log(this.workingItem.item_id);
            console.log('Oh yeah!', this.workingItem);

            if (this.workingItem.item_id) {
                // edit

                ItemModel.update(this.workingItem).then(function() {
                    this.$emit('change-page', 'items');
                }.bind(this))
                .catch(function(error, other) {
                    alert('Something really unexpected happened and your request may not have been saved. Sorry.');
                });

            } else {
                // new item
            }

        },
        doACancel: function() {
            // doing the emit here just in case there needs to be some bookkeeping later on
            this.$emit('change-page', 'items');
        }
    },
    template: `
        <div>
            <form class="pure-form pure-form-aligned">
                <div class="pure-control-group">
                    <label for="item_no">Item #</label>
                    <input type="text" id="item_no" placeholder="" style="width: 5em;"  v-model="workingItem.item_number" />
                </div>

                <div class="pure-control-group">
                    <label for="type">Type</label>
                    <select id="type"  v-model="workingItem.type" >
                        <option value="m">Magic Item</option>
                        <option value="t">Treasure</option>
                        <option value="p">Production Item</option>
                        <option value="r">Ritual Component</option>
                        <option value="o">Other</option>
                    </select>
                </div>

                <div class="pure-control-group">
                    <label for="add_by">Added By</label>
                    <input type="text" id="added_by" placeholder="Whodunit" v-model="workingItem.added_by" />
                </div>

                <div class="pure-control-group">
                    <label for="description">Description</label>
                    <textarea id="description" placeholder="Public facing description" v-model="workingItem.description"></textarea>
                </div>

                <div class="pure-control-group">
                    <label for="notes">Private Notes</label>
                    <textarea id="notes" placeholder="Shhhh, it's a secret" v-model="workingItem.notes"></textarea>
                </div>

                <div class="pure-control-group">
                    <label for="value">Monetary Value</label>
                    <input type="text" id="value" placeholder="Optional" v-model="workingItem.value" />
                </div>

                <div class="pure-control-group">
                    <label for="include">Include in Handouts</label>
                    <input type="radio" id="" name="include" value="y" checked v-model="workingItem.include_in_lists"> Yes
                    <input type="radio" id="" name="include" value="n" v-model="workingItem.include_in_lists"> No
                </div>

                <div class="pure-controls">
                    <button type="submit" class="pure-button pure-button-primary" v-on:click.prevent="doASubmit">Save</button>
                    <button type="submit" class="pure-button" v-on:click.prevent="doACancel">Cancel</button>
                </div>
            </form>
        </div>`
});

var vm = new Vue({
    data: {
        items: [],
        current_page: 'items',
        target: 0,
    },
    methods: {
        changePage: function(page) {
            this.target = 0;
            this.current_page = page;
            // if we're coming back from the edit/create for we need to refresh the local list
            this.setData();
        },
        editItem: function(item_id) {
            this.changePage('work');
            this.target = item_id;            
        },
        setData: function() {
            // the model contains all items, so to support searching we need a seperate list here that's just which ones to show at any given time
            all = ItemModel.all();
            all.sort(function(a,b) { return a['item_number'] - b['item_number']});
            this.items = all;
        }
    },
    mounted: function() {
        ItemModel.fetch()
            .then(this.setData);
    }
});

document.addEventListener('DOMContentLoaded', function(event) {
    vm.$mount('#app');
})