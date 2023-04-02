<script setup>

</script>

<template>
    <main>
        <div class="inputs-container">
            <h2>Input your login:</h2>
            <input type="text" placeholder="Login">
            <h2>Input your password:</h2>
            <input type="password" placeholder="Pass">
        </div>
    </main>

</template>

<style scoped>
    main{
        display: flex;
        /* border: 2px solid aliceblue; */
        height: 80dvh;
    }
    .inputs-container {
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        /* align-items: center; */
        justify-content: center;
        /* border: 2px solid red; */
    }
    input {
        border: 2px solid white;
        border-radius: 8px;
        margin-bottom: 20px;
        padding: 10px 10px 5px 5px;
    }
    h2{
        font-size: 20px;
    }

</style>