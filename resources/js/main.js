import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'

// library.add(faMagnifyingGlass,fas)
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Add all icon packs
library.add(fas)

const pinia = createPinia()

const app = createApp(App)
app.use(pinia)
app.config.devtools = false
app.use(router);
app.component('FontAwesomeIcon', FontAwesomeIcon)
app.mount('#app');
