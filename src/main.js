import { createApp } from 'vue'
import App from './App.vue'
import CustomButton from './components/CustomButton.vue'
import router from './router'

import './assets/style.scss'

const app = createApp(App)

app.component('CustomButton', CustomButton)

app.use(router)

app.mount('#app')
