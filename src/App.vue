<script>
import { RouterLink, RouterView } from 'vue-router'
import CustomButton from './components/CustomElements/CustomButton.vue';
export default {
  components:{
    CustomButton
  }
}
</script>

<template>
  <header id="top">
    <h1>"Project name" : "area name"</h1>
  </header>
  <main>
    <div id="bottom">
      <section class="left section">
        <div id="left-btn-side">
          <custom-button>Button</custom-button>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
        </div>
        <div id="right-btn-side">
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
          <CustomButton>Button</CustomButton>
        </div>
      </section>
      <section class="center section">
        <div id="picket-info">
          <h1>Picket id: 1</h1>
          <h1>Electric resistance: 2.534</h1>
          <h1>Layer density: 43</h1>
          <h1>Gamma ray: 0.0234</h1>
          <h1>Magnetic field: 4.325</h1>
        </div>
      </section>
      <section class="right section">
        <table>
          <caption>Pickets</caption>
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">X</th>
              <th scope="col">Y</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>
            <tr>
              <th scope="row" class="rowHead">1</th>
              <td>1</td>
              <td>3</td>
            </tr>

         
          </tbody>
        </table>
      </section>
    </div>
  </main>
  
</template>

<style lang="scss" scoped>

</style>
