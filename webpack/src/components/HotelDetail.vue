<template>
  <div>
      <h2>Hotel Details</h2>
      <div>{{ hotel.name }}</div>
      <div>{{ hotel.address }}</div>
      <div>{{ hotel.phone }}</div>
      <div>{{ hotel.contact_person }}</div>
      <div>{{ hotel.email }}</div>
  </div>
</template>

<script>
import axios from 'axios'
var apiUrl = process.env.RAILS_URL + '/api'
const hotelUrl = (id) => {
  return apiUrl + '/hotels/' + id
}
export default {
  name: 'hotel-detail',
  props: ['hotel'],
  data () {
    return {
      hotel: null
    }
  },
  created () {
    this.showHotel()
  },
  methods: {
    showHotel () {
      var that = this
      axios.get(hotelUrl(this.$route.params.id))
      .then((res) => {
        that.hotel = res.data
      }).catch((error) => {
        that.errors = error.response.data.errors
      })
    }
  }
}
</script>