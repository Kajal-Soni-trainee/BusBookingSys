<template>
  <v-layout class="overflow-visible" style="height: 56px">
    <v-bottom-navigation
      class="bg-deep-orange-darken-1"
      color="yellow-lighten-5"
      grow
    >
      <template v-if="role == 0">
        <v-btn to="/home">
          <v-icon>mdi-home-outline</v-icon>

          Home
        </v-btn>

        <v-btn to="/myBooking">
          <v-icon>mdi-book-account</v-icon>

          Booking
        </v-btn>

        <v-btn to="/buses">
          <v-icon>mdi-bus</v-icon>

          Bus
        </v-btn>
      </template>
      <template v-if="role == 1">
        <v-btn>
          <v-icon>mdi-history</v-icon>

          All Buses
        </v-btn>

        <v-btn>
          <v-icon>mdi-heart</v-icon>

          Add Bus
        </v-btn>

        <v-btn>
          <v-icon>mdi-map-marker</v-icon>

          Add Conductors
        </v-btn>
      </template>
    </v-bottom-navigation>
  </v-layout>
</template>

<script setup>
import { useStore } from "vuex";
import { computed } from "vue";
const store = useStore();
const role = computed(() => {
  return store.state.users.role;
});
</script>
<style scoped></style>
