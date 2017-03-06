import Vue from 'vue'
import App from './App'

import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { path: '/', component: App },
    { path: '*', redirect: '/' }
  ]
})

new Vue({router}).$mount('#app')
