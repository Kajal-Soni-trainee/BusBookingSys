import { axiosPost, axiosGet } from "@/services/service";
export const actions = {
  async triggerSetAuth({ commit }, payload) {
    const result = await axiosPost("/auth/login", payload);
    if (result.status == 200) {
      localStorage.setItem("token", result.data.token);
      localStorage.setItem("role", result.data.role);
      commit("SET_AUTH", result.data);
    }
  },

  async triggerResetAuth({ commit }) {
    console.log("calling reset method");
    commit("RESET_AUTH");
  },

  async triggerGetSearchedBuses({ commit }, payload) {
    const result = await axiosGet(
      `/getBusByRoute/?source=${payload.source}&dest=${payload.destination}`
    );
    commit("GET_SEARCHED_BUSES", { data: result.data });
  },
};
