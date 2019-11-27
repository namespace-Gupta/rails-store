import Vue from 'vue/dist/vue.js';
import TurbolinksAdapter from 'vue-turbolinks';
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    new Vue({
        el: '#app',
        data: {
            showNav: false
        }
    });
})