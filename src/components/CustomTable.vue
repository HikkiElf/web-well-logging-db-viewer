<script setup>
    import { defineProps } from 'vue';
    const {data} = defineProps(['data'])
    console.log(data.value)

</script>

<template>
    <table>
        <tr>
            <th>ID</th>
            <th>X</th>
            <th>Y</th>
        </tr>
        <tr v-for="nums in 100">
            <td>{{ nums }}</td>
            <td>{{ nums }}</td>
            <td>{{ nums }}</td>
        </tr>
    </table>
</template>