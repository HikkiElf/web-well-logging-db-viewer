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
}
</style>
