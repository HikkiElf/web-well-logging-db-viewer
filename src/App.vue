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
  <main>
    <header id="top">
      <h1>"Project name" : "area name"</h1>
    </header>
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
    <div id="picket-info">
      <h1>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur laudantium labore quae eum fuga, quod recusandae animi ut rem voluptatum beatae veniam molestiae quis. Nam ipsum est debitis iste animi!</h1>
    </div>
  </main>
  
</template>

<style lang="scss" scoped>

</style>
