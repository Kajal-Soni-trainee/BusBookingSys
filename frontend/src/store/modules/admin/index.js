import { state } from "./state";
import { getters } from "./getters";
import { actions } from "../users/actions";
import { mutations } from "./mutations";

export const admin = {
  state,
  getters,
  mutations,
  actions,
};
