<template>
  <tr>
    <td>
      <!-- Show input when in edit mode -->
      <div v-if="editMode">
        <input type="text" v-model="hotel.name"><br>
        <span class="error" v-if="errors.name">{{ errors.name.join(', ') }}</span>
      </div>
      <div v-else>{{ hotel.name }}</div>
    </td>
    <td>
      <div v-if="editMode">
        <input type="text" v-model="hotel.address"><br>
        <span class="error" v-if="errors.email">{{ errors.address.join(', ') }}</span>
      </div>
      <div v-else>{{ hotel.address }}</div>
    </td>
    <td>
      <div v-if="editMode">
        <input type="text" v-model="hotel.phone"><br>
        <span class="error" v-if="errors.phone">{{ errors.phone.join(', ') }}</span>
      </div>
      <div v-else>{{ hotel.phone }}</div>
    </td>
    <td>
      <div v-if="editMode">
        <input type="text" v-model="hotel.contact_person"><br>
        <span class="error" v-if="errors.contact_person">{{ errors.contact_person.join(', ') }}</span>
      </div>
      <div v-else>{{ hotel.contact_person }}</div>
    </td>
    <td>
      <div v-if="editMode">
        <input type="text" v-model="hotel.email"><br>
        <span class="error" v-if="errors.email">{{ errors.email.join(', ') }}</span>
      </div>
      <div v-else>{{ hotel.email }}</div>
    </td>
    <td>
      <router-link :to="{ name: 'hotel', params: { id: hotel.id }}">View Details</router-link>
      <!-- Save button calls updateHotel -->
      <button v-if="editMode" @click="updateHotel">Save</button>
      <!-- Edit button puts row into edit mode -->
      <button v-else @click="editMode = true">Edit</button>
      <!-- the Fire button inside the component template-->
      <button v-if="!editMode" @click="deleteHotel" style="color:red">Delete</button>
    </td>
  </tr>
</template>

<script>
import axios from 'axios'
var apiUrl = process.env.RAILS_URL + '/api'
const hotelUrl = (id) => {
  return apiUrl + '/hotels/' + id
}
export default {
  name: 'hotel',
  props: ['hotel'],
  data () {
    return {
      editMode: false,
      errors: {}
    }
  },
  methods: {
    updateHotel () {
      var that = this
      axios.put(hotelUrl(that.hotel.id), {
        hotel: that.hotel
      }).then((res) => {
        that.errors = {}
        that.hotel = res.data
        that.editMode = false
      }).catch((error) => {
        that.errors = error.response.data.errors
      })
    },
    deleteHotel: function () {
      var that = this
      axios.delete(hotelUrl(that.hotel.id))
        .then((res) => {
          that.$el.remove()
        })
    }
  }
}
</script>