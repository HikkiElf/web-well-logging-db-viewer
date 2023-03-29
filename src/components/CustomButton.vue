<script>
export default{
}

</script>


<template>
    <button>
        <slot/>
    </button>
</template>

<style lang="scss" scoped>
button {
    padding: 10px 15px;
    margin: 5px;
    background: var(--btn-bg-color);
    border-radius: 8px;
    text-align: center;
    text-decoration: none;
    transition: transform .05s ease-in-out;
}

@media (min-width: 500px) {
    button:hover {
        transform: scale(1.1);
    }
}

button:active{
    background: var(--btn-bg-color);
    transform: scale(0.9);
    // transition: transform .05s;
}



</style>
