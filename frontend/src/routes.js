import { createWebHistory, createRouter } from "vue-router";
const routes = [
  {
    name: "Login",
    component: () => import("./components/login.vue"),
    path: "/",
  },
  {
    name: "Register",
    component: () => import("./components/register.vue"),
    path: "/register",
  },
  {
    name: "MyBookings",
    component: () => import("./components/myBookings.vue"),
    path: "/myBooking",
    meta: { requiredAuth: true },
  },
  {
    name: "HomePage",
    component: () => import("./components/homePage.vue"),
    path: "/home",
    meta: { requiredAuth: true },
  },
  {
    name: "AllBuses",
    component: () => import("./components/AllBuses.vue"),
    path: "/buses",
    meta: { requiredAuth: true },
  },
  {
    name: "SearchedBuses",
    component: () => import("./components/searchedBuses.vue"),
    path: "/searchedBuses",
    meta: { requiredAuth: true },
  },
  {
    name: "BookTicket",
    component: () => import("./components/bookTicket.vue"),
    path: "/bookTicket",
    meta: { requiredAuth: true },
  },
  {
    name: "PaymentSuccess",
    component: () => import("./components/paymentSuccess.vue"),
    path: "/showTicket",
    meta: { requiredAuth: true },
  },
  {
    name: "PaymentFail",
    component: () => import("./components/paymentFail.vue"),
    path: "/paymentFail",
    meta: { requiredAuth: true },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
