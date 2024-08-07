export const mutations = {
  SET_AUTH(state, payload) {
    state.isLoggedIn = true;
    state.role = payload.role;
    state.token = payload.token;
  },
  RESET_AUTH(state) {
    state.isLoggedIn = false;
    state.role = null;
    state.token = null;
  },
  GET_SEARCHED_BUSES(state, payload) {
    state.searchedBuses = payload.data;
  },
};
