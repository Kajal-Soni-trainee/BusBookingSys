<template>
  <div class="d-flex flex-column justify-center align-center mainDiv">
    <h1 class="text-center">Add Details</h1>
    <v-card
      width="1000px"
      class="pa-5"
      style="border: 3px solid rgb(246, 126, 83)"
    >
      <v-text-field
        color="deep-orange-darken-1"
        type="date"
        label="Date"
        v-model="ticketDate"
      ></v-text-field>
      <div v-for="passenger in passengerData" :key="passenger.id">
        <v-text-field
          label="Name"
          color="deep-orange-darken-1"
          v-model="passenger.name"
        ></v-text-field>
        <v-text-field
          label="Gender"
          color="deep-orange-darken-1"
          v-model="passenger.gender"
        ></v-text-field>
        <v-text-field
          label="Age"
          color="deep-orange-darken-1"
          v-model="passenger.age"
        ></v-text-field>
      </div>
      <div>
        <v-btn class="bg-deep-orange-darken-1 ma-2" @click="addPassenger"
          >Add Passenger</v-btn
        >
        <v-btn
          variant="outlined"
          color="deep-orange-darken-1"
          class="ma-2"
          @click="removePassenger"
          >Remove</v-btn
        >
        <p class="text-h6 text-right">
          <span class="text-deep-orange-darken-1">Price </span>
          <span>-/{{ price * passengerData.length }}</span>
        </p>
      </div>
      <div class="d-flex flex-row justify-center align-center">
        <v-btn class="bg-green" @click="pay">Proceed To Pay</v-btn>
      </div>
    </v-card>
  </div>
</template>
<script setup>
import { useRoute } from "vue-router";
import { ref, reactive, onMounted } from "vue";
import { axiosPost } from "@/services/service";
import { loadStripe } from "@stripe/stripe-js";
const route = useRoute();
const busId = ref(route.query.busId);
const source = ref(route.query.source);
const dest = ref(route.query.dest);
const price = ref(route.query.price);
const stripe = ref(null);
const ticketDate = ref(null);
const passengerData = reactive([
  {
    id: 1,
    name: null,
    gender: null,
    age: null,
    busId: busId.value,
  },
]);
function addPassenger() {
  const length = passengerData.length;
  passengerData.push({
    id: length + 1,
    name: null,
    gender: null,
    age: null,
    busId: busId.value,
  });
}

function removePassenger() {
  passengerData.pop();
}

async function pay() {
  console.log(busId.value);
  console.log(source.value);
  console.log(dest.value);
  const ticket = await axiosPost("/createTicket", {
    source: source.value,
    destination: dest.value,
    ticketDate: ticketDate.value,
    busDetail: busId.value,
  });
  console.log(ticket.data);
  if (ticket.status == 200) {
    const ticketId = ticket.data.ticketId;
    const addPassResult = await axiosPost("/addPassengers", {
      ticketId: ticketId,
      passengers: passengerData,
    });
    if (addPassResult.status) {
      console.log(addPassResult);
    }
  }
  const result = await axiosPost("/makePayment", {
    price: price.value * passengerData.length,
    ticketId: ticket.data.ticketId,
  });

  const session = result.data;
  console.log(session);
  const { error } = await stripe.value.redirectToCheckout({
    sessionId: session.id,
  });
  if (error) {
    console.log(error.message);
  }
}

onMounted(async () => {
  stripe.value = await loadStripe(
    "pk_test_51PbaP8JlehMaIxjHdvmBnV8l6Xck9klkPSUuTuwlyXwT1sh2etRbmUT2dMjCbWbfuy24TdZhDIATHH0MyPj2ORZe00pM0fsWBY"
  );
});
</script>
<style scope>
.mainDiv {
  margin-top: 100px;
}
</style>
