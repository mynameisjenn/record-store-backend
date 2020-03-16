import Vue from 'vue'
// import axios from 'axios'
// import VueAxios from 'vue-axios'
import Router from 'vue-router'
import Signin from '@/components/Signin.vue'
// Vue.use(VueAxios, axios)
Vue.use(Router)

export default new Router({
  mode: 'history',	
  routes: [
    {
      path: '/',
      name: 'Signin',
      component: Signin
    }
  ]
})
