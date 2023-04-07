<script setup>
import { useRouter } from "vue-router";
import { useLoginPassword } from "../data/loginPassword";
import axios from "axios";

const { loginPassword } = useLoginPassword();
let response = [];
const router = useRouter();
const Auth = async (login, password) => {
    try {
        response = await axios.get(
            `https://well-logging.mrsmori.moe/login?login=${login}&password=${password}`,
            { withCredentials: true }
        );
        if (response.data.is_error == true) {
            alert(response.data.error_texts);
        } else {
            router.push("/");
        }
    } catch (er) {
        alert("Please insert login and password");
    }
};
</script>
<template>
    <main>
        <div class="inputs-container">
            <h2>Input your login:</h2>
            <input type="text" v-model="loginPassword.login" placeholder="Login" class="Login" />
            <h2>Input your password:</h2>
            <input type="password" v-model="loginPassword.password" placeholder="Pass" class="Password" />
            <button @click="Auth(loginPassword.login, loginPassword.password)">
                Enter
            </button>
        </div>
    </main>
</template>

<style scoped>
main {
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

h2 {
    font-size: 20px;
    margin-bottom: 5px;
}

button {
    appearance: none;
    color: white;
}
</style>
