<template>
  <div class="mainDiv d-flex flex-column justify-center align-center">
    <v-card
      width="1000px"
      class="pa-5"
      style="border: 3px solid rgb(246, 126, 83)"
      :elevation="12"
    >
      <v-text-field
        v-model="searchData.source"
        color="deep-orange-darken-1"
        label="From"
      ></v-text-field>
      <v-text-field
        v-model="searchData.destination"
        color="deep-orange-darken-1"
        label="To"
      ></v-text-field>

      <div class="d-flex flex-row justify-center align-center">
        <v-btn class="bg-deep-orange-darken-1" @click="search">Search</v-btn>
      </div>
    </v-card>
  </div>
</template>
<script setup>
import { reactive } from "vue";
import { useStore } from "vuex";
import { useRouter } from "vue-router";
const router = useRouter();
const store = useStore();
const searchData = reactive({
  source: null,
  destination: null,
});

async function search() {
  await store.dispatch("triggerGetSearchedBuses", searchData);
  router.push({
    name: "SearchedBuses",
    query: { source: searchData.source, dest: searchData.destination },
  });
}
</script>
<style scope>
.mainDiv {
  margin-top: 200px;
}
</style>
