<template>
  <div id="app">
    <header class="header">
      <nav class="inner">
        <router-link to="/">Home</router-link> |
        <router-link to="/hotels">Hotels</router-link>
      </nav>
    </header>
    <router-view></router-view>
  </div>
</template>

<script>
import HotelIndex from './components/HotelIndex'

export default {
  name: 'app',
  components: {
    HotelIndex
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  width: 100%;
}
</style>
