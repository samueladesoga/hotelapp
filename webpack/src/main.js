import Vue from 'vue'
import App from './App'
import HotelDetail from './components/HotelDetail'
import HotelIndex from './components/HotelIndex'

import VueRouter from 'vue-router'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { path: '/', component: HotelIndex },
    { path: '/hotels', component: HotelIndex },
    { name: 'hotel', path: '/hotels/:id', component: HotelDetail },
    { path: '*', redirect: '/' }
  ]
})

/* eslint-disable no-unused-vars */
const app = new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
