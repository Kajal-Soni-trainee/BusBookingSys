<template>
  <div class="d-flex flex-column justify-center align-center mainDiv">
    <h1 class="text-center pa-5">Create an Account</h1>
    <v-card
      width="1000px"
      class="pa-5"
      style="border: 2px solid rgb(246, 126, 83)"
    >
      <v-text-field
        label="First Name"
        color="deep-orange-darken-1"
        v-model="userData.firstName"
      ></v-text-field>
      <v-text-field
        label="Last Name"
        color="deep-orange-darken-1"
        v-model="userData.lastName"
      ></v-text-field>
      <v-text-field
        label="Email"
        color="deep-orange-darken-1"
        v-model="userData.email"
      >
      </v-text-field>
      <v-text-field
        label="Contact"
        color="deep-orange-darken-1"
        v-model="userData.contact"
      ></v-text-field>
      <v-radio-group v-model="userData.gender">
        <v-radio
          color="deep-orange-darken-1"
          label="Male"
          value="male"
        ></v-radio>
        <v-radio
          color="deep-orange-darken-1"
          label="Female"
          value="female"
        ></v-radio>
        <v-radio
          color="deep-orange-darken-1"
          label="Others"
          value="others"
        ></v-radio>
      </v-radio-group>
      <v-text-field
        color="deep-orange-darken-1"
        label="Password"
        v-model="userData.password"
      ></v-text-field>
      <v-text-field
        color="deep-orange-darken-1"
        label="Confirm Password"
        v-model="userData.cpassword"
      ></v-text-field>
      <div class="d-flex flex-row align-center justify-center">
        <v-btn variant="outlined" color="deep-orange-darken-1" @click="register"
          >Create Account</v-btn
        >
      </div>
    </v-card>
  </div>
</template>
<script setup>
import { reactive } from "vue";
import { axiosPost } from "../services/service";
const userData = reactive({
  firstName: null,
  lastName: null,
  gender: null,
  email: null,
  password: null,
  cpassword: null,
  contact: null,
});

async function register() {
  const result = await axiosPost("/user/register", userData);
  if (result.status == 200) {
    console.log(result);
  }
}
</script>
<style scope>
.mainDiv {
  margin-top: 100px;
}
</style>
