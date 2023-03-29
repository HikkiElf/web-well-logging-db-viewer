<script setup>
    import { defineProps } from 'vue';
    const {projectData} = defineProps(['projectData'])
    const pickets = projectData[0].areas[0].pickets
    console.log(projectData[0].areas[0].pickets[0].Measurements)
</script>

<template>
    <table>
        <tr>
            <th>ID</th>
            <th>X</th>
            <th>Y</th>
        </tr>
        <tr v-for="picket in pickets" :key="picket.id">
            <td>{{ picket.id }}</td>
            <td>{{ picket.X_picket_coord }}</td>
            <td>{{ picket.Y_picket_coord }}</td>
        </tr>
    </table>
</template>

<style lang="scss" scoped>

table {
    text-align: center;
}

</style>