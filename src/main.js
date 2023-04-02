import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
// import CustomButton from './components/CustomButton.vue'
import router from './router'

import './assets/style.scss'


const pinia = createPinia()
const app = createApp(App)

// app.component('CustomButton', CustomButton)

app.use(pinia)

app.use(router)

app.mount('#app')
