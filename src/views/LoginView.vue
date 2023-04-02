<script setup>
import { RouterLink } from 'vue-router';
import { ref } from 'vue';
import { useLoginPassword } from '../data/loginPassword';
import { storeToRefs } from 'pinia';

const {loginPassword} = useLoginPassword()
console.log(loginPassword);

// const login = ref("");
// const password = ref("");

const sendLoginPass = (login, password) => {
    console.log(loginPassword);
};




</script>

<template>
    <main>
        <div class="inputs-container">
            <h2>Input your login:</h2>
            <input type="text" v-model="loginPassword.login" placeholder="Login" class="Login">
            <h2>Input your password:</h2>
            <input type="password" v-model="loginPassword.password" placeholder="Pass" class="Password">
            <RouterLink to="/">
                <button @click="sendLoginPass()">Enter</button>
            </RouterLink>
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
    button {
        appearance: none;
        color: white;
    }

</style>