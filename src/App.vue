<script>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <main>
    <header id="top">
      <h1>"Project name" : "area name"</h1>
    </header>
    <div id="bottom">
      <section class="left section">
        <div id="left-btn-side">
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
        </div>
        <div id="right-btn-side">
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
          <button>Button</button>
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
              <th scope="row">1</th>
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

main{
  margin: 0 auto;
}

header {
  position: relative;
  text-align: center;
}
h1 {
  font-size: 28px;
}
#bottom {
  display: flex;
}

caption{
  caption-side: left;
}

.right.section{
  position: absolute;
  // border: 5px solid red;
  right: 5px;
}

.left.section {
  display: flex;
  // border: 5px solid greenyellow;
}

td{
  text-align: center;
}

table {
  font-size: 28px;
}

#right-btn-side, #left-btn-side {
  display: flex;
  flex-direction: column;
  border: 1px dotted silver;
  margin: 5px;
}

</style>
