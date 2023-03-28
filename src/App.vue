<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <main>
    <header id="top">
      <h1>"Project name" : "area name"</h1>
    </header>
    <div id="bottom">
      <section class="left section">
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
        <button>Button</button>
      </section>
      <section class="right section">
        <h1>TABLE</h1>
      </section>
    </div>
  </main>
  
</template>

<style lang="scss" scoped>

main{
  margin: 0 auto;
}

header {
  position: relative;
  background-color: black;
  border: 5px solid var(--test-border-color);
  text-align: center;
}
h1 {
  font-size: 28px;
}
#bottom {
  display: flex;
  border: 5px solid var(--test-border-color);
}

.right.section{
  position: absolute;
  border: 5px solid red;
  right: 5px;
}

.left.section {
  display: flex;
  flex-direction: column;
  border: 5px solid greenyellow;
}

</style>
