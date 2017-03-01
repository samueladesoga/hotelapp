<template>
	<div id="hotels">
		<table>
			<thead>
		        <tr>
		          <th>Name</th>
		          <th>Address</th>
		          <th>Phone</th>
		          <th>Contact Person</th>
		          <th>Email</th>
		        </tr>
		    </thead>
			<tbody>
				<hotel 
					:hotel="hotel" 
					v-bind:key="hotel.id"
          			v-for="hotel in hotels">
				</hotel>
		        <tr>
		          <td>
		            <!-- Input -->
		            <input type="text" v-model="hotel.name"><br>
		            <!-- Validation errors -->
		            <span class="error">{{ errors.name ? errors.name.join(', ') : '' }}</span>
		          </td>
		          <td>
		            <!-- Input -->
		            <input type="text" v-model="hotel.address"><br>
		            <!-- Validation errors -->
		            <span class="error">{{ errors.address ? errors.address.join(', ') : '' }}</span>
		          </td>
		          <td>
		            <!-- Input -->
		            <input type="text" v-model="hotel.phone"><br>
		            <!-- Validation errors -->
		            <span class="error">{{ errors.phone ? errors.phone.join(', ') : '' }}</span>
		          </td>
		          <td>
		            <!-- Input -->
		            <input type="text" v-model="hotel.contact_person"><br>
		            <!-- Validation errors -->
		            <span class="error">{{ errors.contact_person ? errors.contact_person.join(', ') : '' }}</span>
		          </td>
		          <td>
		            <!-- Input -->
		            <input type="text" v-model="hotel.email"><br>
		            <!-- Validation errors -->
		            <span class="error">{{ errors.email ? errors.email.join(', ') : '' }}</span>
		          </td>		          		     
		          <td><button @click="addHotel">Add Hotel</button></td>
				</tr>				
			</tbody>
		</table>
	</div>
</template>

<script>
import axios from 'axios'
import Hotel from 'components/Hotel'
var apiUrl = process.env.RAILS_URL + '/api'
const hotelsUrl = apiUrl + '/hotels'

export default {
  name: 'hotel-index',
  data () {
    return {
      hotels: [],
      hotel: {
        name: '',
        address: '',
        phone: '',
        contact_person: '',
        email: ''
      },
      errors: {}
    }
  },
  created () {
    this.fetchHotels()
  },
  methods: {
    fetchHotels () {
      var that = this
      axios.get(hotelsUrl)
        .then((res) => {
          that.hotels = res.data
        })
    },
    addHotel () {
      var that = this
      axios.post(hotelsUrl, {
        hotel: that.hotel
      }).then((res) => {
        that.errors = {}
        that.hotels.push(res.data)
        that.hotel = {
          name: '',
          address: '',
          phone: '',
          contact_person: '',
          email: ''
        }
      }).catch((error) => {
        that.errors = error.response.data.errors
      })
    }
  },
  components: {
    Hotel
  }
}
</script>

<style>
h1, h2 {
  font-weight: normal;
}
table {
  margin: 0 auto;
  text-align: left;
}
.error {
  color: red;
}
</style>