<template>
  <div class="d-flex flex-column justify-center align-center mainDiv">
    <h1 class="text-center">Welcome</h1>
    <v-card
      width="1000px"
      class="pa-5"
      style="border: 2px solid rgb(246, 126, 83)"
    >
      <v-text-field
        label="email"
        color="deep-orange-darken-1"
        v-model="loginData.email"
      ></v-text-field>
      <v-text-field
        label="password"
        color="deep-orange-darken-1"
        v-model="loginData.password"
      ></v-text-field>
      <div>
        <v-btn variant="outlined" color="deep-orange-darken-1" @click="login"
          >Login</v-btn
        >
      </div>
    </v-card>
    <p class="text-right text-deep-orange-darken-1">Forgot Password?</p>
    <v-divider></v-divider>
    <div class="pa-8">
      <p class="text-center text-h5">Don't have an account ?</p>
      <p class="text-center text-deep-orange-darken-1" @click="createAccount">
        Create new Account
      </p>
    </div>
  </div>
</template>
<script setup>
import { useRouter } from "vue-router";
import { reactive } from "vue";
import { useStore } from "vuex";
const store = useStore();
const router = useRouter();
const loginData = reactive({
  email: null,
  password: null,
});

function createAccount() {
  router.push({ name: "Register" });
}

async function login() {
  await store.dispatch("triggerSetAuth", loginData);
  router.push({ name: "HomePage" });
}
</script>
<style scope>
.mainDiv {
  margin-top: 200px;
}
</style>
