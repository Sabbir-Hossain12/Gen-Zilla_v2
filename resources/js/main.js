import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'

// import { library } from '@fortawesome/fontawesome-svg-core'
// import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
// import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
// import { fas } from '@fortawesome/free-solid-svg-icons'

// library.add(faMagnifyingGlass,fas)
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
// import { far } from '@fortawesome/free-regular-svg-icons'
// import { fab } from '@fortawesome/free-brands-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Add all icon packs
library.add(fas)

const app = createApp(App)
app.config.devtools = false
app.use(router);
app.component('FontAwesomeIcon', FontAwesomeIcon)
app.mount('#app');
